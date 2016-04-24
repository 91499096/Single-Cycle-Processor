`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    DataMemory 1 read, 1 write port, clk, write-enable
//////////////////////////////////////////////////////////////////////////////////
module DataMemory #(parameter width = 32, wordLength = 32)
				(input clk, write,
				 input [width-1:0] wIn,
				 input [$clog2(width)-1:0] din,
				 output reg [width-1:0] dout);

	reg [wordLength-1:0] dataMem [width-1:0];

	initial $readmemb("dMem.txt", dataMem);
	always@(posedge clk) begin
		if (write) dataMem[din] <= wIn;
		else ;
	end
	always@*
		dout <= dataMem[din];
	
endmodule

module tb_dMem;
	parameter w = 32;
	parameter WL = 32;
	reg clk, write;
	reg [w-1:0] wd;
	reg [$clog2(w)-1:0] addr;
	wire [w-1:0] content;
	
	DataMemory #(.width(w), .wordLength(WL)) t1
		(.clk(clk), .write(write), .wIn(wd), .din(addr), .dout(content));
		
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	write = 0; wd = 33; addr = 0;
	#20 addr = 5;
	#20 write = 1; addr = 5;
	#20 write = 0;
	end
endmodule
