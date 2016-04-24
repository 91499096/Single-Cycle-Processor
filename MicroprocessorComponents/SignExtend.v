`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    SignExtend
//////////////////////////////////////////////////////////////////////////////////
module SignExtend #(parameter in = 16, out = 32)
			(input signed [in-1:0] din,
			 output reg signed [out-1:0] dout);

	always@* begin
		dout <= {{(out-in){din[in-1]}}, din}; //sign extend to the left out-in times using din[in-1]
	end

endmodule

module tb_SignExtend;
	parameter in = 16;
	parameter out = 32;
	reg [in-1:0] num;
	wire [out-1:0] numExtend;
	
	SignExtend #(.in(in), .out(out)) t1 (.din(num), .dout(numExtend));
	
	initial begin 
		num = -1;
		#10 num = 1;
	end
endmodule
