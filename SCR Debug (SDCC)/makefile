################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include SCR/subdir.mk
-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := scr_a2g
BUILD_ARTIFACT_EXTENSION :=
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
scr_a2g.elf \


# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: scr_a2g

# Tool invocations
scr_a2g: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: SDCC Object copy CArray'
	i51-elf-objcopy -O carray --osize 1 --otyp uint8_t --odef "scr_a2g".h --comments --hinc --xtern --olbl scr_xram --closegaps --hstdint $(EXECUTABLES) "scr_a2g".c
	@echo 'Finished building target: $@'
	@echo ' '

scr_a2g.elf: $(OBJS) makefile $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: SDCC Linker'
	i51-elf-ld -T"../SCR/scr.ld" --gc-sections -L"C:\Infineon\AURIX-Studio-1.9.12\tools\Compilers\sdcc_421/share/sdcc/lib/large" -lsdcc -lmcs51 -lint -lsdcc -llonglong -llong -lint -lfloat -Map="scr_a2g.map"  $(OBJS)  -o  "scr_a2g.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	find . ! -name "*.mk" ! -name "makefile" ! -name "." -type f -delete 
	-@echo ' '

post-build:
	-cp *.c ../ && cp *.h ../
	-@echo ' '

.PHONY: all clean dependents main-build post-build

-include ../makefile.targets
