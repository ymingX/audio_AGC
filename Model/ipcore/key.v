module key
(
	input 				clk,
	input 				sw_code,
	input 				sw_code_l,
	input 				sw_code_r,
	input 				sw1,
	input 				sw2,
	input [3:0]			key,

	output reg [2:0]	value,
	output reg [2:0]	irq
);
	wire [6:0]STA;
	reg [2:0]value_;

	assign STA[0]=key[0];
	assign STA[1]=key[1];
	assign STA[2]=key[2];
	assign STA[3]=key[3];
	assign STA[4]=sw1;
	assign STA[5]=sw2;
	assign STA[6]=sw_code;

	always@(STA)
	begin
		case(STA)
		7'b1111_110:value_<=3'd1;
		7'b1111_101:value_<=3'd2;
		7'b1111_011:value_<=3'd3;
		7'b1110_111:value_<=3'd4;
		7'b1101_111:value_<=3'd5;
		7'b1011_111:value_<=3'd6;
		7'b0111_111:value_<=3'd7;
		default:value_<=3'd0;
		endcase
	end

	wire  clk1;
	reg  [4:0]delay;
	reg  [1:0]sta;
	always@(posedge clk1)
	begin
		 if(value_==3'd0)
			begin
				delay<=5'd0;
				sta=2'b00;
				irq[0]=1'b0;
			end
		 else
			begin
				case(sta)
				  2'b00:begin
							  value<=value_;
							  sta<=2'b01;
						  end
				  2'b01:begin
							  if(delay<=5'd25)
								 begin
								  delay<=delay+1;
								  sta<=2'b01;
								 end
							  else
								  sta<=2'b11;
						  end
				  2'b11:begin
							 sta<=sta;
							  if(value==value_)
								  begin
									 irq[0]=1'b1;
								  end
							  else
								  begin
								  sta<=sta;
								  end
						  end
					default:sta<=sta;
				endcase
			end
	end

	reg [31:0] count;
	assign clk1=count[31];
	always @(posedge clk)
		count <= count + 32'd85899;

	reg [1:0]state;
	reg  irq_l,irq_r;
	always @(posedge clk1)
	begin
		state[0]<=sw_code_r;
		state[1]<=sw_code_l;
		irq[2:1]={irq_l,irq_r};
		if(sw_code_l|sw_code_r)begin
			 irq_l<=1'b0;
			 irq_r<=1'b0;
		end
		else begin
			 if(!sw_code_l&state[0])
					irq_l<=1'b1;
			 else if(!sw_code_r&state[1])irq_r<=1'b1;
			 else begin
					irq_l<=irq_l;
					irq_r<=irq_r;
			 end
		end
	end
	
endmodule

