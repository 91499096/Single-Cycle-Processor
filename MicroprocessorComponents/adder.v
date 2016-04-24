`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    adder
//////////////////////////////////////////////////////////////////////////////////
module adder #(parameter width = 32)
			(input signed [width-1:0] op1, op2,
			 output reg signed [width-1:0] sum);

	always@*
		sum <= op1 + op2;

endmodule

module tb_adder;
	parameter w = 32;
	reg [w-1:0] in1, in2;
	wire [w-1:0] out;

	adder #(.width(w)) add1 (.op1(in1), .op2(in2), .sum(out));
	
	initial begin
		in1 = 10;
		in2 = 15;
	end
endmodule
