# esp32s3 submodule of [mcu-framework](https://github.com/yhsb2k/mcu-framework)

[![build](https://github.com/yhsb2k/esp32s3/workflows/build/badge.svg)](https://github.com/yhsb2k/esp32s3/actions?workflow=build)
[![license](https://img.shields.io/github/license/yhsb2k/esp32s3?color=blue)](https://github.com/yhsb2k/esp32s3/blob/master/LICENSE)

## How to build
```powershell
git clone --recursive https://github.com/yhsb2k/esp32s3.git
cd esp32s3
# Install python dependencies:
# python -m pip install --upgrade pip
# python third_party/esp-idf/tools/idf_tools.py install-python-env
# python -m pip install -r third_party/esp-idf/tools/requirements/requirements.core.txt
make
```
**Other targets:**
```
make flash - Upload firmware to the target
make erase - Erase all memory on the target
make reset - Reset the target
```

## Requirements
* [GNU Xtensa (ESP32-S3) Embedded Toolchain](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-tools.html#xtensa-esp32s3-elf)
* [CMake](https://cmake.org/download)
* [Make](https://winlibs.com)
* [Ninja](https://ninja-build.org)
* [Python3](https://www.python.org/downloads)
