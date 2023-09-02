/*
 * key.h
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#ifndef KEY_H_
#define KEY_H_

#include "define.h"
#include "lcd.h"

int keyInit(void);
void keyIsr(void* isr_context);
void Main_menu(void);

extern int pause1;
#endif /* KEY_H_ */
