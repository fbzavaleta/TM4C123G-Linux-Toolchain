# TM4C123G-Linux-Toolchain

**Open-Source Toolchain for Programming, Flashing, and Debugging ARM TM4C123G Microcontrollers in a Generic IDE**

## Overview

The TM4C123G-Linux-Toolchain is a robust and open-source toolkit specifically designed for programming, flashing, and debugging ARM TM4C123G microcontrollers. It seamlessly integrates with common integrated development environments (IDEs) while providing the power and flexibility necessary for efficient TM4C123G microcontroller development. Currently, the toolchain supports the TM4C123GH6PM 32-bit microcontroller, enabling the development of firmware based on registers and utilizing the TivaWare framework.

## Key Features

- **Programming**: Effortlessly program your TM4C123G microcontrollers directly from your favorite generic IDE. Both the register and TivaWare approaches are supported

- **Flashing**: comand based  flashing process, allowing you to deploy your applications effortlessly.

- **Debugging**: Debug your TM4C123G projects with precision and reliability, using one single comTM4C123G-Linux-Toolchainand.

- **IDE Compatibility**: Designed to work seamlessly with generic IDEs, making it accessible and adaptable for a wide range of development workflows.

- **Open Source**: Released under the permissive MIT License, granting you the freedom to use, modify, and distribute it for both personal and commercial use.

## How this started

When i was doing my master degree in embedded systems, I realized that there were especific IDEs for each hardware platform and a minumum support to linux user. I love freedom, this is the main reason to started this project.  

## Setup

First install all the dependencies, for archlinux users:

```sh
sudo pacman -Syu && sudo pacman -S flex bison libgmp gmp mpc mpfr ncurses autoconf texinfo base-devel make ftgl python-yaml zlib libtool libusb
```

Now install the debugger tool:

```sh
git clone https://github.com/openocd-org/openocd.git &&  cd openocd && ./bootstrap && ./configure && make
```
Then you need to install the the gcc-arm-none-eabi compiler [here](https://launchpad.net/gcc-arm-embedded/+download) and install in your linux system.

Clone the repository in your system and install the flashing tool:

```sh
cd ~/where-this-repo-was-cloned && git clone https://github.com/utzig/lm4tools.git && cd lm4tools/lm4flash && make
```
Now in the Makefile of the root project, modifique the paths from the user configuration like:

```sh
ROOT_PROJECT = /home/francis/Desktop/TM4C123G-Linux-Toolchain
LM4FLASH_PATH = /home/francis/Desktop/TM4C123G-Linux-Toolchain/lm4tools/lm4flash
```

We are done! the enviroment is ready, now you can execute:

```sh
make clean #to clean the binaries
make  #to build and generate the binary of the firmware
make flash #for flashing your device
make debug #for debugging using openocd
```

## Acknowledgments

We extend our gratitude to the developers and contributors of the open-source tools and libraries that underpin this project's functionality. This project was inspired in the tiva-template repository from uctools and Recursive Labs.
