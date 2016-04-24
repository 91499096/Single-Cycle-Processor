`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    RegisterFile
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile #(parameter width = 32, wordLength = 32)
			(input [$clog2(width)-1:0] addr1, addr2, addr3,
			 input clk, write, rst,
			 input [width-1:0] writeValue,
			 output [width-1:0] r1, r2);
			 
	reg [wordLength-1:0] rFile [width-1:0];

	initial $readmemb("rFile.txt", rFile);
	integer i;
	always@(posedge clk) begin
		if (rst) for(i = 0; i < wordLength; i = i + 1) rFile[i] <= 0;
		if (write) rFile[addr3] <= writeValue;
		else ;
		end
	
	assign r1 = rFile[addr1];
	assign r2 = rFile[addr2];

endmodule

module tb_RegFil;
	parameter w = 32;
	parameter WL = 32;
	reg [$clog2(w)-1:0] a1, a2, a3;
	reg clk, write, rst;
	reg [w-1:0] wd;
	wire [w-1:0] rd1,rd2;
	
	RegisterFile #(.width(w), .wordLength(WL)) t1
		(.addr1(a1), .addr2(a2), .addr3(a3), .clk(clk), .write(write), .rst(rst), .writeValue(wd), .r1(rd1), .r2(rd2));
		
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	write = 0; a1 = 0; a2 = 1; a3 = 10; wd = 255;
	#10 a1 = 2; a2 = 12;
	#50 write = 1; a2 = 10;
	#20 write = 0;
	#5 rst = 1;
	end
endmodule
