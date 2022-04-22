# Tasmota ESP32 Arduino Lib Builder [![GitHub Releases](https://img.shields.io/github/downloads/Jason2866/esp32-arduino-lib-builder/total?label=downloads&color=%231FA3EC&style=for-the-badge)](https://github.com/Jason2866/esp32-arduino-lib-builder/releases/latest)

This repository contains the scripts that produce the libraries included with esp32-arduino.

Tested on Ubuntu (32 and 64 bit), Raspberry Pi and MacOS.

### Build on Ubuntu and Raspberry Pi
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
sudo pip install --upgrade pip
git clone https://github.com/espressif/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```
