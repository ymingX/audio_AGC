/*
 * lcd.c
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#include "lcd.h"

u8 LINEMODE = 1;
u8 CYCLE = 6;
u8 DUTY = 3;
u8 HLPEN = 0;

int lcdInit(void) {
	lcdWriteCommand(0x00E2);
	lcdWriteData(0x001D);
	lcdWriteData(0x0002);
	lcdWriteData(0x0004);
	usleep(100);
	lcdWriteCommand(0x00E0);
	lcdWriteData(0x0001);
	usleep(2000);
	lcdWriteCommand(0x00E0);
	lcdWriteData(0x0003);
	usleep(100);
	lcdWriteCommand(0x0001);
	usleep(6000);

	lcdWriteCommand(0x00E6);
	lcdWriteData(0x002f);
	lcdWriteData(0x00ff);
	lcdWriteData(0x00ff);

	lcdWriteCommand(0x00B0);
	lcdWriteData(0x0020);
	lcdWriteData(0x0000);
	lcdWriteData((HDP >> 8) & 0X00FF);
	lcdWriteData(HDP & 0X00FF);
	lcdWriteData((VDP >> 8) & 0X00FF);
	lcdWriteData(VDP & 0X00FF);
	lcdWriteData(0x0000);

	lcdWriteCommand(0x00B4);
	lcdWriteData((HT >> 8) & 0X00FF);
	lcdWriteData(HT & 0X00FF);
	lcdWriteData((HPS >> 8) & 0X00FF);
	lcdWriteData(HPS & 0X00FF);
	lcdWriteData(HPW);
	lcdWriteData((LPS >> 8) & 0X00FF);
	lcdWriteData(LPS & 0X00FF);
	lcdWriteData(0x0000);

	lcdWriteCommand(0x00B6);
	lcdWriteData((VT >> 8) & 0X00FF);
	lcdWriteData(VT & 0X00FF);
	lcdWriteData((VPS >> 8) & 0X00FF);
	lcdWriteData(VPS & 0X00FF);
	lcdWriteData(VPW);
	lcdWriteData((FPS >> 8) & 0X00FF);
	lcdWriteData(FPS & 0X00FF);

	lcdWriteCommand(0x00F0);
	lcdWriteData(0x0003);

	lcdWriteCommand(0x0029);

	lcdWriteCommand(0x00D0);
	lcdWriteData(0x0000);

	lcdWriteCommand(0x00BE);
	lcdWriteData(0x0005);
	lcdWriteData(0x0090);
	lcdWriteData(0x0001);
	lcdWriteData(0x00FF);
	lcdWriteData(0x0000);
	lcdWriteData(0x0000);

	lcdWriteCommand(0x00B8);
	lcdWriteData(0x0003);
	lcdWriteData(0x0001);

	lcdWriteCommand(0x00BA);
	lcdWriteData(0x0001);

	lcdWriteCommand(0x0036);
	lcdWriteData(0x0020);

	lcdRectClear(0, 0, HDP, VDP, BACKGROUND);
	return 0;
}

void lcdWriteCommand(u16 command) {
	IOWR(LCD_BASE, 0, command);
}

void lcdWriteData(u16 data) {
	IOWR(LCD_BASE, 1, data);
}

u16 lcdReadData(void) {
	return (u16) IORD(LCD_BASE, 1);
}

void lcdSetCursor(u16 x, u16 y) {
	lcdWriteCommand(0x002A);
	lcdWriteData(x >> 8);
	lcdWriteData(x & 0x00ff);
	lcdWriteData(x >> 8);
	lcdWriteData(x & 0x00ff);

	lcdWriteCommand(0x002B);
	lcdWriteData(y >> 8);
	lcdWriteData(y & 0x00ff);
	lcdWriteData(y >> 8);
	lcdWriteData(y & 0x00ff);
}

void lcdDrawPoint(u16 x, u16 y, u16 color) {
	lcdSetCursor(x, y);
	lcdWriteCommand(0x002C);
	lcdWriteData(color);
}

u16 lcdGetPoint(u16 x, u16 y) {
	lcdSetCursor(x, y);
	lcdWriteCommand(0x002E);
	return lcdReadData();
}
void lcdRectClear(u16 xs, u16 ys, u16 xe, u16 ye, u16 color) {
	int cnt = (xe - xs + 1) * (ye - ys + 1);

	lcdWriteCommand(0x002A);
	lcdWriteData(xs >> 8);
	lcdWriteData(xs & 0x00ff);
	lcdWriteData(xe >> 8);
	lcdWriteData(xe & 0x00ff);

	lcdWriteCommand(0x002B);
	lcdWriteData(ys >> 8);
	lcdWriteData(ys & 0x00ff);
	lcdWriteData(ye >> 8);
	lcdWriteData(ye & 0x00ff);

	lcdWriteCommand(0x002C);
	while (cnt) {
		lcdWriteData(color);
		cnt--;
	}
}

void lcdSetLine(u8 linemode, u8 cycle, u8 duty, u8 hlpen) {
	LINEMODE = linemode;
	CYCLE = cycle;
	DUTY = duty;
	HLPEN = hlpen - 1;
}

//垂直线
void lcdDrawVerLine(u16 x, u16 ys, u16 ye, u16 color) {
	u16 cnt = 0;
	int i = 0;
	if (LINEMODE == 1) {
		lcdWriteCommand(0x002A);
		lcdWriteData(x >> 8);
		lcdWriteData(x & 0x00ff);
		lcdWriteData((x + HLPEN) >> 8);
		lcdWriteData((x + HLPEN) & 0x00ff);

		lcdWriteCommand(0x002B);
		lcdWriteData(ys >> 8);
		lcdWriteData(ys & 0x00ff);
		lcdWriteData(ye >> 8);
		lcdWriteData(ye & 0x00ff);

		cnt = (ye - ys + 1) * (HLPEN + 1);
		lcdWriteCommand(0x002C);
		for (i = 0; i < cnt; i++)
			lcdWriteData(color);
	} else {
		cnt = (ye - ys) / CYCLE;
		for (i = 0; i < cnt; i++)
			lcdRectClear(x, ys + i * CYCLE, x + HLPEN,
					ys + i * CYCLE + DUTY - 1, color);
	}
}

//水平线
void lcdDrawHorLine(u16 y, u16 xs, u16 xe, u16 color) {
	u16 cnt = 0;
	int i = 0;
	if (LINEMODE == 1) {
		lcdWriteCommand(0x002A);
		lcdWriteData(xs >> 8);
		lcdWriteData(xs & 0x00ff);
		lcdWriteData(xe >> 8);
		lcdWriteData(xe & 0x00ff);

		lcdWriteCommand(0x002B);
		lcdWriteData(y >> 8);
		lcdWriteData(y & 0x00ff);
		lcdWriteData((y + HLPEN) >> 8);
		lcdWriteData((y + HLPEN) & 0x00ff);

		cnt = (xe - xs + 1) * (HLPEN + 1);
		lcdWriteCommand(0x002C);
		for (i = 0; i < cnt; i++)
			lcdWriteData(color);
	} else {
		cnt = (xe - xs) / CYCLE;
		for (i = 0; i < cnt; i++)
			lcdRectClear(xs + i * CYCLE, y, xs + i * CYCLE + DUTY - 1,
					y + HLPEN, color);
	}
}
void lcdDrawLine(u16 xs, u16 ys, u16 xe, u16 ye, u16 color) {
	u16 t;
	int xerr = 0, yerr = 0, delta_x, delta_y, distance, xcha, ycha;
	int incx, incy;
	/*  compute the distance in both directions */
	delta_x = xe - xs;
	delta_y = ye - ys;

	/* compute  the direction of the increment ,
	 an increment of "0" means either a vertical or horizontal lines */

	if (delta_x > 0)
		incx = 1;
	else if (delta_x == 0)
		incx = 0;
	else
		incx = -1;

	if (delta_y > 0)
		incy = 1;
	else if (delta_y == 0)
		incy = 0;
	else
		incy = -1;

	/*  determine which distance is greater */
	delta_x = delta_x < 0 ? -delta_x : delta_x;
	delta_y = delta_y < 0 ? -delta_y : delta_y;

	if (delta_x > delta_y) {
		distance = delta_x;
		xcha = distance;
		ycha = 0;
		yerr = -(distance >> 1);
	} else {
		distance = delta_y;
		ycha = distance;
		xcha = 0;
		xerr = -(distance >> 1);
	}

	/* draw the line */
	for (t = 0; t <= distance; t++) {
		if (LINEMODE == 1)
			lcdDrawPoint(xs, ys, color);
		else if (t % CYCLE < DUTY)
			lcdDrawPoint(xs, ys, color);

		xerr += delta_x;
		yerr += delta_y;
		if (xerr >= xcha) {
			xerr -= distance;
			xs += incx;
		}
		if (yerr >= ycha) {
			yerr -= distance;
			ys += incy;
		}
	}
}

void lcdDrawPic(u16 xs, u16 ys, u16 row, u16 col, u16 fore, u16 back,
		volatile const u8*pcode) {
	u8 MULX = 1, MULY = 1;
	int i, j;
	u8 b;
	u32 pos;
	lcdWriteCommand(0x002A);
	lcdWriteData(xs >> 8);
	lcdWriteData(xs & 0x00ff);
	lcdWriteData((xs + col * MULX - 1) >> 8);
	lcdWriteData((xs + col * MULX - 1) & 0x00ff);

	lcdWriteCommand(0x002B);
	lcdWriteData(ys >> 8);
	lcdWriteData(ys & 0x00ff);
	lcdWriteData((ys + row * MULY - 1) >> 8);
	lcdWriteData((ys + row * MULY - 1) & 0x00ff);

	lcdWriteCommand(0x002C);
	for (i = 0; i < col * MULX; i++) {
		pos = (i / (8 * MULX)) * row;

		b = 0x80 >> ((i % (8 * MULX)) / MULX);
		for (j = 0; j < row * MULY; j++) {
			if ((*(pcode + pos + (j / MULY))) & b)
				lcdWriteData(fore);
			else
				lcdWriteData(back);
		}
	}
}

//画方形
void lcdDrawRectan(u16 xs, u16 ys, u16 len, u16 wid,u16 color)
{
	lcdDrawVerLine(xs, ys, ys+wid, color);
    lcdDrawVerLine(xs+len, ys, ys+wid, color);
	lcdDrawHorLine(ys, xs, xs+len, color);
	lcdDrawHorLine(ys+wid, xs, xs+len, color);
}

void lcdDrawGrid(u16 xs, u16 ys, u8 row, u8 col, u8 width, u16 color) {
	u8 i, j;

	lcdDrawVerLine(xs, ys, ys + row * width, color);
	lcdDrawVerLine(xs + col * width, ys, ys + row * width, color);
	lcdDrawHorLine(ys, xs, xs + col * width, color);
	lcdDrawHorLine(ys + row * width, xs, xs + col * width, color);

	for (i = 1; i < 5 * col; i++)
		lcdDrawVerLine(xs + (width / 5) * i, ys + width * (row / 2) - 1,
				ys + width * (row / 2) + 1, color);
	for (i = 1; i < 5 * row; i++)
		lcdDrawHorLine(ys + (width / 5) * i, xs + width * (col / 2) - 1,
				xs + width * (col / 2) + 1, color);

	for (j = 1; j < col; j++) {
		u16 x = xs + j * width;
		for (i = 1; i < 5 * row; i++)
			lcdDrawPoint(x, ys + (width / 5) * i, color);
	}
	for (j = 1; j < row; j++) {
		u16 y = ys + j * width;
		for (i = 1; i < 5 * col; i++)
			lcdDrawPoint(xs + (width / 5) * i, y, color);
	}
}

void lcdDispStringSmall(u16 xs, u16 ys, u16 fore, u16 back, const char*str) {
	u8 k = 0;
	while (str[k] != 0) {
		lcdDrawPic(xs + k * 8, ys, 16, 8, fore, back, ASCII8_16[str[k] - ' ']);
		k++;
	}
}

void lcdDispStringBig(u16 xs, u16 ys, u16 fore, u16 back, const char*str) {
	u8 k = 0;
	while (str[k] != 0) {
		lcdDrawPic(xs + k * 12, ys, 24, 12, fore, back,
				ASCII12_24[str[k] - ' ']);
		k++;
	}
}

void lcdDispDecSmall(u16 xs, u16 ys, u16 fore, u16 back, int dec) {
	char str[16] = { 0 };
	sprintf(str, "%d", dec);
	lcdDispStringSmall(xs, ys, fore, back, str);
}

void lcdDispDecBig(u16 xs, u16 ys, u16 fore, u16 back, int dec) {
	char str[16] = { 0 };
	sprintf(str, "%d", dec);
	lcdDispStringBig(xs, ys, fore, back, str);
}

void lcdDispFloatSmall(u16 xs, u16 ys, u16 fore, u16 back, float flo) {
	char str[16] = { 0 };
	sprintf(str, "%f", flo);
	lcdDispStringSmall(xs, ys, fore, back, str);
}

void lcdDispFloatBig(u16 xs, u16 ys, u16 fore, u16 back, float flo,int weishu) {
	char str[16] = { 0 };
	switch(weishu)
	{
       case 1:sprintf(str, "%.1f", flo);break;
       case 2:sprintf(str, "%.2f", flo);break;
       case 3:sprintf(str, "%.3f", flo);break;
       case 4:sprintf(str, "%.4f", flo);break;
       case 5:sprintf(str, "%.5f", flo);break;
       case 6:sprintf(str, "%.6f", flo);break;
       default: sprintf(str, "%.6f", flo);
	}
	lcdDispStringBig(xs, ys, fore, back, str);
}



//显示图片
void DisplayPic(u16 x_start,u16 y_start,u16 width,u16 depth, u8 *p,u8 factor)
{
	u16 x,y;
	u32 i=0;
	u16 color;
	for(y=0;y<depth*factor;y++)
	{
		for(x=0;x<width*factor;x++)
		{
			i=((y/factor)*width+(x/factor))*2;
			color=p[i]*256+p[i+1];
			lcdDrawPoint(x+x_start, y+y_start ,color);
		}
	}
}


