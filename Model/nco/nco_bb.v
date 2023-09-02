
module nco (
	clk,
	clken,
	phi_inc_i,
	freq_mod_i,
	phase_mod_i,
	fsin_o,
	out_valid,
	reset_n);	

	input		clk;
	input		clken;
	input	[31:0]	phi_inc_i;
	input	[31:0]	freq_mod_i;
	input	[15:0]	phase_mod_i;
	output	[15:0]	fsin_o;
	output		out_valid;
	input		reset_n;
endmodule
