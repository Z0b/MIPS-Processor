`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:48 08/27/2019 
// Design Name: 
// Module Name:    reg_bank_block 
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
module RB_Block(
    input [15:0] ans_ex,
    input [15:0] ans_dm,
    input [15:0] ans_wb,
    input [15:0] imm,
    input [4:0] RA,
    input [4:0] RB,
    input [4:0] RW_dm,
    input [1:0] mux_sel_A,
    input [1:0] mux_sel_B,
    input imm_sel,
    input clk,
    output [15:0] A,
    output [15:0] B
    );

wire [15:0] AR, BR, BI;
reg_bank reg_bank1(RA, RB, RW_dm, clk, ans_dm, AR, BR);

assign A =(mux_sel_A==2'b00)? AR: 
          (mux_sel_A==2'b01)? ans_ex:
	 		 (mux_sel_A==2'b10) ? ans_dm:
			 (mux_sel_A==2'b11) ? ans_wb:0;
 
assign BI =(mux_sel_B==2'b00)? BR:
           (mux_sel_B==2'b01)? ans_ex:
			  (mux_sel_B==2'b10) ? ans_dm:
			  (mux_sel_B==2'b11) ? ans_wb:0;

assign B = (imm_sel ==1'b0)? BI:
			  (imm_sel ==1'b1)? imm:0;

endmodule
