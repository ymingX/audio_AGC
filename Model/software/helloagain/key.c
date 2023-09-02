/*
 * key.c
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#include "key.h"

int keyInit(void) {
	IOWR(KEYIRQ_BASE, 2, 0x07);
	IOWR(KEYIRQ_BASE, 3, 0x00);
	return alt_irq_register(KEYIRQ_IRQ, NULL, (void *) keyIsr);
}

void keyIsr(void* isr_context) {
	IOWR(KEYIRQ_BASE, 3, 0x00);

	volatile u8 keyirq;
	volatile u8 keyvalue;

	keyirq = IORD(KEYIRQ_BASE, 0) & 0xff;
	keyvalue = IORD(KEYVALUE_BASE, 0) & 0xff;

    if(keyirq==0x1 && keyvalue==0x5)			//SW1
    {

    }

    else  if(keyirq==0x1 && keyvalue==0x6)		//SW2
    {

    }

    else  if(keyirq==0x2)						//Clockwise
    {

    }

    else  if(keyirq==0x4)						//Anti-Clockwise
    {

    }

    else
    	lcdRectClear(0, 0, HDP, VDP, BACKGROUND);

	printf("keyirq = 0x%x, keyvalue = 0x%x\n", keyirq, keyvalue);
}

