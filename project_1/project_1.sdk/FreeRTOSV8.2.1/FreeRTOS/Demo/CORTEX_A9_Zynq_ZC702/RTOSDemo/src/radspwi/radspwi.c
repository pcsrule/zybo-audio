/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"

// drivers
#include "xil_printf.h"
#include "xiicps.h"
#define IIC_SLAVE_ADDR		0b0011010
#define IIC_SCLK_RATE		100000
#define AUDIO_IIC_ID XPAR_XIICPS_0_DEVICE_ID

/* Priorities at which the tasks are created. */
#define IIC_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )

/*-----------------------------------------------------------*/

// Tasks
static void AudioInitialize(void *pvParameters);

/*-----------------------------------------------------------*/

// Audio codec config function prototypes
static int AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData);

// Globals
static XIicPs Iic;

/*-----------------------------------------------------------*/

void main_radspwi(void) {

	// start codec configuration task
	xTaskCreate(AudioInitialize, "IIC", configMINIMAL_STACK_SIZE, NULL,
			IIC_TASK_PRIORITY, NULL);

	xil_printf("about to start task\r\n");

	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	for (;;)
		;
}
/*-----------------------------------------------------------*/

static void AudioInitialize(void *pvParameters) {
	int Status;
	XIicPs_Config *iicConfig;

	(void) pvParameters;

	/*
	 * Initialize the IIC driver
	 * Look up the configuration in the config table,
	 * then initialize it.
	 */
	xil_printf("started task\r\n");

	iicConfig = XIicPs_LookupConfig(AUDIO_IIC_ID);
	if (NULL == iicConfig) {
		return;
	}

	Status = XIicPs_CfgInitialize(&Iic, iicConfig, iicConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		return;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XIicPs_SelfTest(&Iic);
	if (Status != XST_SUCCESS) {
		return;
	}

	/*
	 * Set the IIC serial clock rate.
	 */
	Status = XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);
	if (Status != XST_SUCCESS) {
		return;
	}

	xil_printf("set up IIC\r\n");

	/*
	 * Write to the SSM2603 audio codec registers to configure the device. Refer to the
	 * SSM2603 Audio Codec data sheet for information on what these writes do.
	 */
	Status = AudioRegSet(&Iic, 15, 0b000000000); //Perform Reset
	vTaskDelay(75);
	Status |= AudioRegSet(&Iic, 6, 0b000110000); //Power up
	Status |= AudioRegSet(&Iic, 0, 0b100010111); //Unmute left and right input
	Status |= AudioRegSet(&Iic, 2, 0b101111001); //unmute headphone output
	Status |= AudioRegSet(&Iic, 4, 0b000010100); //set up audio routing
	Status |= AudioRegSet(&Iic, 5, 0b000000110); //filtering options
	Status |= AudioRegSet(&Iic, 7, 0b000001010); //set 24-bit word and i2s
	Status |= AudioRegSet(&Iic, 8, 0b000000000); //clock modes
	vTaskDelay(75);
	Status |= AudioRegSet(&Iic, 9, 0b000000001); //set active
	Status |= AudioRegSet(&Iic, 6, 0b000100000); //enable output

	if (Status != XST_SUCCESS)
		xil_printf("codec configuration failed\r\n");
	else
		xil_printf("configured codec\r\n");
}

/***	AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData)
 **
 **	Parameters:
 **		IIcPtr - Pointer to the initialized XIicPs struct
 **		regAddr - Register in the SSM2603 to write to
 **		regData - Data to write to the register (lower 9 bits are used)
 **
 **	Return Value: int
 **		XST_SUCCESS if successful
 **
 **	Errors:
 **
 **	Description:
 **		Writes a value to a register in the SSM2603 device over IIC.
 **
 */
static int AudioRegSet(XIicPs *IIcPtr, u8 regAddr, u16 regData) {
	int Status;
	u8 SendBuffer[2];

	SendBuffer[0] = regAddr << 1;
	SendBuffer[0] = SendBuffer[0] | ((regData >> 8) & 0b1);

	SendBuffer[1] = regData & 0xFF;

	Status = XIicPs_MasterSendPolled(IIcPtr, SendBuffer, 2, IIC_SLAVE_ADDR);
	if (Status != XST_SUCCESS) {
		xil_printf("IIC send failed\n\r");
		return XST_FAILURE;
	}
	/*
	 * Wait until bus is idle to start another transfer.
	 */
	while (XIicPs_BusIsBusy(IIcPtr)) {
		taskYIELD();
	}
	return XST_SUCCESS;

}
