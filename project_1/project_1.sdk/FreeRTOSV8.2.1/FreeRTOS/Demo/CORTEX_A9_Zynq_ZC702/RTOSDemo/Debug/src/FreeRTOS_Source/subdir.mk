################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/croutine.c \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/event_groups.c \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/list.c \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/queue.c \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/tasks.c \
/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/timers.c 

OBJS += \
./src/FreeRTOS_Source/croutine.o \
./src/FreeRTOS_Source/event_groups.o \
./src/FreeRTOS_Source/list.o \
./src/FreeRTOS_Source/queue.o \
./src/FreeRTOS_Source/tasks.o \
./src/FreeRTOS_Source/timers.o 

C_DEPS += \
./src/FreeRTOS_Source/croutine.d \
./src/FreeRTOS_Source/event_groups.d \
./src/FreeRTOS_Source/list.d \
./src/FreeRTOS_Source/queue.d \
./src/FreeRTOS_Source/tasks.d \
./src/FreeRTOS_Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
src/FreeRTOS_Source/croutine.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/croutine.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/event_groups.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/event_groups.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/list.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/list.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/queue.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/queue.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/tasks.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/tasks.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/FreeRTOS_Source/timers.o: /home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/timers.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/lwIP_Demo/lwIP_port/netif" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Source/portable/GCC/ARM_CA9" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include/ipv4" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/ethernet/lwip-1.4.0/src/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src/Full_Demo" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/Common/include" -I"/home/nolan/Documents/Vivado/project_1/project_1.sdk/FreeRTOSV8.2.1/FreeRTOS/Demo/CORTEX_A9_Zynq_ZC702/RTOSDemo/src" -c -fmessage-length=0 -Wextra -ffunction-sections -fdata-sections -I/home/nolan/Documents/Vivado/project_1/project_1.sdk/RTOSDemo_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


