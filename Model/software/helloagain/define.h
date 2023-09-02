/*

* define.h
 *
 *  Created on: May 23, 2017
 *      Author: hailiang
 */

#ifndef DEFINE_H_
#define DEFINE_H_

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;

typedef enum {
	false = 0,
	true = 1,
}bool;

#define BIT0	0x01
#define BIT1	0x02
#define BIT2	0x04
#define BIT3	0x08
#define BIT4	0x10
#define BIT5	0x20
#define BIT6	0x40
#define BIT7	0x80

#include "system.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <math.h>

#include "io.h"
#include "priv/alt_legacy_irq.h"
#include "unistd.h"


#endif /* DEFINE_H_ */
