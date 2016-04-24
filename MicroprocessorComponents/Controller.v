`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Controller
//////////////////////////////////////////////////////////////////////////////////
module Controller#(parameter codeWidth = 6, MainDecodeOut = 7)
			(input [codeWidth-1:0] OpCode, Funct,
			 output [MainDecodeOut-1:0] DecodeOut,
			 output [2:0] ALUControlOut);
			 
	wire [1:0] ALUOpIn;
	
	MainDecoder #(.opWidth(codeWidth), .ALUOpWidth(2)) d1
			(.opCode(OpCode), .ALUOp(ALUOpIn), .RegWrite(DecodeOut[MainDecodeOut-1]), .RegDst(DecodeOut[MainDecodeOut-2]),
			.ALUSrc(DecodeOut[MainDecodeOut-3]), .Branch(DecodeOut[MainDecodeOut-4]), .MemWrite(DecodeOut[MainDecodeOut-5]), 
			.MemtoReg(DecodeOut[MainDecodeOut-6]), .Jump(DecodeOut[MainDecodeOut-7]));
	
	ALUDecoder #(.opWidth(codeWidth), .ALUOpWidth(2)) ad1
						(.ALUDecodeIn(ALUOpIn), .functionCode(Funct), .ALUControl(ALUControlOut));
	

endmodule

module MainDecoder #(parameter opWidth = 6, ALUOpWidth = 2)
					(input [opWidth-1:0] opCode,
					 output reg [ALUOpWidth-1:0] ALUOp,
					 output reg RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump);
					 
	parameter rType = 6'b000000;
	parameter addi = 6'b001000;
	parameter lw = 6'b100011;
	parameter sw = 6'b101011;
	parameter beq = 6'b000100;
	parameter j = 6'b000010;
					 
	always@* begin
		case (opCode)
		
			rType: 	begin ALUOp <= 2'b10; //tells ALU to read function field
								RegWrite <= 1;
								RegDst <= 1;
								ALUSrc <= 0;
								Branch <= 0;	
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
						end
						
			addi: 	begin ALUOp <= 2'b00; //ALUAdd
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
						end
						
			lw: 		begin ALUOp <= 2'b00; //ALUAdd
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 1;
								Jump <= 0;
						end
						
			sw: 		begin ALUOp <= 2'b00;
								RegWrite <= 0;
								//RegDst <= X;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 1;
								//MemtoReg <= X;
								Jump <= 0;
						end
						
			beq: 		begin ALUOp <= 2'b01; //ALUSubtract
								RegWrite <= 0;
								//RegDst <= X;
								ALUSrc <= 0;	
								Branch <= 1;
								MemWrite <= 0;
								//MemtoReg <= X;
								Jump <= 0;
						end
						
			j:			begin //ALUOp <= 2'bXX;
								RegWrite <= 0;
								//RegDst <= X;
								//ALUSrc <= X;	
								//Branch <= X;
								MemWrite <= 0;
								//MemtoReg <= X;
								Jump <= 1;
						end
						
			default:	begin //ALUOp <= 2'bXX;
								RegWrite <= 0;
								//RegDst <= X;
								//ALUSrc <= X;	
								//Branch <= X;
								MemWrite <= 0;
								//MemtoReg <= X;
								//Jump <= X;
						end
						
		endcase
	end
endmodule

module ALUDecoder #(parameter opWidth = 6, ALUOpWidth = 2)
						(input [ALUOpWidth-1:0] ALUDecodeIn,
						 input [opWidth-1:0] functionCode,
						 output reg [2:0] ALUControl);
	//ALUDecodeIn start					 
	parameter addOp = 2'b00;
	parameter subOp = 2'b01;
	parameter ALUOp = 2'b10;
	//ALUDecodeIn end
	
	//functionCode start
	parameter funcAdd = 6'b100000;
	parameter funcSub = 6'b100010;
	parameter funcSlt = 6'b101010;
	parameter funcAnd = 6'b100100;
	parameter funcOr = 6'b100101;
	//functionCode end
	
	//ALUControl start
	parameter ALUand = 3'b000; //a & b
	parameter ALUor = 3'b001;	// a | b
	parameter ALUadd = 3'b010;	//a + b
	parameter ALUandnot = 3'b100; //a&~b
	parameter ALUornot = 3'b101; //a|~b
	parameter ALUsub = 3'b110;	//a-b
	parameter ALUslt = 3'b111;	//set less than. Output 1 if a < b, else output 0
	//ALUControl end
	
	always@* begin
		case (ALUDecodeIn)
			addOp: ALUControl <= ALUadd;
			subOp: ALUControl <= ALUsub;
			ALUOp: case (functionCode)
						funcAnd: ALUControl <= ALUand;
						funcOr: ALUControl <= ALUor;
						funcAdd: ALUControl <= ALUadd;
						funcSub: ALUControl <= ALUsub;
						funcSlt: ALUControl <= ALUslt;
						default: ALUControl <= ALUand;
					 endcase
			default: ALUControl <= ALUand;
		endcase
	end
						 
endmodule

module tb_Controller;
	parameter addi = 6'b001000; //addi output = 1010000
	parameter lw = 6'b100011;	//lw output = 1010010
	parameter sw = 6'b101011;	//sw output = 0X101X0
	parameter beq = 6'b000100; 	//beq output = 0X010X0
	parameter j = 6'b000010;	//j output = 0XXX0X1
	parameter rType = 6'b000000; //rType output = 1100000
											//default output = 0XXX0XX
	
	parameter funcAdd = 6'b100000;	//ALU output = 010
	parameter funcSub = 6'b100010;	//ALU output = 110
	parameter funcSlt = 6'b101010;	//ALU output = 111
	parameter funcAnd = 6'b100100;	//ALU output = 000
	parameter funcOr = 6'b100101;		//ALU output = 001
												//only occurs if rType or addi
												//default output = 000;
	
	parameter c = 6;
	parameter m = 7;
	reg [c-1:0] opIn, functIn;
	wire [2:0] out;
	wire [6:0] decoded;
	
	Controller #(.codeWidth(c), .MainDecodeOut(m)) c1
			(.OpCode(opIn), .Funct(functIn), .DecodeOut(decoded), .ALUControlOut(out));
			
	initial begin
	opIn = 0; functIn = 0;
	#5 opIn = lw;
	#5 opIn = sw;
	#5 opIn = beq;
	#5 opIn = j; functIn = funcAdd;
	#5 opIn = addi;
	#5 opIn = rType;
	#5 functIn = funcSub;
	#5 functIn = funcSlt;
	#5 functIn = funcAnd;
	#5 functIn = funcOr;
	end

endmodule
