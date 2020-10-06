`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:49 10/21/2019 
// Design Name: 
// Module Name:    Instruction_Decoder 
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
module Instruction_Decoder(
    input [31:0] instruction,
    input is_branch,
	 input add_imm,
	 input load_word,
	 input store_word,
	 output [5:0] op,
	 output [20 : 0] constant,
	 output [15 : 0] pc_adress,
	 output branch_adress,
    output [4:0] operand1,
    output [4:0] operand2
    );

assign op = instruction[31 : 26];
assign operand1 = instruction[25 : 21];
assign operand2 = instruction[20 : 16];

always@(posedge clk)begin
	if(is_branch == 1)begin
		is_branch = is_branch;
		operand1 = 5'b0;
	end
	else if(add_imm == 1)begin
		operand1 = instruction[25:21];
		constant = instruction[20 : 0];
	end
	else if(load_word == 1)begin
		operand1 = instruction[25:21];
		operand2 = instruction[20:16];
		pc_adress = instruction[15:0];
		
	end
	else if(store_word == 1)begin
		operand1 = instruction[25:21];
		operand2 = instruction[20:16];
		pc_adress = instruction[15:0];
		
	end
	else begin
			op = instruction[31 : 26];
			operand1 = instruction[25 : 21];
			operand2 = instruction[20 : 16];
	end

end
endmodule
