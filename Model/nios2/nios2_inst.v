	nios2 u0 (
		.clk_clk                                                (<connected-to-clk_clk>),                                                //          clk.clk
		.flash_generic_tristate_controller_tcm_write_n_out      (<connected-to-flash_generic_tristate_controller_tcm_write_n_out>),      //        flash.generic_tristate_controller_tcm_write_n_out
		.flash_generic_tristate_controller_tcm_chipselect_n_out (<connected-to-flash_generic_tristate_controller_tcm_chipselect_n_out>), //             .generic_tristate_controller_tcm_chipselect_n_out
		.flash_generic_tristate_controller_tcm_read_n_out       (<connected-to-flash_generic_tristate_controller_tcm_read_n_out>),       //             .generic_tristate_controller_tcm_read_n_out
		.flash_generic_tristate_controller_tcm_data_out         (<connected-to-flash_generic_tristate_controller_tcm_data_out>),         //             .generic_tristate_controller_tcm_data_out
		.flash_generic_tristate_controller_tcm_address_out      (<connected-to-flash_generic_tristate_controller_tcm_address_out>),      //             .generic_tristate_controller_tcm_address_out
		.fmeasure_clk_export                                    (<connected-to-fmeasure_clk_export>),                                    // fmeasure_clk.export
		.fmeasure_sqr_export                                    (<connected-to-fmeasure_sqr_export>),                                    // fmeasure_sqr.export
		.keyirq_export                                          (<connected-to-keyirq_export>),                                          //       keyirq.export
		.keyvalue_export                                        (<connected-to-keyvalue_export>),                                        //     keyvalue.export
		.lcd_lcd_cs_n                                           (<connected-to-lcd_lcd_cs_n>),                                           //          lcd.lcd_cs_n
		.lcd_lcd_wr_n                                           (<connected-to-lcd_lcd_wr_n>),                                           //             .lcd_wr_n
		.lcd_lcd_rd_n                                           (<connected-to-lcd_lcd_rd_n>),                                           //             .lcd_rd_n
		.lcd_lcd_rs                                             (<connected-to-lcd_lcd_rs>),                                             //             .lcd_rs
		.lcd_lcd_data                                           (<connected-to-lcd_lcd_data>),                                           //             .lcd_data
		.reset_reset_n                                          (<connected-to-reset_reset_n>),                                          //        reset.reset_n
		.sdram_addr                                             (<connected-to-sdram_addr>),                                             //        sdram.addr
		.sdram_ba                                               (<connected-to-sdram_ba>),                                               //             .ba
		.sdram_cas_n                                            (<connected-to-sdram_cas_n>),                                            //             .cas_n
		.sdram_cke                                              (<connected-to-sdram_cke>),                                              //             .cke
		.sdram_cs_n                                             (<connected-to-sdram_cs_n>),                                             //             .cs_n
		.sdram_dq                                               (<connected-to-sdram_dq>),                                               //             .dq
		.sdram_dqm                                              (<connected-to-sdram_dqm>),                                              //             .dqm
		.sdram_ras_n                                            (<connected-to-sdram_ras_n>),                                            //             .ras_n
		.sdram_we_n                                             (<connected-to-sdram_we_n>),                                             //             .we_n
		.touch_irq_export                                       (<connected-to-touch_irq_export>),                                       //    touch_irq.export
		.touch_scl_export                                       (<connected-to-touch_scl_export>),                                       //    touch_scl.export
		.touch_sda_export                                       (<connected-to-touch_sda_export>),                                       //    touch_sda.export
		.tas_sda_export                                         (<connected-to-tas_sda_export>),                                         //      tas_sda.export
		.tas_scl_export                                         (<connected-to-tas_scl_export>)                                          //      tas_scl.export
	);

