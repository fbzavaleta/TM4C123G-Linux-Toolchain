# Tiva Makefile
# #####################################
#
# Part of the uCtools project
# uctools.github.com
# Modified by: fbzavaleta on 2023-09-30
#######################################
# user configuration:
#######################################


# TARGET: name of the output file
TARGET = main
# MCU: part number to build for
MCU = TM4C123GH6PM
# SOURCES: list of input source sources
SOURCES = main.c startup_gcc.c system_TM4C123.c clib.c
# INCLUDES: list of includes, by default, use Includes directory
INCLUDES = -IInclude
# OUTDIR: directory to use for output
OUTDIR = build
# TIVAWARE_PATH: path to tivaware folder & lm4flash
ROOT_PROJECT = /home/francis/Desktop/TM4C123G-Linux-Toolchain
LM4FLASH_PATH = /home/francis/TexasIn/lm4tools/lm4flash


#######################################
# end of user configuration
#######################################


#Toolchain paths
TIVAWARE_PATH = $(ROOT_PROJECT)/tivaware
# LD_SCRIPT: linker script
LD_SCRIPT = $(MCU).ld
# define flags
CFLAGS = -g -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
CFLAGS +=-Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall
CFLAGS += -pedantic -DPART_$(MCU) -c -I$(TIVAWARE_PATH)
CFLAGS += -DTARGET_IS_BLIZZARD_RA1
LDFLAGS = -T $(LD_SCRIPT) --entry ResetISR --gc-sections

#######################################
# binaries
#######################################
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
AR = arm-none-eabi-ar
AS = arm-none-eabi-as
L4 = $(LM4FLASH_PATH)/lm4flash

BIN_FIRMWARE = $(OUTDIR)/$(TARGET).bin
OBJCOPY = arm-none-eabi-objcopy
RM      = rm -f
MKDIR	= mkdir -p
#######################################
# list of object files, placed in the build directory regardless of source path
OBJECTS = $(addprefix $(OUTDIR)/,$(notdir $(SOURCES:.c=.o)))
# default: build bin
all: $(OUTDIR)/$(TARGET).bin

$(OUTDIR)/%.o: src/%.c | $(OUTDIR)
	$(CC) -o $@ $^ $(CFLAGS)

$(OUTDIR)/a.out: $(OBJECTS)
	$(LD) -o $@ $^ $(LDFLAGS)

$(OUTDIR)/main.bin: $(OUTDIR)/a.out
	$(OBJCOPY) -O binary $< $@

# create the output directory
$(OUTDIR):
	$(MKDIR) $(OUTDIR)

clean:
	-$(RM) $(OUTDIR)/*

flash:
	$(L4) $(BIN_FIRMWARE)

debug: 
	 arm-none-eabi-gdb -ex 'target extended-remote | openocd -f board/ek-tm4c1294xl.cfg -c "gdb_port pipe; log_output openocd.log"; monitor reset; monitor halt'

.PHONY: all clean
