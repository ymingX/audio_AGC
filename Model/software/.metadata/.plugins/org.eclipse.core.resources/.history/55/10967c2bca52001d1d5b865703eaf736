/*
 * touch.h
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#ifndef TOUCH_H_
#define TOUCH_H_

#include "define.h"
#include "i2c.h"

#define FT_DEVICE_ADDR 0x70

extern unsigned char TouchValidFlag;
extern char TouchValue;
extern int model;
extern int pause1;

enum FT_REG {
	FT_DEV_MODE = 0x00,
	FT_GEST_ID = 0x01,
	FT_TD_STATUS = 0x02,
	FT_TP1 = 0x03,
	FT_TP2 = 0x09,
	FT_TP3 = 0x0F,
	FT_TP4 = 0x15,
	FT_TP5 = 0x1B,
	FT_ID_G_THGROUP = 0x80,
	FT_ID_G_THPEAK = 0x81,
	FT_ID_G_PERIODACTIVE = 0x88,
	FT_ID_G_AUTO_CLB_MODE = 0xA0,
	FT_ID_G_LIB_VERSION = 0xA1,
	FT_ID_G_MODE = 0xA4,

	FT_XH = 0x00,
	FT_XL = 0x01,
	FT_YH = 0x02,
	FT_YL = 0x02,
};

typedef enum {
	TOUCH_DOWN = 0, TOUCH_UP, TOUCH_CONTACT, TOUCH_NONE,

} TOUCH_STATUS;

enum GESTURE {
	MOVE_UP = 0x10,
	MOVE_LEFT = 0x14,
	MOVE_DOWN = 0x18,
	MOVE_RIGHT = 0x1c,
	ZOOM_IN = 0x48,
	ZOOM_OUT = 0x49,
	NONE = 0,
};

typedef struct {
	u16 x;
	u16 y;
} point;

typedef struct {
	TOUCH_STATUS status;
	u8 id;
	point now;
	point old;
} tcdata;

int touchInit(void);
int touchIrqInit(void);
void touchIsr(void* isr_context);

void touchGetData(tcdata *data);
void touchGetRaw(tcdata *data);


u8 touchGetGesture(void);

#endif /* TOUCH_H_ */
