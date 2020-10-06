`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:13 10/21/2019 
// Design Name: 
// Module Name:    Instruction_Fetch 
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
module Instruction_Fetch(
    input clk,
    input reset,
    input [31:0] pc_in,
    output [31:0] pc_out,
    input is_branch,
    input [31:0] branch_adress
    );

memory a1(pc_in,pc_out);
always@(posedge clk)begin
	if(reset == 1)begin
		pc_in = 32'b0;
		pc_out = 32'b0;
	end
	else begin
	pc_in = pc_in + 1;
		if(is_branch ==1)begin
			pc_out = branch_adress;
		end
		else begin
			reset = reset;
		end
	
	end


end



endmodule
