`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Mux
//////////////////////////////////////////////////////////////////////////////////
module Mux #(parameter width = 32)
				(input sel,
				 input [width-1:0] in1, in2,
				 output reg [width-1:0] out);

	always@* begin
		if (~sel) out <= in1;
		else out <= in2;
	end

endmodule

module tb_mux;
	parameter w = 32;
	
	reg select;
	reg [w-1:0] in1, in2;
	wire [w-1:0] out;
	
	Mux #(.width(w)) m1 (.in1(in1), .in2(in2), .sel(select), .out(out));
	
	initial begin
		in1 = 2;
		in2 = 3;
		select = 0;
		#5 select = 1;
	end

endmodule
