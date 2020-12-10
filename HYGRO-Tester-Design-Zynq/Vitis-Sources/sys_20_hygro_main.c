/*------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (c) 2020 Timothy Stotts
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
------------------------------------------------------------------------------*/
/**-----------------------------------------------------------------------------
 * @file sys_20_hygro_main.c
 *
 * @brief An APSoC top-level design with Pmod HYGRO sensor reading and display.
 * This design operates the Pmod HYGRO to read sensor values, and then outputs
 * display indications and values on the Pmod SSD, Pmod CLS, and board LEDs.
 *
 * @author
 * Timothy Stotts (timothystotts08@gmail.com)
 *
 * @copyright
 * (c) 2020 Copyright Timothy Stotts
 *
 * This program is free software; distributed under the terms of the MIT
 * License.
------------------------------------------------------------------------------*/

#include <stdio.h>
#include <unistd.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "PmodCLS.h"
#include "PmodHYGRO.h"
#include "MuxSSD.h"
#include "led_pwm.h"

/* Global constants */
#define TIMER_FREQ_HZ 50000000
#define USERIO_DEVICE_ID 0
#define SWTCHS_SWS_MASK 0x0F
#define SWTCH_SW_CHANNEL 1
#define SWTCH0_MASK 0x01
#define SWTCH1_MASK 0x02
#define SWTCH2_MASK 0x04
#define SWTCH3_MASK 0x08
#define BTNS_SWS_MASK 0x0F
#define BTNS_SW_CHANNEL 2
#define BTN0_MASK 0x01
#define BTN1_MASK 0x02
#define BTN2_MASK 0x04
#define BTN3_MASK 0x08

/* Global constants */
#define CAPTURED_STRING_LENGTH 11

typedef enum {
	OP_NONE,
	OP_POLL_HYGRO,
	OP_UNKNOWN
} t_op_mode;

typedef enum {
	DISP_NONE,
	DISP_BOTH_CELCIUS,
	DISP_BOTH_FARH,
	DISP_ONLY_TEMP_C,
	DISP_ONLY_TEMP_F,
	DISP_ONLY_HUMID,
	DISP_UNKNOWN
} t_display_mode;

/* Global types */
typedef struct T_EXPERIMENT_DATA_TAG
{
	/* Driver objects */
	XGpio axGpio;
	PmodCLS clsDevice;
	PmodHYGRO hygroDevice;
	u8 ssdDigitRight;
	u8 ssdDigitLeft;
	/* LED driver palettes stored */
	t_rgb_led_palette_silk ledUpdate[8];
	/* GPIO reading values at this point in the execution */
	u32 switchesRead;
	u32 buttonsRead;
	u32 switchesReadPrev;
	u32 buttonsReadPrev;
	/* HYGRO Sensor data read */
	float temp_degc;
	float temp_degf;
	float hum_perrh;
	/* CLS display text lines */
	char szInfo1[32];
	char szInfo2[32];
	/* Operational state */
	t_op_mode opMode;
	t_display_mode dispMode;
} t_experiment_data;

/* Function prototypes */
static void Experiment_LEDsInitialize(t_experiment_data* expData);
static void Experiment_UserIOInitialize(t_experiment_data* expData);
static void Experiment_HYGROInitialize(t_experiment_data* expData);
static void Experiment_CLSInitialize(t_experiment_data* expData);
static void Experiment_7SDInitialize(t_experiment_data* expData);
static void Experiment_PeripheralsInitialize(t_experiment_data* expData);
static void Experiment_SetLedUpdate(t_experiment_data* expData,
		uint8_t silk, uint8_t red, uint8_t green, uint8_t blue);
static void Experiment_HYGROReadSensor(t_experiment_data* expData);
static void Experiment_UpdateCLSDisplay(t_experiment_data* expData);
static u8 Experiment_convertValueToSSD(u8 value);
static void Experiment_updateSSD(t_experiment_data* expData);

/* Global variables */
t_experiment_data experiData; // Global as that the object is always in scope, including interrupt handler.

/*-----------------------------------------------------------*/
/* Helper function to initialize Experiment Data. */
static void Experiment_Initialize(t_experiment_data* expData)
{
	expData->switchesRead = 0x00000000;
	expData->buttonsRead = 0x00000000;
	expData->switchesReadPrev = 0x00000000;
	expData->buttonsReadPrev = 0x00000000;
	expData->opMode = OP_UNKNOWN;
	expData->dispMode = DISP_UNKNOWN;
}

/*-----------------------------------------------------------*/
/* Helper function to set an updated state to one of the 8 LEDs. */
static void Experiment_SetLedUpdate(t_experiment_data* expData,
		uint8_t silk, uint8_t red, uint8_t green, uint8_t blue)
{
	if (silk < 8) {
		expData->ledUpdate[silk].ledSilk = silk;
		expData->ledUpdate[silk].rgb.paletteRed = red;
		expData->ledUpdate[silk].rgb.paletteGreen = green;
		expData->ledUpdate[silk].rgb.paletteBlue = blue;
	}

	if (expData->ledUpdate[silk].ledSilk < 4) {
		if (expData->ledUpdate[silk].rgb.paletteGreen <= 100) {
			SetBasicLedPercent(expData->ledUpdate[silk].ledSilk, 10 * expData->ledUpdate[silk].rgb.paletteGreen);
		}
	} else if ((expData->ledUpdate[silk].ledSilk >= 5) && (expData->ledUpdate[silk].ledSilk <= 6)) {
		SetRgbPaletteLed(expData->ledUpdate[silk].ledSilk, &(expData->ledUpdate[silk].rgb));
	}
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the discrete board LEDs. */
static void Experiment_LEDsInitialize(t_experiment_data* expData)
{
	InitAllLedsOff();
	for (int i = 0; i < 8; ++i)
		Experiment_SetLedUpdate(expData, i, 0, 0, 0);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the input GPIO connected to board Switches and Buttons. */
static void Experiment_UserIOInitialize(t_experiment_data* expData)
{
	XGpio_Initialize(&(expData->axGpio), USERIO_DEVICE_ID);
	XGpio_SelfTest(&(expData->axGpio));
	XGpio_SetDataDirection(&(expData->axGpio), SWTCH_SW_CHANNEL, SWTCHS_SWS_MASK);
	XGpio_SetDataDirection(&(expData->axGpio), BTNS_SW_CHANNEL, BTNS_SWS_MASK);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the Pmod HYGRO device. */
static void Experiment_HYGROInitialize(t_experiment_data* expData)
{
	HYGRO_begin(
		&(expData->hygroDevice),
		XPAR_PMODHYGRO_0_AXI_LITE_IIC_BASEADDR,
		0x40, // Chip address of PmodHYGRO IIC
		XPAR_PMODHYGRO_0_AXI_LITE_TMR_BASEADDR,
		XPAR_PMODHYGRO_0_DEVICE_ID,
		TIMER_FREQ_HZ // Clock frequency of AXI bus, used to convert timer data
	);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the Pmod CLS device. */
static void Experiment_CLSInitialize(t_experiment_data* expData)
{
	CLS_begin(&(expData->clsDevice), XPAR_PMODCLS_0_AXI_LITE_SPI_BASEADDR);
	CLS_DisplayClear(&(expData->clsDevice));
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the Pmod 7SD device. */
static void Experiment_7SDInitialize(t_experiment_data* expData)
{
	expData->ssdDigitRight = 0;
	expData->ssdDigitLeft = 0;

	Experiment_updateSSD(expData);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize each peripheral */
void Experiment_PeripheralsInitialize(t_experiment_data* expData)
{
	Experiment_HYGROInitialize(expData);
	Experiment_CLSInitialize(expData);
	Experiment_7SDInitialize(expData);
	Experiment_LEDsInitialize(expData);
	Experiment_UserIOInitialize(expData);
}

/*-----------------------------------------------------------*/
/* Helper function to read sensor values from the Pmod HYGRO peripheral */
static void Experiment_HYGROReadSensor(t_experiment_data* expData)
{
    expData->temp_degc = HYGRO_getTemperature(&(expData->hygroDevice));
    expData->temp_degf = HYGRO_tempC2F(expData->temp_degc);
    expData->hum_perrh = HYGRO_getHumidity(&(expData->hygroDevice));
}

/*-----------------------------------------------------------*/
/* Helper function to read sensor values from the Pmod HYGRO peripheral */
static void Experiment_UpdateCLSDisplay(t_experiment_data* expData)
{
	CLS_DisplayClear(&(expData->clsDevice));
    CLS_WriteStringAtPos(&(expData->clsDevice), 0, 0, expData->szInfo1);
    CLS_WriteStringAtPos(&(expData->clsDevice), 1, 0, expData->szInfo2);
}

/*-----------------------------------------------------------*/
/* Convert a 4-bit decimal value to a Pmod SSD digit segment
 * on/off bit vector value */
static u8 Experiment_convertValueToSSD(u8 value) {
	u8 ret = 0x00;

	switch(value) {
	case 0:
		ret = 0x3F;
		break;
	case 1:
		ret = 0x06;
		break;
	case 2:
		ret = 0x5B;
		break;
	case 3:
		ret = 0x4F;
		break;
	case 4:
		ret = 0x66;
		break;
	case 5:
		ret = 0x6D;
		break;
	case 6:
		ret = 0x7D;
		break;
	case 7:
		ret = 0x07;
		break;
	case 8:
		ret = 0x7F;
		break;
	case 9:
		ret = 0x67;
		break;
	case 10:
		ret = 0x77;
		break;
	case 11:
		ret = 0x7C;
		break;
	case 12:
		ret = 0x39;
		break;
	case 13:
		ret = 0x5E;
		break;
	case 14:
		ret = 0x79;
		break;
	case 15:
		ret = 0x71;
		break;
	}

	return ret;
}

/*-----------------------------------------------------------*/
/* Update the right and left digits of a PmodSSD */
static void Experiment_updateSSD(t_experiment_data* expData) {
	u32 right = (u32) Experiment_convertValueToSSD(expData->ssdDigitRight);
	u32 left = (u32) Experiment_convertValueToSSD(expData->ssdDigitLeft);

	MUXSSD_mWriteReg(XPAR_MUXSSD_0_S00_AXI_BASEADDR, MUXSSD_S00_AXI_SLV_REG0_OFFSET, right);
	MUXSSD_mWriteReg(XPAR_MUXSSD_0_S00_AXI_BASEADDR, MUXSSD_S00_AXI_SLV_REG1_OFFSET, left);
}

/*-----------------------------------------------------------*/
/* Helper function to read user inputs at this time and select
 * operational and display modes. */
static void Experiment_readUserInputs(t_experiment_data* expData) {
	expData->switchesReadPrev = expData->switchesRead;
	expData->buttonsReadPrev = expData->buttonsRead;

	expData->switchesRead = XGpio_DiscreteRead(&(expData->axGpio), SWTCH_SW_CHANNEL);
	expData->buttonsRead = XGpio_DiscreteRead(&(expData->axGpio), BTNS_SW_CHANNEL);

	if (expData->switchesRead == SWTCH0_MASK)
		expData->opMode = OP_POLL_HYGRO;
	else
		expData->opMode = OP_NONE;

	if ((expData->buttonsReadPrev == 0) && (expData->buttonsRead == BTN0_MASK))
	{
		if ((expData->dispMode == DISP_BOTH_FARH) || (expData->dispMode == DISP_ONLY_TEMP_F))
			expData->dispMode = DISP_BOTH_CELCIUS;
		else
			expData->dispMode = DISP_BOTH_FARH;
	}

	if ((expData->buttonsReadPrev == 0) && (expData->buttonsRead == BTN1_MASK))
	{
		expData->dispMode = DISP_ONLY_TEMP_C;
	}

	if ((expData->buttonsReadPrev == 0) && (expData->buttonsRead == BTN2_MASK))
	{
		expData->dispMode = DISP_ONLY_TEMP_F;
	}

	if ((expData->buttonsReadPrev == 0) && (expData->buttonsRead == BTN3_MASK))
	{
		expData->dispMode = DISP_ONLY_HUMID;
	}

	switch(expData->dispMode)
	{
	case DISP_BOTH_CELCIUS:
		expData->ssdDigitRight = 1;
		expData->ssdDigitLeft = 1;
		break;
	case DISP_BOTH_FARH:
		expData->ssdDigitRight = 1;
		expData->ssdDigitLeft = 2;
		break;
	case DISP_ONLY_TEMP_C:
		expData->ssdDigitRight = 0;
		expData->ssdDigitLeft = 1;
		break;
	case DISP_ONLY_TEMP_F:
		expData->ssdDigitRight = 0;
		expData->ssdDigitLeft = 2;
		break;
	case DISP_ONLY_HUMID:
		expData->ssdDigitRight = 1;
		expData->ssdDigitLeft = 0;
		break;
	default:
		expData->ssdDigitRight = 0;
		expData->ssdDigitLeft = 0;
		break;
	}
}

/* Main routine */
/*-----------------------------------------------------------*/
int main()
{
    init_platform();

	Experiment_Initialize(&experiData);
	Experiment_PeripheralsInitialize(&experiData);

	for(;;)
	{
		/* Process inputs ten times and use this delay amount to
		 * keep processing inputs but pause between iterations of
		 * reading the Pmod HYGRO.
		 */
		for(int j = 0; j < 100; ++j)
		{
			Experiment_readUserInputs(&experiData);
			usleep(10000);
		}

		if (experiData.opMode == OP_POLL_HYGRO)
		{
			Experiment_SetLedUpdate(&experiData, 0, 0, 100, 0);
			Experiment_SetLedUpdate(&experiData, 1, 0, 100, 0);
			Experiment_SetLedUpdate(&experiData, 2, 0, 100, 0);
			Experiment_SetLedUpdate(&experiData, 3, 0, 100, 0);

			Experiment_HYGROReadSensor(&experiData);

			switch(experiData.dispMode)
			{
			case DISP_BOTH_CELCIUS:
				snprintf(experiData.szInfo1, sizeof(experiData.szInfo1),
						"Temp : % 3.4fC", experiData.temp_degc);
				snprintf(experiData.szInfo2, sizeof(experiData.szInfo2),
						"Humid: % 3.4f%%", experiData.hum_perrh);
				Experiment_SetLedUpdate(&experiData, 5, 0, 200, 0);
				Experiment_SetLedUpdate(&experiData, 6, 0, 0, 0);
				break;
			case DISP_BOTH_FARH:
				snprintf(experiData.szInfo1, sizeof(experiData.szInfo1),
						"Temp : % 3.4fF", experiData.temp_degf);
				snprintf(experiData.szInfo2, sizeof(experiData.szInfo2),
						"Humid: % 3.4f%%", experiData.hum_perrh);
				Experiment_SetLedUpdate(&experiData, 5, 0, 0, 200);
				Experiment_SetLedUpdate(&experiData, 6, 0, 0, 0);
				break;
			case DISP_ONLY_TEMP_C:
				snprintf(experiData.szInfo1, sizeof(experiData.szInfo1),
						"Temp : % 3.4fC", experiData.temp_degc);
				strcpy(experiData.szInfo2, "                ");
				Experiment_SetLedUpdate(&experiData, 5, 0, 0, 0);
				Experiment_SetLedUpdate(&experiData, 6, 0, 200, 0);
				break;
			case DISP_ONLY_TEMP_F:
				snprintf(experiData.szInfo1, sizeof(experiData.szInfo1),
						"Temp : % 3.4fF", experiData.temp_degf);
				strcpy(experiData.szInfo2, "                ");
				Experiment_SetLedUpdate(&experiData, 5, 0, 0, 0);
				Experiment_SetLedUpdate(&experiData, 6, 0, 0, 200);
				break;
			case DISP_ONLY_HUMID:
				strcpy(experiData.szInfo1, "                ");
				snprintf(experiData.szInfo2, sizeof(experiData.szInfo2),
						"Humid: % 3.4f%%", experiData.hum_perrh);
				Experiment_SetLedUpdate(&experiData, 5, 0, 0, 0);
				Experiment_SetLedUpdate(&experiData, 6, 128, 16, 0x00);
				break;
			default:
				strcpy(experiData.szInfo1, "Idle. Press");
				strcpy(experiData.szInfo2, "a button.");
				Experiment_SetLedUpdate(&experiData, 5, 16, 16, 16);
				Experiment_SetLedUpdate(&experiData, 6, 16, 16, 16);
				break;
			}
		}
		else
		{
			Experiment_SetLedUpdate(&experiData, 0, 0, 0, 0);
			Experiment_SetLedUpdate(&experiData, 1, 0, 0, 0);
			Experiment_SetLedUpdate(&experiData, 2, 0, 0, 0);
			Experiment_SetLedUpdate(&experiData, 3, 0, 0, 0);
			strcpy(experiData.szInfo1, "Idle. Enable");
			strcpy(experiData.szInfo2, "switch zero.");
			Experiment_SetLedUpdate(&experiData, 5, 200, 0, 0);
			Experiment_SetLedUpdate(&experiData, 6, 200, 0, 0);
		}

		Experiment_updateSSD(&experiData);
		Experiment_UpdateCLSDisplay(&experiData);
	}

    cleanup_platform();
    return 0;
}
