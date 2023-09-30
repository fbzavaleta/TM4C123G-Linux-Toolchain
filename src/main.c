/*
Firmware para Lectura de métricas LDR y envio de datos a la 
plataforma microcontrolada por comunicación UART
--
--
Autor: Eng. Francis B.Z. Castro
Hardware & Software Engineer - Data Specialist
--
--
*/
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include <inc/hw_types.h>
#include <inc/hw_gpio.h>
#include <inc/hw_memmap.h>
#include <driverlib/gpio.h>
#include <driverlib/rom.h>
#include <driverlib/sysctl.h>
#include <inc/hw_sysctl.h>
#include <driverlib/pin_map.h>
#include <driverlib/can.h>
#include <driverlib/adc.h>
#include <driverlib/timer.h>
#include "clib.h"

#include "TM4C123GH6PM.h"


#define LED_RED GPIO_PIN_1
#define LED_BLUE GPIO_PIN_2
#define LED_GREEN GPIO_PIN_3

int main()
{
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_4|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    ROM_GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, LED_RED|LED_BLUE|LED_GREEN);

   for (;;) {
	// set the red LED pin high, others low
	ROM_GPIOPinWrite(GPIO_PORTF_BASE, LED_RED|LED_GREEN|LED_BLUE, LED_RED);
	ROM_SysCtlDelay(5000000);
	ROM_GPIOPinWrite(GPIO_PORTF_BASE, LED_RED|LED_GREEN|LED_BLUE, 0);
	ROM_SysCtlDelay(5000000);
    }

}