/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'nios2'
 * SOPC Builder design path: ../../nios2.sopcinfo
 *
 * Generated: Sun Oct 23 18:41:34 CST 2022
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00400820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 100000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x19
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x01000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 100000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_DIVISION_ERROR_EXCEPTION
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 8192
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00400820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 100000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x19
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x01000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_DIVISION_ERROR_EXCEPTION
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 8192
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_GENERIC_TRISTATE_CONTROLLER
#define __ALTERA_NIOS2_GEN2
#define __LCD


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x4010c0
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x4010c0
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x4010c0
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios2"


/*
 * TAS_scl configuration
 *
 */

#define ALT_MODULE_CLASS_TAS_scl altera_avalon_pio
#define TAS_SCL_BASE 0x401020
#define TAS_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define TAS_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TAS_SCL_CAPTURE 0
#define TAS_SCL_DATA_WIDTH 1
#define TAS_SCL_DO_TEST_BENCH_WIRING 0
#define TAS_SCL_DRIVEN_SIM_VALUE 0
#define TAS_SCL_EDGE_TYPE "NONE"
#define TAS_SCL_FREQ 100000000
#define TAS_SCL_HAS_IN 0
#define TAS_SCL_HAS_OUT 1
#define TAS_SCL_HAS_TRI 0
#define TAS_SCL_IRQ -1
#define TAS_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TAS_SCL_IRQ_TYPE "NONE"
#define TAS_SCL_NAME "/dev/TAS_scl"
#define TAS_SCL_RESET_VALUE 0
#define TAS_SCL_SPAN 16
#define TAS_SCL_TYPE "altera_avalon_pio"


/*
 * TAS_sda configuration
 *
 */

#define ALT_MODULE_CLASS_TAS_sda altera_avalon_pio
#define TAS_SDA_BASE 0x401030
#define TAS_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define TAS_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TAS_SDA_CAPTURE 0
#define TAS_SDA_DATA_WIDTH 1
#define TAS_SDA_DO_TEST_BENCH_WIRING 0
#define TAS_SDA_DRIVEN_SIM_VALUE 0
#define TAS_SDA_EDGE_TYPE "NONE"
#define TAS_SDA_FREQ 100000000
#define TAS_SDA_HAS_IN 0
#define TAS_SDA_HAS_OUT 0
#define TAS_SDA_HAS_TRI 1
#define TAS_SDA_IRQ -1
#define TAS_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TAS_SDA_IRQ_TYPE "NONE"
#define TAS_SDA_NAME "/dev/TAS_sda"
#define TAS_SDA_RESET_VALUE 0
#define TAS_SDA_SPAN 16
#define TAS_SDA_TYPE "altera_avalon_pio"


/*
 * fmeasure_clk configuration
 *
 */

#define ALT_MODULE_CLASS_fmeasure_clk altera_avalon_pio
#define FMEASURE_CLK_BASE 0x401050
#define FMEASURE_CLK_BIT_CLEARING_EDGE_REGISTER 0
#define FMEASURE_CLK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FMEASURE_CLK_CAPTURE 0
#define FMEASURE_CLK_DATA_WIDTH 32
#define FMEASURE_CLK_DO_TEST_BENCH_WIRING 0
#define FMEASURE_CLK_DRIVEN_SIM_VALUE 0
#define FMEASURE_CLK_EDGE_TYPE "NONE"
#define FMEASURE_CLK_FREQ 100000000
#define FMEASURE_CLK_HAS_IN 1
#define FMEASURE_CLK_HAS_OUT 0
#define FMEASURE_CLK_HAS_TRI 0
#define FMEASURE_CLK_IRQ -1
#define FMEASURE_CLK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FMEASURE_CLK_IRQ_TYPE "NONE"
#define FMEASURE_CLK_NAME "/dev/fmeasure_clk"
#define FMEASURE_CLK_RESET_VALUE 0
#define FMEASURE_CLK_SPAN 16
#define FMEASURE_CLK_TYPE "altera_avalon_pio"


/*
 * fmeasure_sqr configuration
 *
 */

#define ALT_MODULE_CLASS_fmeasure_sqr altera_avalon_pio
#define FMEASURE_SQR_BASE 0x401040
#define FMEASURE_SQR_BIT_CLEARING_EDGE_REGISTER 0
#define FMEASURE_SQR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FMEASURE_SQR_CAPTURE 0
#define FMEASURE_SQR_DATA_WIDTH 32
#define FMEASURE_SQR_DO_TEST_BENCH_WIRING 0
#define FMEASURE_SQR_DRIVEN_SIM_VALUE 0
#define FMEASURE_SQR_EDGE_TYPE "NONE"
#define FMEASURE_SQR_FREQ 100000000
#define FMEASURE_SQR_HAS_IN 1
#define FMEASURE_SQR_HAS_OUT 0
#define FMEASURE_SQR_HAS_TRI 0
#define FMEASURE_SQR_IRQ -1
#define FMEASURE_SQR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FMEASURE_SQR_IRQ_TYPE "NONE"
#define FMEASURE_SQR_NAME "/dev/fmeasure_sqr"
#define FMEASURE_SQR_RESET_VALUE 0
#define FMEASURE_SQR_SPAN 16
#define FMEASURE_SQR_TYPE "altera_avalon_pio"


/*
 * generic_tristate_controller configuration
 *
 */

#define ALT_MODULE_CLASS_generic_tristate_controller altera_generic_tristate_controller
#define GENERIC_TRISTATE_CONTROLLER_BASE 0x0
#define GENERIC_TRISTATE_CONTROLLER_HOLD_VALUE 70
#define GENERIC_TRISTATE_CONTROLLER_IRQ -1
#define GENERIC_TRISTATE_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GENERIC_TRISTATE_CONTROLLER_NAME "/dev/generic_tristate_controller"
#define GENERIC_TRISTATE_CONTROLLER_SETUP_VALUE 70
#define GENERIC_TRISTATE_CONTROLLER_SIZE 4194304u
#define GENERIC_TRISTATE_CONTROLLER_SPAN 4194304
#define GENERIC_TRISTATE_CONTROLLER_TIMING_UNITS "ns"
#define GENERIC_TRISTATE_CONTROLLER_TYPE "altera_generic_tristate_controller"
#define GENERIC_TRISTATE_CONTROLLER_WAIT_VALUE 160


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER0
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x4010c0
#define JTAG_UART_IRQ 1
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * keyirq configuration
 *
 */

#define ALT_MODULE_CLASS_keyirq altera_avalon_pio
#define KEYIRQ_BASE 0x401070
#define KEYIRQ_BIT_CLEARING_EDGE_REGISTER 0
#define KEYIRQ_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEYIRQ_CAPTURE 1
#define KEYIRQ_DATA_WIDTH 3
#define KEYIRQ_DO_TEST_BENCH_WIRING 0
#define KEYIRQ_DRIVEN_SIM_VALUE 0
#define KEYIRQ_EDGE_TYPE "RISING"
#define KEYIRQ_FREQ 100000000
#define KEYIRQ_HAS_IN 1
#define KEYIRQ_HAS_OUT 0
#define KEYIRQ_HAS_TRI 0
#define KEYIRQ_IRQ 3
#define KEYIRQ_IRQ_INTERRUPT_CONTROLLER_ID 0
#define KEYIRQ_IRQ_TYPE "EDGE"
#define KEYIRQ_NAME "/dev/keyirq"
#define KEYIRQ_RESET_VALUE 0
#define KEYIRQ_SPAN 16
#define KEYIRQ_TYPE "altera_avalon_pio"


/*
 * keyvalue configuration
 *
 */

#define ALT_MODULE_CLASS_keyvalue altera_avalon_pio
#define KEYVALUE_BASE 0x401060
#define KEYVALUE_BIT_CLEARING_EDGE_REGISTER 0
#define KEYVALUE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEYVALUE_CAPTURE 0
#define KEYVALUE_DATA_WIDTH 3
#define KEYVALUE_DO_TEST_BENCH_WIRING 0
#define KEYVALUE_DRIVEN_SIM_VALUE 0
#define KEYVALUE_EDGE_TYPE "NONE"
#define KEYVALUE_FREQ 100000000
#define KEYVALUE_HAS_IN 1
#define KEYVALUE_HAS_OUT 0
#define KEYVALUE_HAS_TRI 0
#define KEYVALUE_IRQ -1
#define KEYVALUE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEYVALUE_IRQ_TYPE "NONE"
#define KEYVALUE_NAME "/dev/keyvalue"
#define KEYVALUE_RESET_VALUE 0
#define KEYVALUE_SPAN 16
#define KEYVALUE_TYPE "altera_avalon_pio"


/*
 * lcd configuration
 *
 */

#define ALT_MODULE_CLASS_lcd lcd
#define LCD_BASE 0x4010b8
#define LCD_IRQ -1
#define LCD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_NAME "/dev/lcd"
#define LCD_SPAN 8
#define LCD_TYPE "lcd"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x1000000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x4010b0
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1666437569
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * timer0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer0 altera_avalon_timer
#define TIMER0_ALWAYS_RUN 0
#define TIMER0_BASE 0x401000
#define TIMER0_COUNTER_SIZE 32
#define TIMER0_FIXED_PERIOD 1
#define TIMER0_FREQ 100000000
#define TIMER0_IRQ 2
#define TIMER0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER0_LOAD_VALUE 999999
#define TIMER0_MULT 0.001
#define TIMER0_NAME "/dev/timer0"
#define TIMER0_PERIOD 10
#define TIMER0_PERIOD_UNITS "ms"
#define TIMER0_RESET_OUTPUT 0
#define TIMER0_SNAPSHOT 0
#define TIMER0_SPAN 32
#define TIMER0_TICKS_PER_SEC 100
#define TIMER0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER0_TYPE "altera_avalon_timer"


/*
 * toucH_scl configuration
 *
 */

#define ALT_MODULE_CLASS_toucH_scl altera_avalon_pio
#define TOUCH_SCL_BASE 0x401080
#define TOUCH_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define TOUCH_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TOUCH_SCL_CAPTURE 0
#define TOUCH_SCL_DATA_WIDTH 1
#define TOUCH_SCL_DO_TEST_BENCH_WIRING 0
#define TOUCH_SCL_DRIVEN_SIM_VALUE 0
#define TOUCH_SCL_EDGE_TYPE "NONE"
#define TOUCH_SCL_FREQ 100000000
#define TOUCH_SCL_HAS_IN 0
#define TOUCH_SCL_HAS_OUT 1
#define TOUCH_SCL_HAS_TRI 0
#define TOUCH_SCL_IRQ -1
#define TOUCH_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TOUCH_SCL_IRQ_TYPE "NONE"
#define TOUCH_SCL_NAME "/dev/toucH_scl"
#define TOUCH_SCL_RESET_VALUE 0
#define TOUCH_SCL_SPAN 16
#define TOUCH_SCL_TYPE "altera_avalon_pio"


/*
 * touch_irq configuration
 *
 */

#define ALT_MODULE_CLASS_touch_irq altera_avalon_pio
#define TOUCH_IRQ_BASE 0x4010a0
#define TOUCH_IRQ_BIT_CLEARING_EDGE_REGISTER 0
#define TOUCH_IRQ_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TOUCH_IRQ_CAPTURE 1
#define TOUCH_IRQ_DATA_WIDTH 1
#define TOUCH_IRQ_DO_TEST_BENCH_WIRING 0
#define TOUCH_IRQ_DRIVEN_SIM_VALUE 0
#define TOUCH_IRQ_EDGE_TYPE "RISING"
#define TOUCH_IRQ_FREQ 100000000
#define TOUCH_IRQ_HAS_IN 1
#define TOUCH_IRQ_HAS_OUT 0
#define TOUCH_IRQ_HAS_TRI 0
#define TOUCH_IRQ_IRQ 0
#define TOUCH_IRQ_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TOUCH_IRQ_IRQ_TYPE "EDGE"
#define TOUCH_IRQ_NAME "/dev/touch_irq"
#define TOUCH_IRQ_RESET_VALUE 0
#define TOUCH_IRQ_SPAN 16
#define TOUCH_IRQ_TYPE "altera_avalon_pio"


/*
 * touch_sda configuration
 *
 */

#define ALT_MODULE_CLASS_touch_sda altera_avalon_pio
#define TOUCH_SDA_BASE 0x401090
#define TOUCH_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define TOUCH_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TOUCH_SDA_CAPTURE 0
#define TOUCH_SDA_DATA_WIDTH 1
#define TOUCH_SDA_DO_TEST_BENCH_WIRING 0
#define TOUCH_SDA_DRIVEN_SIM_VALUE 0
#define TOUCH_SDA_EDGE_TYPE "NONE"
#define TOUCH_SDA_FREQ 100000000
#define TOUCH_SDA_HAS_IN 0
#define TOUCH_SDA_HAS_OUT 0
#define TOUCH_SDA_HAS_TRI 1
#define TOUCH_SDA_IRQ -1
#define TOUCH_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TOUCH_SDA_IRQ_TYPE "NONE"
#define TOUCH_SDA_NAME "/dev/touch_sda"
#define TOUCH_SDA_RESET_VALUE 0
#define TOUCH_SDA_SPAN 16
#define TOUCH_SDA_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
