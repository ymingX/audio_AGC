module AGC (
    input clk_50M,
    input rst,
    input clk_sample,
    input found,
	input [11:0]tlv,
    input [11:0]Vpp,
    output reg[11:0]tlvnxt
);
reg [21:0]d1; 
wire [21:0]d2;
always @(posedge found) begin
    d1=1550*(tlv-1397);
end

div	div_inst (
	.clken ( found ),
	.clock ( clk_50M ),
	.denom ( Vpp ),
	.numer ( d1 ),
	.quotient ( d2 )
	);
	/*
always @(posedge clk_sample) begin
    if(found)
	 tlvnxt<=d2[11:0]+1397;
end
*/

always @(negedge found) begin
	 tlvnxt<=d2[11:0]+1397;
end

endmodule