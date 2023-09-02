/*
 * draw.c
 *
 *  Created on: 2019Äê8ÔÂ1ÈÕ
 *      Author: huawei
 */
#include "draw.h"

void figure(u8 sel, bool c)
{
	if(c) clear(sel);
	if(sel & BIT0)
	{
	}
}

void clear(u8 sel)
{
	if(sel & BIT0)
	{
		lcdRectClear(0, 0, HDP, VDP, BACKGROUND);
	}
	if(sel & BIT1)
	{

	}
}

void figure_init()
{
	figure(0, true);
}


