`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:56 10/21/2019 
// Design Name: 
// Module Name:    Register_Bank 
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
module Register_Bank(
    input write,
	 input reset,
	 input [31 : 0] store_word,
	 input read,
	 input [31 : 0] read_word,
	 input [4:0] operand1,
    input [4:0] operand2,
    output [31:0] A,
    output [31:0] B
    );

reg [31 : 0] regarray[31 : 0];

always@(posedge clk)begin
	 if(reset == 1)begin
		for(i=0;i<32;i=i+1)
			regarray[i] <= 32'b00000000000000000000000000000000;
			
	 end
	 else if(write == 1)begin
		regarray[operand1] = store_word;

	end
	else if(read == 1)begin
		read_word = regarray[operand1];

	end
	else begin
		A = regarray[operand1];
		B = regarray[operand2];

	end

	
end

endmodule
