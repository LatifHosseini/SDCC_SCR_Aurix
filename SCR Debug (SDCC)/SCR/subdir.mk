################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SCR/main.c \
../SCR/rtc_init.c \
../SCR/scr_adc.c 

OBJS += \
./SCR/main.o \
./SCR/rtc_init.o \
./SCR/scr_adc.o 


# Each subdirectory must supply rules for building sources it contributes
SCR/%.o: ../SCR/%.c SCR/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: SDCC Compiler'
	sdcc --asm-scr -c --model-large -I"C:\Users\La\Desktop\TC375_Eval_board\SDCC_SCR_TC375_Aurix\SDCC_SCR_TC375_Aurix\SCR" --std-sdcc99 --nooverlay --no-peep-return --opt-code-speed  "$<" -o "$@"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-SCR

clean-SCR:
	-$(RM) ./SCR/main.o ./SCR/rtc_init.o ./SCR/scr_adc.o

.PHONY: clean-SCR

