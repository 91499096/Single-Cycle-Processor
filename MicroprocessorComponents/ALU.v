`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ALU
//////////////////////////////////////////////////////////////////////////////////
module ALU #(parameter width = 32)
				(input signed [width-1:0] op1, op2,
				 input [2:0] sel,
				 output reg zero,
				 output reg signed [width-1:0] out);
				 
		parameter ALUand = 3'b000; //a & b
		parameter ALUor = 3'b001;	// a | b
		parameter ALUadd = 3'b010;	//a + b
		parameter ALUandnot = 3'b100; //a&~b
		parameter ALUornot = 3'b101; //a|~b
		parameter ALUsub = 3'b110;	//a-b
		parameter ALUslt = 3'b111;	//set less than. Output 1 if a < b, else output 0
	
	always@* begin
		case (sel)
			ALUand:	begin out <= (op1 & op2);
								zero <= 0;
						end
			ALUor:	out <= (op1 | op2);
			ALUadd:	out <= op1 + op2;
			ALUandnot:	out <= op1 & (~op2);
			ALUornot:	out <= op1 | (~op2);
			ALUsub:	begin if (op1 - op2) zero <= 0;
								else zero <= 1;
						out <= op1 - op2;
						end
			ALUslt:	if (op1 < op2) begin out <= 1; zero <= 0; end
						else out <= 0;
			default: out <= 0;
		endcase
	end

endmodule

module tb_ALU;
	parameter w = 32;
	reg signed [w-1:0] in1, in2;
	reg [2:0] sel;
	wire z;
	wire signed [w-1:0] result;
	
	ALU #(.width(w)) t1 (.op1(in1), .op2(in2), .sel(sel), .zero(z), .out(result));
	
	initial begin
	in1 = 0; in2 = 1; sel = 0;
	#15 sel = 1;
	#15 sel = 2;
	#15 sel = 4;
	#15 sel = 5;
	#15 sel = 7;
	#15 sel = 6;
	end
endmodule
