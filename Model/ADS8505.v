module ADS8505(
input [15:0] signal,
output [15:0] adsig
);
assign adsig[15:0]=signal[15:0];

endmodule 