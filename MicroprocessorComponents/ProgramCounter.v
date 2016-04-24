`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Register, parameterized
//////////////////////////////////////////////////////////////////////////////////
module nbitReg #(parameter width = 32)
							(input [width-1:0] din,
							input clk, rst,
							output reg [width-1:0] dout);
	always@(posedge clk) begin
		if (rst) dout <= 0;
		else dout <= din;
	end
endmodule

module tb_nbitReg;
	parameter width = 32;
	reg clk, rst;
	reg [width-1:0] pcIn;
	wire [width-1:0] pcOut;
	
	nbitReg #(.width(width)) t1 (.din(pcIn), .clk(clk), .rst(rst), .dout(pcOut));
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
		pcIn = 0; rst = 1;
		#10 rst = 0;
		#5 pcIn = 25;
		#10 pcIn = 1;
		#10 pcIn = 255;
	end
endmodule
