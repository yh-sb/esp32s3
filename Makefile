# This makefile is used to shorten build commands.
# You can build the project without it, just calling the CMake manually.

BUILD_DIR ?= build
BUILD_TYPE ?= Debug

.PHONY: flash flash2 erase reset clean

all:
	$(eval export IDF_PATH = $(CURDIR)/third_party/esp-idf)
	cmake . -B$(BUILD_DIR) -G Ninja -DCMAKE_BUILD_TYPE=$(BUILD_TYPE)
	cmake --build $(BUILD_DIR) -j

flash flash2 erase reset:
	$(eval export ESPBAUD = 2000000)
	cmake --build $(BUILD_DIR) --target $@

clean:
	@cmake -E rm -rf $(BUILD_DIR)
