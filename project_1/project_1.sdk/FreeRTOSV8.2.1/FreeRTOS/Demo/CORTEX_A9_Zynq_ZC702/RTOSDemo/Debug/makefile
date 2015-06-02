################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/radspwi/subdir.mk
-include src/lwIP_Demo/lwip-1.4.0/src/netif/subdir.mk
-include src/lwIP_Demo/lwip-1.4.0/src/core/ipv4/subdir.mk
-include src/lwIP_Demo/lwip-1.4.0/src/core/subdir.mk
-include src/lwIP_Demo/lwip-1.4.0/src/api/subdir.mk
-include src/lwIP_Demo/lwIP_port/netif/subdir.mk
-include src/lwIP_Demo/lwIP_port/subdir.mk
-include src/lwIP_Demo/lwIP_Apps/apps/httpserver_raw_from_lwIP_download/subdir.mk
-include src/lwIP_Demo/lwIP_Apps/apps/BasicSocketCommandServer/subdir.mk
-include src/lwIP_Demo/lwIP_Apps/subdir.mk
-include src/lwIP_Demo/subdir.mk
-include src/Full_Demo/Standard-Demo-Tasks/Minimal/subdir.mk
-include src/Full_Demo/FreeRTOS-Plus-CLI/subdir.mk
-include src/Full_Demo/subdir.mk
-include src/FreeRTOS_Source/portable/MemMang/subdir.mk
-include src/FreeRTOS_Source/portable/GCC/ARM_CA9/subdir.mk
-include src/FreeRTOS_Source/subdir.mk
-include src/Blinky_Demo/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
RTOSDemo.elf.size \


# All Target
all: RTOSDemo.elf secondary-outputs

# Tool invocations
RTOSDemo.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM gcc linker'
	arm-xilinx-eabi-gcc -Xlinker --gc-sections -Wl,-T -Wl,../src/lscript.ld -L/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/lib -o "RTOSDemo.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

RTOSDemo.elf.size: RTOSDemo.elf
	@echo 'Invoking: ARM Print Size'
	arm-xilinx-eabi-size RTOSDemo.elf  |tee "RTOSDemo.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) RTOSDemo.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
