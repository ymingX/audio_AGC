/*
	usage: top entity
	description: lemon is an excellent name
 */
 
module lemon
(
	// clock and reset
	input 			CLK_50M,						
	input				CLK_IN,	
	output 			CLK_OUT,
	input 			RST_N,	
	
	// toggle switch
	input  [1:0]	SW,

	// led
	output [3:0]	LED,

	// sdram interface
	inout  [15:0]	DRAM_DQ,
	output [11:0]	DRAM_ADDR,
	output [1:0]	DRAM_DQM,
	output 			DRAM_WE_N, 
	output 			DRAM_CAS_N,
	output 			DRAM_RAS_N,
	output 			DRAM_CS_N,
	output [1:0]	DRAM_BA,
	output 			DRAM_CLK,
	output 			DRAM_CKE,
	
	// flash interface
	inout  [7:0]  	FLASH_DATA,
	output [21:0] 	FLASH_ADDR,
	output			FLASH_WR_N,
	output			FLASH_SEL_N,
	output			FLASH_RD_N,
	output 			Flash_WP,
	output 			Flash_RST_N,
	output 			Flash_BYTE,

	// lcd interface
	inout [15:0]	LCD_DATA,
	output 			LCD_RS,
	output 			LCD_RST_N,
	output 			LCD_CS_N,
	output 			LCD_RD_N,
	output 			LCD_WR_N,

	// touch screen interface
	input 			TOUCH_INT,
	output 			TOUCH_RST_N,
	inout 			TOUCH_SDA,
	output			TOUCH_SCL,
	
	// on board key interface
	input [3:0]		KEY,
	
	// adapter board key interface
	input 			SW1,
	input				SW2,
	input				SW_CODE,
	input				SW_CODE_L,
	input				SW_CODE_R,
	
	/* 
	 * gpio interface
	 * for gpio_pa is on the inside
	 * for gpio_pb is on the outside
	 * with io[0] is near GND, with io[15] is near VCC
	 */
	inout [15:0]	GPIO_PA,
	inout [15:0]	GPIO_PB,
	inout [15:0]	GPIO_PC,
	inout [15:0]	GPIO_PD
	);
	
	// nios2 instance
	nios2 nios2_inst
	(
		.clk_clk(CLK_100M) ,					// input  clk_clk_sig
		.reset_reset_n(RST_N) ,				// input  reset_reset_n_sig
		
		.flash_generic_tristate_controller_tcm_write_n_out(FLASH_WR_N) ,			// output [0:0] flash_generic_tristate_controller_tcm_write_n_out_sig
		.flash_generic_tristate_controller_tcm_chipselect_n_out(FLASH_SEL_N) ,	// output [0:0] flash_generic_tristate_controller_tcm_chipselect_n_out_sig
		.flash_generic_tristate_controller_tcm_read_n_out(FLASH_RD_N) ,			// output [0:0] flash_generic_tristate_controller_tcm_read_n_out_sig
		.flash_generic_tristate_controller_tcm_data_out(FLASH_DATA) ,				// inout [7:0] flash_generic_tristate_controller_tcm_data_out_sig
		.flash_generic_tristate_controller_tcm_address_out(FLASH_ADDR) ,			// output [21:0] flash_generic_tristate_controller_tcm_address_out_sig
		
		.keyirq_export(keyirq) ,			// input [2:0] keyirq_export_sig
		.keyvalue_export(keyvalue) ,		// input [2:0] keyvalue_export_sig
		
		.lcd_lcd_cs_n(LCD_CS_N) ,			// output  lcd_lcd_cs_n_sig
		.lcd_lcd_wr_n(LCD_WR_N) ,			// output  lcd_lcd_wr_n_sig
		.lcd_lcd_rd_n(LCD_RD_N) ,			// output  lcd_lcd_rd_n_sig
		.lcd_lcd_rs(LCD_RS) ,				// output  lcd_lcd_rs_sig
		.lcd_lcd_data(LCD_DATA) ,			// inout [15:0] lcd_lcd_data_sig

		.sdram_addr(DRAM_ADDR) ,			// output [11:0] sdram_addr_sig
		.sdram_ba(DRAM_BA) ,					// output [1:0] sdram_ba_sig
		.sdram_cas_n(DRAM_CAS_N) ,			// output  sdram_cas_n_sig
		.sdram_cke(DRAM_CKE) ,				// output  sdram_cke_sig
		.sdram_cs_n(DRAM_CS_N) ,			// output  sdram_cs_n_sig
		.sdram_dq(DRAM_DQ) ,					// inout [15:0] sdram_dq_sig
		.sdram_dqm(DRAM_DQM) ,				// output [1:0] sdram_dqm_sig
		.sdram_ras_n(DRAM_RAS_N) ,			// output  sdram_ras_n_sig
		.sdram_we_n(DRAM_WE_N) ,			// output  sdram_we_n_sig
		
		.touch_irq_export(touchirq) ,		// input  touch_irq_export_sig
		.touch_scl_export(TOUCH_SCL) ,	// output  touch_scl_export_sig
		.touch_sda_export(TOUCH_SDA) 	,	// inout  touch_sda_export_sig
      .tas_scl_export(GPIO_PB[0]),                                         
		.tas_sda_export(GPIO_PB[1]), 
		.fmeasure_clk_export(CNT_CLK), 	// fmeasure_clk.export
		.fmeasure_sqr_export(CNT_SQR) 	// fmeasure_sqr.export
	);
	
	////////////////////////////////system////////////////////////////////////////////
	
	wire [3:0]keyvalue;
	wire [3:0]keyirq;
	
	key key_inst(
		.clk(CLK_100M) ,			// input  clk_sig
		.sw_code(SW_CODE) ,		// input  sw_code_sig
		.sw_code_l(SW_CODE_L) ,	// input  sw_code_l_sig
		.sw_code_r(SW_CODE_R) ,	// input  sw_code_r_sig
		.sw1(SW1) ,					// input  sw1_sig
		.sw2(SW2) ,					// input  sw2_sig
		.key(KEY) ,					// input [3:0] key_sig
		.value(keyvalue) ,		// output [2:0] value_sig
		.irq(keyirq) 				// output [2:0] irq_sig
	);
	
	
	wire touchirq;
	
	ctouchint ctouchint_inst(
		.clk(CLK_100M) ,			// input  clk_sig
		.raw(TOUCH_INT) ,			// input  raw_sig
		.irq(touchirq) 			// output  irq_sig
	);
	
	
	assign Flash_WP = 1'b1;
	assign Flash_RST_N = RST_N;
	assign Flash_BYTE = 1'b0;
	assign LCD_RST_N = RST_N;
	assign TOUCH_RST_N = RST_N;

	
	wire CLK_100M;
	wire CLK_1M;
	wire CLK_410k;
	pll pll_inst
	(
		.inclk0(CLK_50M),			// input  inclk0_sig
		.c0(CLK_100M),				// output  c0_sig
		.c1(DRAM_CLK), 			// output  c1_sig
		.c2(CLK_410k)
	);

	////////////////////////////////////////////////////////////////////////////
	wire TAS_SDA;
	wire TAS_SCL;
	assign GPIO_PC[11:0]=12'bzzzzzzzzzzzz;
	wire [11:0]Vpp;
	wire [12:0]cnt;
	wire [11:0]ad;
	wire found;
	assign CLK_OUT=CLK_410k;
	//assign ad[11:0]={GPIO_PC[0],GPIO_PC[1],GPIO_PC[2],GPIO_PC[3],GPIO_PC[4],GPIO_PC[5],GPIO_PC[6],GPIO_PC[7],GPIO_PC[8],GPIO_PC[9],GPIO_PC[10],GPIO_PC[11]};
	assign ad[11:0]=GPIO_PC[11:0];
	/*
	ADMAX ADMAXinst(
		.clk_sample(CLK_410k),
		.rst(RST_N),
		.ADin(ad[11:0]),
		.ADcnt(5200),
		.Vpp(Vpp[11:0]),
		.found(found)
	);*/

	wire [11:0]rms;
	ADrms	ADrms_inst(
		.clk_sample(CLK_410k),
		.rst(RST_N),
		.ADin(ad[11:0]),
		.RMS(rms[11:0]),
		.found(found)
	);


	wire [11:0]tlv5638data;
	wire tlvset;
	assign tlvset=~KEY[3];
	
	reg [11:0]tlvbuf;
	always @(negedge found) begin
		if(~KEY[2])begin
			tlvbuf<=1664;
		end
		else begin
			if(tlv5638data>1512)begin
				tlvbuf<=tlv5638data;
			end
			else begin
				tlvbuf<=1512;
			end
		end
	end
	
	
	
	TLV5638 TLV5638_inst(
		.data(tlvbuf),
		.conf(6'b110001),
		.clk(CLK_410k),
		.rst(RST_N),
		.set(tlvset),
		.enable(1),
		.DIN_pin(GPIO_PC[15]),
		.SCLK_pin(GPIO_PC[14]),
		.CS_pin(GPIO_PC[13])
	);
	
	AGC AGC_inst(
		.clk_50M(CLK_50M),
		.rst(RST_N),
		.clk_sample(CLK_410k),
		.found(found),
		.tlv(tlvbuf),
		//.tlv(tlv5638data),
		.Vpp(rms),
		.tlvnxt(tlv5638data)
	);
endmodule 