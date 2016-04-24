`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    SingleCycleProcessor2
//////////////////////////////////////////////////////////////////////////////////
module SingleCycleProcessor2#(parameter width = 32, wordLength = 32)
			(input clk, rst);

	wire [$clog2(width)-1:0] pcIn, pcOut, PCBranch, PCPlusOne, PCSrcMuxOut;
	//pcIn - ProgramCounter input
	//pcOut - Program Counter Output
	//PCBranch - value to be put in if Branch op
	//PCPlusOne - output of PC Increment
	
	wire [width-1:0] instr, SrcA, SrcB, WriteData, ReadData, SignImm, Result, ALUResult;
	/*
	instr - Instruction from instruction memory
	SrcA - RD1
	SrcB - output of Mux for RD2 and SignImm
	WriteData - Data from RD2 to be written to Data Mem
	ReadData - Data from Data Mem at address result from ALUResult
	SignImm - Sign extended value
	Result - output of Mux for ReadData and ALUResult
	ALUResult - output of ALU
	*/
	
	wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump;
	/*
	RegWrite - write in to Reg File
	RegDst - mux for instr[20:16] and instr[15:11]
	ALUSrc - mux for WriteData and SignImm
	Branch - input to And gate with Zero
	MemWrite - write to Memory
	MemtoReg - mux for ALUResult and ReadData
	Jump - mux for output of PCSrc Mux and instr[$clog2(width)-1:0]
	*/
	
	wire [2:0] ALUControl;
	//ALU select line
	
	wire PCSrc, Zero;
	//PCSrc - result of Branch and Zero
	//Zero - result of SLT from ALU
	
	wire [4:0] WriteReg;
	//register to write to in reg File

	//Muxs
	//PC Muxs
	Mux #(.width($clog2(width))) JumpMux (.sel(Jump), .in1(PCSrcMuxOut), .in2(instr[$clog2(width)-1:0]), .out(pcIn));
	Mux #(.width($clog2(width))) PCSrcMux (.sel(PCSrc), .in1(PCPlusOne), .in2(PCBranch), .out(PCSrcMuxOut)); //out goes to in1 of above mux
	//PC Muxs end
	
	//ALUSrc Mux - Determines whether WriteData or SignImm goes to ALU
	Mux #(.width(width)) ALUSrcMux (.sel(ALUSrc), .in1(WriteData), .in2(SignImm), .out(SrcB));
	
	//RegDst Mux - determines which Reg to write to
	Mux #(.width(5)) RegDstMux (.sel(RegDst), .in1(instr[20:16]), .in2(instr[15:11]), .out(WriteReg));
	
	//MemtoReg Mux - determines whether ALUResult or ReadData goes to Result(which writes to RegFile)
	Mux #(.width(width)) MemtoRegMux (.sel(MemtoReg), .in1(ALUResult), .in2(ReadData), .out(Result));
	//Muxs end
	
	//and gate for Branch and Zero
	and and1 (PCSrc, Branch, Zero);
	//adder for PC on Branch
	adder #(.width($clog2(width))) PCBranchOut (.op1(SignImm[$clog2(width)-1:0]), .op2(PCPlusOne), .sum(PCBranch));
	
	//Controller
	Controller #(.codeWidth(6), .MainDecodeOut(7)) c1
		(.OpCode(instr[31:26]), .Funct(instr[5:0]), 
		.DecodeOut({RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump}), 
		.ALUControlOut(ALUControl));
	
	//ALU
	ALU #(.width(width)) ALU1 (.op1(SrcA), .op2(SrcB), .sel(ALUControl), .out(ALUResult), .zero(Zero));
	
	//Reg File
	RegisterFile #(.width(width), .wordLength(wordLength)) rFile
		(.addr1(instr[25:21]), .addr2(instr[20:16]), .addr3(WriteReg), .clk(clk), 
		.write(RegWrite), .rst(rst), .writeValue(Result), .r1(SrcA), .r2(WriteData));
	
	//Instruction Memory
	InstructionMemory #(.width(width), .wordLength(wordLength)) iMem
		(.din(pcOut), .dout(instr));
	
	//PC
	nbitReg #(.width($clog2(width))) PC (.din(pcIn), .clk(clk), .rst(rst), .dout(pcOut));
	
	//Data Memory
	DataMemory #(.width(width), .wordLength(wordLength)) dMem
		(.clk(clk), .write(MemWrite), .wIn(WriteData), .din(ALUResult[$clog2(width)-1:0]), .dout(ReadData));
	
	//Sign Extend
	SignExtend #(.in(width/2), .out(width)) SignEx (.din(instr[15:0]), .dout(SignImm));
	
	//PCPlusOne
	Increment #(.width($clog2(width))) pcInc (.din(pcOut), .dout(PCPlusOne));
endmodule

module tb_SingleCycleProcessor2;
	parameter w = 32;
	parameter wL = 32;
	reg clk, rst;
	
	SingleCycleProcessor2 #(.width(w), .wordLength(wL)) test1 (.clk(clk), .rst(rst));
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	rst = 1;
	#11 rst = 0;
	end

endmodule
