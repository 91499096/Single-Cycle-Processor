`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Increment
//////////////////////////////////////////////////////////////////////////////////
module Increment #(parameter width = 32)
		(input [width-1:0] din,
		 output reg [width-1:0] dout);
	
	always@* dout <= din + 1;

endmodule

module tb_increment;
	parameter w = 32;
	reg [w-1:0] pc;
	wire [w-1:0] pcPlusOne;
	
	Increment #(.width(w)) t1 (.din(pc), .dout(pcPlusOne));
	
	initial begin
		pc = 0;
		#5 pc = 1;
		#5 pc = 25;
	end
endmodule	
