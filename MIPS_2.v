`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:20 09/25/2018 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS(data_in,clk,interrupt,reset,data_out);//,ins,A,B,current_address,ans_ex,ans_dm,ans_wb,mux_sel_A,mux_sel_B,imm_sel);
input [15:0] data_in;
input clk;
input interrupt;
input reset;
output [15:0] data_out;
wire [31:0] ins;
wire[15:0] A;
wire [15:0] B;
wire [15:0] current_address;
wire [15:0] ans_ex;
wire [15:0] ans_dm;
wire [15:0] ans_wb;
wire [1:0] mux_sel_A;
wire [1:0] mux_sel_B;
wire imm_sel;
wire[15:0] jmp_loc,jmp_address_pm,imm,DM_data;
wire  pc_mux_sel, stall, stall_pm,interrupt,mem_en_ex,mem_rw_ex,mem_mux_sel_dm;
wire [5:0] op_dec;
wire[1:0] flag_ex;
wire [4:0] RA,RB,RW_dm;

PM_Block i8(ins, current_address, jmp_loc, pc_mux_sel, stall, stall_pm, reset, clk);

Stall_Block i4(stall,stall_pm,op_dec,clk,reset);

JC_Block i7(jmp_loc,pc_mux_sel,jmp_address_pm,current_address,op_dec,flag_ex,interrupt,clk,reset);

RB_Block i3(ans_ex,ans_dm,ans_wb,imm,ins[20:16],ins[15:11],RW_dm,mux_sel_A,mux_sel_B,imm_sel,clk,A,B);

DC_Block i2(imm,op_dec,RW_dm,mux_sel_A,mux_sel_B,imm_sel,mem_en_ex,mem_rw_ex,mem_mux_sel_dm, ins,clk,reset);

EX_Block i1(A,B,data_in,op_dec,clk,reset,ans_ex,DM_data,data_out,flag_ex);

DM_Block i6(ans_dm,ans_ex,DM_data,mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk);

Write_Block i5(ans_wb,ans_dm,clk,reset);



endmodule
