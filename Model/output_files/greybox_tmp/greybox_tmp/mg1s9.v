//ALTSQRT CBX_SINGLE_OUTPUT_FILE="ON" PIPELINE=0 Q_PORT_WIDTH=13 R_PORT_WIDTH=14 WIDTH=25 q radical remainder
//VERSION_BEGIN 17.0 cbx_mgl 2017:04:25:18:09:28:SJ cbx_stratixii 2017:04:25:18:06:30:SJ cbx_util_mgl 2017:04:25:18:06:30:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2017  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Intel and sold by Intel or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = ALTSQRT 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mg1s9
	( 
	q,
	radical,
	remainder) /* synthesis synthesis_clearbox=1 */;
	output   [12:0]  q;
	input   [24:0]  radical;
	output   [13:0]  remainder;

	wire  [12:0]   wire_mgl_prim1_q;
	wire  [13:0]   wire_mgl_prim1_remainder;

	ALTSQRT   mgl_prim1
	( 
	.q(wire_mgl_prim1_q),
	.radical(radical),
	.remainder(wire_mgl_prim1_remainder));
	defparam
		mgl_prim1.pipeline = 0,
		mgl_prim1.q_port_width = 13,
		mgl_prim1.r_port_width = 14,
		mgl_prim1.width = 25;
	assign
		q = wire_mgl_prim1_q,
		remainder = wire_mgl_prim1_remainder;
endmodule //mg1s9
//VALID FILE
