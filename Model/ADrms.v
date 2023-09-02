module ADrms (
    input clk_sample,
    input rst,
    input [11:0]ADin,
    output reg [11:0]RMS,
    output reg found
);

parameter CNT =2147 ;
reg[11:0]ADbuf2;
reg [12:0]cnt;
reg [11:0]ADbuf1;

always @(negedge clk_sample) begin
    ADbuf1<=ADin;
end
always @(posedge clk_sample) begin
    //ADbuf2<=ADbuf1;
    if(ADbuf1>2047)
        ADbuf2<=ADbuf1-2047;
    else ADbuf2<=2047-ADbuf1;
end

reg [35:0]sigma;
wire [12:0]rmsbuf;
always @(posedge clk_sample)
begin
    if(cnt==CNT)
    begin
        found<=1'b1;
        cnt<=0;
        //sigma<=0;
    end
    else begin
		found<=0;
        cnt<=cnt+1;
        if(cnt>99) begin
            sigma<=sigma+ADbuf2*ADbuf2;
        end
        else sigma<=0;
    end
end

    sqrt    sqrt_inst (
	.radical ( sigma[35:11] ),
	.q ( rmsbuf ),
	.remainder (  )
	);


always @(negedge clk_sample) begin
    if(found)
        RMS<=rmsbuf[11:0];
end



endmodule