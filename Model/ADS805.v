module ADS805
(
	input         clk,
	input         clk_rd,
	input  [5:0]  rd_addr,
	input  [15:0] data_in,
	output [15:0] data_out,
	output reg    rden,	
	input  		  complete
);

	reg    [5:0]  WRADDR;
	reg           WREN;
	
	always @(posedge clk) begin
	
		if((WREN | rden) == 0) begin
			WRADDR <= 1'b0;
			WREN <= 1'b1;			
		end
			
		else if (WREN == 1'b1) begin
			WRADDR <= WRADDR + 1'b1;
		
			if(WRADDR > 6'd50) begin
				WREN <= 1'b0;
				rden <= 1'b1;	
			end
				
		end		
		
		if(complete)
			rden <= 1'b0;
		
	end
	
	ram_ad ram_ad_inst
	(
		.data(data_in) ,				// input [15:0] data_sig
		.rd_aclr(1'b0) ,				// input  rd_aclr_sig
		.rdaddress(rd_addr) ,		// input [5:0] rdaddress_sig
		.rdclock(clk_rd) ,			// input  rdclock_sig
		.rden(rden) ,					// input  rden_sig
		.wraddress(WRADDR) ,			// input [5:0] wraddress_sig
		.wrclock(clk) ,				// input  wrclock_sig
		.wren(WREN) ,					// input  wren_sig
		.q(data_out) 					// output [15:0] q_sig
	);
	
endmodule
	