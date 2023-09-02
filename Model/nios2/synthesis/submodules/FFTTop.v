module FFTTop(
input clk,
input rst_n,
///总线接口///
input cs,
input wr,
input rd,
input [3:0] addr,
input [31:0] wrdata,
output reg [31:0] rddata,
////fifo接口///
input ADClk,
input [15:0] ADData
);

//////////////////总线控制//////////////////////
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    FIFOWrReg <= 1'd0;
	 FIFORdReg <= 1'd0;
    rddata <= 32'd0;
  end
  else if(wr&cs) begin
    case(addr[3:0])
	   4'd0: FIFOWrReg <= wrdata[0];
		4'd1: FIFORdReg <= wrdata[0];
		4'd4: RAMRdReg <= wrdata[0];
		4'd5: RdAddrReg[11:0] <= wrdata[11:0];
		default: ;
	 endcase
  end
  else if(rd&cs) begin
    case(addr[3:0])
	   4'd2: rddata[0] <= RdEm;
		4'd3: rddata[0] <= WrFu;
		4'd6: rddata[31:0] <= RAMout[31:0];
		4'd7: rddata[5:0] <= SouExp[5:0];
		default: rddata <= rddata;
	 endcase
  end
end

/////////fifo ip核/////////////
wire FIFORd;
reg FIFORdReg;
assign FIFORd = FIFORdReg;//fifo读请求
wire FIFOWr;
reg FIFOWrReg;
assign FIFOWr = FIFOWrReg;//fifo写请求

wire RdEm;
wire WrFu;
wire [15:0] FIFOout;

FIFO FIFO_inst
(
	.data    (ADData) ,	// input [11:0] data_sig
	.rdclk   (clk) ,	   // input  rdclk_sig
	.rdreq   (FIFORd) ,	// input  rdreq_sig
	.wrclk   (ADClk) ,	// input  wrclk_sig
	.wrreq   (FIFOWr) ,	// input  wrreq_sig
	.q       (FIFOout) ,	// output [11:0] q_sig
	.rdempty (RdEm) ,	   // output  rdempty_sig
	.wrfull  (WrFu) 	   // output  wrfull_sig
);

//////////////fft ip核/////////
wire SinRdy;
wire [1:0] SinErr;
assign SinErr = 2'd0;
wire [15:0] SinImg;
assign SinImg = 15'd0;
wire [15:0] SinReal;
assign SinReal = FIFOout[15:0] + 16'd32768;

wire inverse;
assign inverse = 1'd0;//ifft控制

wire SouVld;
wire SouRdy;
assign SouRdy = 1'd1;
wire [1:0] SouErr;
wire SouSop;
wire SouEop;
wire [5:0] SouExp;
wire [15:0] SouReal;
wire [15:0] SouImg;

/////////sink_sop时序控制////////////
wire SinSop;
reg SinSopReg;
assign SinSop = SinSopReg;

reg FIFORdTemp;
reg [1:0] SopCnt;
always @(posedge clk) begin
  FIFORdTemp <= FIFORd;
  if(FIFORd & (~FIFORdTemp)) begin
    if(WrFu) begin
		SopCnt <= 2'd1;
		SinSopReg <= 1'd1;
	 end
	 else
	   SopCnt <= 2'd0;
  end
  else if(SopCnt == 2'd1) begin
    SinSopReg <= 1'd0;
    SopCnt <= 2'd0;
  end
end

//always @(posedge clk) begin
//  FIFORdTemp <= FIFORd;
//  if(FIFORd & (~FIFORdTemp)) begin
//    if(WrFu) 
//		SopCnt <= 2'd1;
//	 else
//	   SopCnt <= 2'd0;
//  end
//  else if(SopCnt >= 2'd2) begin
//    SinSopReg <= 1'd0;
//	 SopCnt <= 2'd0;
//  end
//  else if(SopCnt == 2'd1) begin
//    SinSopReg <= 1'd1;
//    SopCnt <= 2'd2;
//  end
//end
/////////sink_eop时序控制/////////////
wire SinEop;
reg SinEopReg;
assign SinEop = SinEopReg;

reg RdEmTemp;
reg EopCnt;
always @(posedge clk) begin
  RdEmTemp <= RdEm;
  if(RdEm & (~RdEmTemp)) begin
    SinEopReg <= 1'd1;
	 EopCnt <= 1'd1;
  end
  else if(EopCnt >= 1'd1) begin
    SinEopReg <= 1'd0;
    EopCnt <= 1'd0;
  end
end

///////sink_valid时序控制/////////////
wire SinVld;
reg SinVldReg;
reg FIFORdTemp2;
assign SinVld = SinVldReg;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    SinVldReg <= 1'd0;
  else begin
    FIFORdTemp2 <= FIFORd;
    if(FIFORd & (~FIFORdTemp2)) begin
      if(WrFu) begin
	     SinVldReg <= 1'd1;
	   end
    end
    else if(EopCnt>=1'd1)
      SinVldReg <= 1'd0;
  end
end

//always @(posedge clk or negedge rst_n) begin
//  if(!rst_n)
//    SinVldReg <= 1'd0;
//  else if(SopCnt==1'd1)
//	 SinVldReg <= 1'd1;
//  else if(EopCnt>=1'd1)
//    SinVldReg <= 1'd0;
//end

fft u0 (
    .clk         (clk),     // clk.clk
    .reset_n     (rst_n),   // rst.reset_n
    .sink_valid  (SinVld),  // sink.sink_valid
    .sink_ready  (SinRdy),  //     .sink_ready
    .sink_error  (SinErr),  //     .sink_error
    .sink_sop    (SinSop),  //     .s ink_sop
    .sink_eop    (SinEop),  //     .sink_eop
    .sink_real   (SinReal), //     .sink_real
    .sink_imag   (SinImg),  //     .sink_imag
    .inverse     (inverse), //     .inverse
    .source_valid(SouVld),  // source.source_valid
    .source_ready(SouRdy),  //       .source_ready
    .source_error(SouErr),  //       .source_error
    .source_sop  (SouSop),  //       .source_sop
    .source_eop  (SouEop),  //       .source_eop
    .source_real (SouReal), //       .source_real
    .source_imag (SouImg),  //       .source_imag
    .source_exp  (SouExp)   //       .source_exp
);


//fft fft_inst
//(
//	.clk(clk) ,	// input  clk_sig
//	.reset_n(rst_n) ,	// input  reset_n_sig
//	.sink_valid(SinVld) ,	// input  sink_valid_sig
//	.sink_ready(SinRdy) ,	// output  sink_ready_sig
//	.sink_error(SinErr) ,	// input [1:0] sink_error_sig
//	.sink_sop(SinSop) ,	// input  sink_sop_sig
//	.sink_eop(sink_eop_sig) ,	// input  sink_eop_sig
//	.sink_real(sink_real_sig) ,	// input [15:0] sink_real_sig
//	.sink_imag(sink_imag_sig) ,	// input [15:0] sink_imag_sig
//	.inverse(inverse_sig) ,	// input [0:0] inverse_sig
//	.source_valid(source_valid_sig) ,	// output  source_valid_sig
//	.source_ready(source_ready_sig) ,	// input  source_ready_sig
//	.source_error(source_error_sig) ,	// output [1:0] source_error_sig
//	.source_sop(source_sop_sig) ,	// output  source_sop_sig
//	.source_eop(source_eop_sig) ,	// output  source_eop_sig
//	.source_real(source_real_sig) ,	// output [15:0] source_real_sig
//	.source_imag(source_imag_sig) ,	// output [15:0] source_imag_sig
//	.source_exp(source_exp_sig) 	// output [5:0] source_exp_sig
//);
///////取模计算/////////////
wire [31:0] RealSq;
wire [31:0] ImgSq;
wire [31:0] SqSum;

square square_inst1 // 平方
(
	.dataa(SouReal) , // input [11:0] dataa_sig
	.result(RealSq) 	// output [23:0] result_sig
);

square square_inst2
(
	.dataa(SouImg) , // input [11:0] dataa_sig
	.result(ImgSq)   // output [23:0] result_sig
);

ADD1	ADD1_inst  // 平方和
(
	.dataa(RealSq) , // input [23:0] dataa_sig
	.datab(ImgSq) ,  // input [23:0] datab_sig
	.result(SqSum)   // output [23:0] result_sig
);

///////////////////exp缩放///////////////////////
//reg [31:0] SqSumReg;
//always @(posedge clk) begin
//  case(SouExp[5:0])
//    6'b111010 : SqSumReg <= {12'd0, SqSum[23:12]};
//    6'b111001 : SqSumReg <= {10'd0, SqSum[23:10]};
//    6'b111000 : SqSumReg <= {8'd0, SqSum[23:8]};
//	 6'b110111 : SqSumReg <= {6'd0, SqSum[23:6]};
//	 6'b110110 : SqSumReg <= {4'd0, SqSum[23:4]};
//	 6'b110101 : SqSumReg <= {2'd0, SqSum[23:2]};
//	 default : SqSumReg <= SqSum;
//  endcase
//end

//////////////ram ip核/////////////
wire [31:0] RAMin;
reg [31:0] RAMinReg;
assign RAMin = RAMinReg;
wire RAMWr;
reg RAMWrReg;
assign RAMWr = RAMWrReg;
wire [11:0] WrAddr;
reg [11:0] WrAddrReg;
assign WrAddr = WrAddrReg;

/////////ram写时序//////////
always @(posedge clk) begin
  RAMinReg[31:0] <= SqSum;
  if(SouSop) begin
    RAMWrReg <= 1'b1;
	 WrAddrReg <= 12'd0;
  end
  else if(RAMWrReg) begin
    if(WrAddrReg == 12'd255)
		RAMWrReg <= 1'b0;
	 else 
		WrAddrReg <= WrAddrReg + 12'd1;
  end
end

wire RAMRd;
reg RAMRdReg;
assign RAMRd = RAMRdReg;
wire [11:0] RdAddr;
reg [11:0] RdAddrReg;
assign RdAddr = RdAddrReg;
wire [31:0] RAMout;

FFT_RAM FFT_RAM_inst
(
	.clock     (clk),	 // input  clock_sig
	.data      (RAMin) ,	 // input [31:0] data_sig
	.rdaddress (RdAddr) , // input [10:0] rdaddress_sig
	.rden      (RAMRd) ,  // input  rden_sig
	.wraddress (WrAddr) , // input [10:0] wraddress_sig
	.wren      (RAMWr) ,	 // input  wren_sig
	.q         (RAMout) 	 // output [31:0] q_sig
);

endmodule
