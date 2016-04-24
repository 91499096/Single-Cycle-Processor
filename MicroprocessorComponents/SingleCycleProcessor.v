`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:14:39 02/18/2014 
// Design Name: 
// Module Name:    SingleCycleProcessor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SingleCycleProcessor #(parameter width = 32, wordLength = 32)
			(input clk, rst,
			 output [width-1:0] RD1, RD2, ALUOut, ReadD, WriteMem); //outputs just to read on waveform

	wire [$clog2(width)-1:0] pcOut, pcPlusOne;
	wire [2:0] ALUop;
	wire [4:0] JumpMuxOut;
	wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump;
	wire [width-1:0] instr;	//the instruction stored in memory at location pointed to by PC
	wire [width-1:0] SrcA, SrcB;	//2 outputs from Reg File
	wire [width-1:0] ALUresult;	//Result of ALU operation
	wire [width-1:0] ReadData, WriteData;	//Data read from Data Memory and data written to Data Memory
	wire [width-1:0] SrcBMuxOut;	//Output of Mux ALUin, determines whether a reg or sign extended value goes to ALU
	wire [width-1:0] MemToRegMuxOut;	//output of Mux MemToRegMux
	wire [width-1:0] RegDstMuxOut;	//output of RegDstMux
	wire [width-1:0] PCAdderOut;	//output of PC adder for branch/jumps
	wire PCSrc, ALUZero;
	
	nbitReg #(.width($clog2(width))) PC (.din(JumpMuxOut), .clk(clk), .rst(rst), .dout(pcOut)); //Program counter
	InstructionMemory #(.width(width), .wordLength(wordLength)) iMem
		(.din(pcOut), .dout(instr));	//Instruction Memory
	RegisterFile #(.width(width), .wordLength(wordLength)) rFile
		(.addr1(instr[25:21]), .addr2(instr[20:16]), .addr3(RegDstMuxOut[4:0]), .clk(clk), .write(RegWrite), .rst(rst), .writeValue(ReadData), .r1(SrcA), .r2(WriteData));
		//register File
	DataMemory #(.width(width), .wordLength(wordLength)) dMem
		(.clk(clk), .write(MemWrite), .wIn(WriteData), .din(ALUresult[4:0]), .dout(ReadData)); //Data Memory
	ALU #(.width(width)) ALU1 (.op1(SrcA), .op2(SrcB), .sel(ALUop), .out(ALUresult), .zero(ALUZero)); //ALU
	SignExtend #(.in(width/2), .out(width)) SignEx (.din(instr[15:0]), .dout(SrcB)); //sign extends offset
	Increment #(.width($clog2(width))) pcInc (.din(pcOut), .dout(pcPlusOne)); //just adds one to PC
	
	Mux #(.width(width)) ALUInB (.sel(ALUSrc), .in1(WriteData), .in2(SrcB), .out(SrcBMuxOut)); 
	//Mux that controls whether signExtended value or value in register is sent to ALU
	
	Mux #(.width(width)) MemToRegMux (.sel(MemtoReg), .in1(ALUresult), .in2(ReadData), .out(MemToRegMuxOut));
	//ALU that controls whether ALU result goes to Data Memory or to the Register File
	
	Mux #(.width(5)) RegDstMux (.sel(RegDst), .in1(instr[20:16]), .in2(instr[15:11]), .out(RegDstMuxOut[4:0]));
	//Selects which is the destination, depends on OP Code
	
	Mux #(.width(5)) PCSrcMux (.sel(PCSrc), .in1(SrcB[4:0]), .in2(pcPlusOne[4:0]), .out(PCAdderOut[4:0]));
	//selects whether PC+1 or PC+Offset is added to PC
	
	adder #(.width(5)) PCSrcUpdate (.op1(pcPlusOne[4:0]), .op2(SrcB[4:0]), .sum(PCAdderOut[4:0]));
	//adds Offset to PC
	
	and BranchAndZero (PCSrc, branch, ALUZero);
	
	Controller #(.codeWidth(6), .MainDecodeOut(7)) c1
			(.OpCode(instr[width-1:26]), .Funct(instr[5:0]), .DecodeOut({RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump}), .ALUControlOut(ALUop));
			
	Mux #(.width(5)) JumpMux (.sel(Jump), .in1(PCAdderOut[4:0]), .in2(instr[4:0]), .out(JumpMuxOut));
	
	assign RD1 = SrcA;
	assign RD2 = SrcB;
	assign ALUOut = ALUresult;
	assign ReadD = ReadData;
	assign WriteMem = WriteData;

endmodule

module tb_SingleCycleProcessor;
	parameter w = 32;
	parameter WL = 32;
	reg clk, rst;
	wire [w-1:0] RD1, RD2, ALUOut, ReadD, WriteMem;
	
	SingleCycleProcessor #(.width(w), .wordLength(WL)) test1
		(.clk(clk), .rst(rst),
			.RD1(RD1), .RD2(RD2), .ALUOut(ALUOut), .ReadD(ReadD), .WriteMem(WriteMem));
			
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	//$readmemb("dMem.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.dMem.mem);
	//$readmemb("rFile.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.rFile.rFile);
	//$readmemb("loadInst.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.iMem.instructionMem);
	rst = 1;
	#11 rst = 0;
	end
endmodule
