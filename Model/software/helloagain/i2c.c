/*
 * i2c.c
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#include "i2c.h"

void i2cInit(void) {
	SDA_OUT;
	SDA_H;
	SCL_H;
}

void i2cDelay(void) {
	usleep(5);
}

bool i2cStart(void) {
	SDA_OUT;

	SDA_H;
	SCL_H;
	i2cDelay();
	if (!SDA_R) {
		return false;
	}
	SDA_L;
	i2cDelay();

	if (SDA_R) {
		return false;
	}
	SCL_L;
	i2cDelay();
	return true;
}

void i2cStop(void) {
	SDA_OUT;

	SCL_L;
	i2cDelay();
	SDA_L;
	i2cDelay();
	SCL_H;
	i2cDelay();
	SDA_H;
	i2cDelay();
}

void i2cAck(void) {
	SDA_OUT;

	SCL_L;
	i2cDelay();
	SDA_L;
	i2cDelay();
	SCL_H;
	i2cDelay();
	SCL_L;
	i2cDelay();
}

void i2cNoAck(void) {
	SDA_OUT;

	SCL_L;
	i2cDelay();
	SDA_H;
	i2cDelay();
	SCL_H;
	i2cDelay();
	SCL_L;
	i2cDelay();
}

bool i2cWaitAck(void) {
	SDA_OUT;

	SCL_L;
	i2cDelay();
	SDA_H;
	i2cDelay();
	SCL_H;
	i2cDelay();

	SDA_IN;
	if (SDA_R) {
		SCL_L;
		i2cDelay();
		return false;
	}
	SCL_L;
	i2cDelay();
	return true;
}

void i2cSendByte(u8 byte) {
	u8 i = 8;

	SDA_OUT;
	while (i--) {
		SCL_L;
		i2cDelay();
		if (byte & 0x80) {
			SDA_H;
		} else {
			SDA_L;
		}
		byte <<= 1;
		i2cDelay();
		SCL_H;
		i2cDelay();
	}
	SCL_L;
}

u8 i2cReadByte(void) {
	u8 i = 8;
	u8 byte = 0;

	SDA_OUT;
	SDA_H;

	SDA_IN;
	while (i--) {
		byte <<= 1;
		SCL_L;
		i2cDelay();
		SCL_H;
		i2cDelay();
		if (SDA_R) {
			byte |= 0x01;
		}
	}
	SCL_L;
	return byte;
}

bool i2cWriteReg(u8 slave, u8 reg, u8 data) {
	if (!i2cStart())
		return false;
	i2cSendByte(slave);
	if (!i2cWaitAck()) {
		//i2cStop();
		//return false;
	}
	i2cSendByte(reg);
	i2cWaitAck();
	i2cSendByte(data);
	i2cWaitAck();
	i2cStop();
	return true;
}

bool i2cWriteMulti(u8 slave, u8 reg, u8 *buff, u8 cnt) {
	u8 k = 0;
	if (!i2cStart())
		return false;
	i2cSendByte(slave);
	if (!i2cWaitAck()) {
		i2cStop();
		return false;
	}
	i2cSendByte(reg);
	i2cWaitAck();

	while (cnt--) {
		i2cSendByte(buff[k++]);
		i2cWaitAck();
	}
	i2cStop();
	return true;
}

u8 i2cReadReg(u8 slave, u8 reg) {
	u8 data;
	if (!i2cStart())
		return false;
	i2cSendByte(slave);
	if (!i2cWaitAck()) {
		i2cStop();
		return false;
	}
	i2cSendByte((u8) reg);
	i2cWaitAck();
	i2cStart();
	i2cSendByte(slave + 1);
	i2cWaitAck();

	data = i2cReadByte();
	i2cNoAck();
	i2cStop();
	return data;
}

bool i2cReadMulti(u8 slave, u8 reg, u8 *buff, u8 cnt) {
	u8 k = 0;
	if (!i2cStart())
		return false;
	i2cSendByte(slave);
	if (!i2cWaitAck()) {
		i2cStop();
		return false;
	}
	i2cSendByte((u8) reg);
	i2cWaitAck();
	i2cStart();
	i2cSendByte(slave + 1);
	i2cWaitAck();

	while (cnt--) {
		buff[k++] = i2cReadByte();
		if (cnt)
			i2cAck();
	}
	i2cNoAck();
	i2cStop();

	return true;
}

