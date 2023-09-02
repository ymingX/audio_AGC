/*
	usage:jitter elimination
 */

module ctouchint(
	input clk,
	input raw,
	output irq
);

	reg [13:0]cnt;
	always @(posedge clk)
		cnt <= cnt + 1'b1;

	wire clk_div;
	assign clk_div = cnt[13];

	reg [1:0]buff;
	always@(posedge clk_div)
		buff <= {buff[0], raw};

	assign irq = ^buff;

endmodule
