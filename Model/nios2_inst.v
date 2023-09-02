// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus Prime Version 16.0 (Build Build 211 04/27/2016)
// Created on Tue Sep 18 20:18:30 2018

nios2 nios2_inst
(
	.clk_clk(clk_clk_sig) ,	// input  clk_clk_sig
	.flash_generic_tristate_controller_tcm_write_n_out(flash_generic_tristate_controller_tcm_write_n_out_sig) ,	// output [0:0] flash_generic_tristate_controller_tcm_write_n_out_sig
	.flash_generic_tristate_controller_tcm_chipselect_n_out(flash_generic_tristate_controller_tcm_chipselect_n_out_sig) ,	// output [0:0] flash_generic_tristate_controller_tcm_chipselect_n_out_sig
	.flash_generic_tristate_controller_tcm_read_n_out(flash_generic_tristate_controller_tcm_read_n_out_sig) ,	// output [0:0] flash_generic_tristate_controller_tcm_read_n_out_sig
	.flash_generic_tristate_controller_tcm_data_out(flash_generic_tristate_controller_tcm_data_out_sig) ,	// inout [7:0] flash_generic_tristate_controller_tcm_data_out_sig
	.flash_generic_tristate_controller_tcm_address_out(flash_generic_tristate_controller_tcm_address_out_sig) ,	// output [21:0] flash_generic_tristate_controller_tcm_address_out_sig
	.keyirq_export(keyirq_export_sig) ,	// input [2:0] keyirq_export_sig
	.keyvalue_export(keyvalue_export_sig) ,	// input [2:0] keyvalue_export_sig
	.lcd_lcd_cs_n(lcd_lcd_cs_n_sig) ,	// output  lcd_lcd_cs_n_sig
	.lcd_lcd_wr_n(lcd_lcd_wr_n_sig) ,	// output  lcd_lcd_wr_n_sig
	.lcd_lcd_rd_n(lcd_lcd_rd_n_sig) ,	// output  lcd_lcd_rd_n_sig
	.lcd_lcd_rs(lcd_lcd_rs_sig) ,	// output  lcd_lcd_rs_sig
	.lcd_lcd_data(lcd_lcd_data_sig) ,	// inout [15:0] lcd_lcd_data_sig
	.pio_clk_100m_count_export(pio_clk_100m_count_export_sig) ,	// input [31:0] pio_clk_100m_count_export_sig
	.pio_sign_count_export(pio_sign_count_export_sig) ,	// input [31:0] pio_sign_count_export_sig
	.reset_reset_n(reset_reset_n_sig) ,	// input  reset_reset_n_sig
	.sdram_addr(sdram_addr_sig) ,	// output [11:0] sdram_addr_sig
	.sdram_ba(sdram_ba_sig) ,	// output [1:0] sdram_ba_sig
	.sdram_cas_n(sdram_cas_n_sig) ,	// output  sdram_cas_n_sig
	.sdram_cke(sdram_cke_sig) ,	// output  sdram_cke_sig
	.sdram_cs_n(sdram_cs_n_sig) ,	// output  sdram_cs_n_sig
	.sdram_dq(sdram_dq_sig) ,	// inout [15:0] sdram_dq_sig
	.sdram_dqm(sdram_dqm_sig) ,	// output [1:0] sdram_dqm_sig
	.sdram_ras_n(sdram_ras_n_sig) ,	// output  sdram_ras_n_sig
	.sdram_we_n(sdram_we_n_sig) ,	// output  sdram_we_n_sig
	.touch_irq_export(touch_irq_export_sig) ,	// input  touch_irq_export_sig
	.touch_scl_export(touch_scl_export_sig) ,	// output  touch_scl_export_sig
	.touch_sda_export(touch_sda_export_sig) 	// inout  touch_sda_export_sig
);
