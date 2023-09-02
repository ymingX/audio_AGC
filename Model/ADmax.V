module ADMAX (
    input clk_sample,
    input rst,
    input [11:0]ADin,
    input [12:0]ADcnt,
    output reg [11:0]Vpp,
    output reg found
);

reg[11:0]ADbuf2;
reg [12:0]cnt;
reg [11:0]ADbuf1;
//reg [11:0]ADbuf2;

always @(negedge clk_sample) begin
    ADbuf1<=ADin;
end
always @(posedge clk_sample) begin
    ADbuf2<=ADbuf1;
end



reg [11:0]Max_reg;
reg [11:0]Min_reg;
reg [11:0]Max_buf;
reg [11:0]Min_buf;



always @(posedge clk_sample)
begin
    if(cnt==ADcnt)
    begin
        Max_buf<=Max_reg;
        Min_buf<=Min_reg;
        found<=1'b1;
        Max_reg<=0;
        Min_reg<=4095;
        cnt<=0;
    end
    else begin
		  if(cnt>100)begin
        if(ADbuf2>Max_reg)
            Max_reg<=ADbuf2;
        if(ADbuf2<Min_reg)
            Min_reg<=ADbuf2;
			end
        found<=1'b0;
        cnt<=cnt+1;
    end
end

always @(posedge found ) begin
    Vpp<=Max_buf-Min_buf;
    
end



endmodule