
module nios2 (
	clk_clk,
	flash_generic_tristate_controller_tcm_write_n_out,
	flash_generic_tristate_controller_tcm_chipselect_n_out,
	flash_generic_tristate_controller_tcm_read_n_out,
	flash_generic_tristate_controller_tcm_data_out,
	flash_generic_tristate_controller_tcm_address_out,
	fmeasure_clk_export,
	fmeasure_sqr_export,
	keyirq_export,
	keyvalue_export,
	lcd_lcd_cs_n,
	lcd_lcd_wr_n,
	lcd_lcd_rd_n,
	lcd_lcd_rs,
	lcd_lcd_data,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	touch_irq_export,
	touch_scl_export,
	touch_sda_export,
	tas_sda_export,
	tas_scl_export);	

	input		clk_clk;
	output	[0:0]	flash_generic_tristate_controller_tcm_write_n_out;
	output	[0:0]	flash_generic_tristate_controller_tcm_chipselect_n_out;
	output	[0:0]	flash_generic_tristate_controller_tcm_read_n_out;
	inout	[7:0]	flash_generic_tristate_controller_tcm_data_out;
	output	[21:0]	flash_generic_tristate_controller_tcm_address_out;
	input	[31:0]	fmeasure_clk_export;
	input	[31:0]	fmeasure_sqr_export;
	input	[2:0]	keyirq_export;
	input	[2:0]	keyvalue_export;
	output		lcd_lcd_cs_n;
	output		lcd_lcd_wr_n;
	output		lcd_lcd_rd_n;
	output		lcd_lcd_rs;
	inout	[15:0]	lcd_lcd_data;
	input		reset_reset_n;
	output	[11:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input		touch_irq_export;
	output		touch_scl_export;
	inout		touch_sda_export;
	inout		tas_sda_export;
	output		tas_scl_export;
endmodule
