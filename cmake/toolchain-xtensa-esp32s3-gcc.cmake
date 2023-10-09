find_program(CMAKE_C_COMPILER NAMES xtensa-esp32s3-elf-gcc)
find_program(CMAKE_CXX_COMPILER NAMES xtensa-esp32s3-elf-g++)
find_program(CMAKE_ASM_COMPILER NAMES xtensa-esp32s3-elf-gcc)
find_program(CMAKE_OBJCOPY NAMES xtensa-esp32s3-elf-objcopy)
find_program(CMAKE_SIZE NAMES xtensa-esp32s3-elf-size)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR esp32)
