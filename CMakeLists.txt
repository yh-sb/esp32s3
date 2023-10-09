cmake_minimum_required(VERSION 3.15)

set(CMAKE_TOOLCHAIN_FILE cmake/toolchain-xtensa-esp32s3-gcc.cmake)

project(esp32s3 C CXX ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)

add_compile_options(
    $<$<NOT:$<COMPILE_LANGUAGE:ASM>>:-mlongcalls>
    -ffunction-sections
    -fdata-sections
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-threadsafe-statics>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>
)

#add_subdirectory(drivers)
#add_subdirectory(periph)

add_executable(${CMAKE_PROJECT_NAME} main.cpp)

# Build esp-idf
include(third_party/esp-idf/tools/cmake/idf.cmake)
idf_build_process(esp32s3
    COMPONENTS freertos nvs_flash esptool_py esp_wifi
    SDKCONFIG_DEFAULTS "${CMAKE_CURRENT_LIST_DIR}/sdkconfig.defaults"
    SDKCONFIG "${CMAKE_BINARY_DIR}/sdkconfig"
)
idf_build_executable(${CMAKE_PROJECT_NAME})

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    #drivers
    #periph
    idf::freertos
    idf::nvs_flash
    idf::esp_wifi
)

target_link_options(${CMAKE_PROJECT_NAME} PRIVATE
    -nostdlib
    -Wl,--gc-sections
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map,--cref
)

add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} ${CMAKE_PROJECT_NAME}
)

# Add targets for flashing, erasing, resetting and debugging
set(ESPTOOL_PARAMS --chip esp32s3)
include(cmake/debug-probes/esptool.cmake)
