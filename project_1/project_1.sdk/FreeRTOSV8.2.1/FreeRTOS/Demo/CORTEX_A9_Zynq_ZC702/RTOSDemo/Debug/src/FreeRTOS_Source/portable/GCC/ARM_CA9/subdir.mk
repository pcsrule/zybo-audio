################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9/port.c 

S_UPPER_SRCS += \
/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9/portASM.S 

OBJS += \
./src/FreeRTOS_Source/portable/GCC/ARM_CA9/port.o \
./src/FreeRTOS_Source/portable/GCC/ARM_CA9/portASM.o 

S_UPPER_DEPS += \
./src/FreeRTOS_Source/portable/GCC/ARM_CA9/portASM.d 

C_DEPS += \
./src/FreeRTOS_Source/portable/GCC/ARM_CA9/port.d 


# Each subdirectory must supply rules for building sources it contributes
src/FreeRTOS_Source/portable/GCC/ARM_CA9/port.o: /home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9/port.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/standalone_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/portable/GCC/ARM_CA9/portASM.o: /home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9/portASM.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/new_vivado/radspwi/project_1/project_1.sdk/standalone_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


