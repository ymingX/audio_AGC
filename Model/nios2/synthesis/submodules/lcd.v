module lcd
(
	input 				clk,
	input 				rst_n,
	input [31:0]		wrdat,
	output reg [31:0]	rddat,
	input wire 			cs_n,
	input wire 			wr_n,
	input wire 			rd_n,
	input wire 			addr,

	inout [15:0] 		lcd_data,
	output   			lcd_cs_n,
	output				lcd_wr_n,
	output   			lcd_rd_n,
	output   			lcd_rs
);

	assign lcd_rs = addr;
	assign lcd_cs_n = cs_n;
	assign lcd_wr_n = wr_n || cs_n;
	assign lcd_rd_n = rd_n || cs_n;

	reg [15:0]data = 0;
	always@(posedge clk)
		if(!lcd_wr_n)
			data <= wrdat[15:0];
		else if(!lcd_rd_n)
			rddat <= {16'd0, lcd_data};
	
	assign lcd_data = lcd_wr_n ? 16'hzzzz : data;
	
endmodule
