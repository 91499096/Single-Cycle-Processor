`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Instruction Memory, 1 input, 1 output
//////////////////////////////////////////////////////////////////////////////////
module InstructionMemory #(parameter width = 32, wordLength = 32)
				(input [$clog2(width)-1:0] din,
				output reg [width-1:0] dout);
				
	reg [wordLength-1:0] instructionMem [width-1:0];
	
	initial $readmemb("prog.txt", instructionMem);
	//initial $readmemb("storeInst.txt", instructionMem);
	//initial $readmemb("loadInst.txt", instructionMem);
	always@* begin
		dout <= instructionMem[din];
	end
endmodule

module tb_InstructionMemory;
	parameter w = 32;
	parameter WL = 32;
	reg [$clog2(w)-1:0] in;
	wire [w-1:0] out;
	
	InstructionMemory #(.width(w), .wordLength(WL)) t1
		(.din(in), .dout(out));
	
	initial begin
	in = 0;
	#5 in = 1;
	#5 in = 2;
	end
endmodule
