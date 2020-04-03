`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:47 09/10/2019 
// Design Name: 
// Module Name:    jc_block 
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
module JC_Block(
    input [15:0] jmp_address_pm,
    input [15:0] current_address,
    input [5:0] op,
    input [1:0] flag_ex,
    input interrupt,
    input clk,
    input reset,
    output [15:0] jmp_loc,
    output pc_mux_sel
    );

	wire JV,JNV,JZ,JNZ,JMP,RET;
	wire d1out,d2out;
	
	assign JV=(~op[5])&op[4]&op[3]&op[2]&(~op[1])&(~op[0]);
	assign JNV=(~op[5])&op[4]&op[3]&op[2]&(~op[1])&op[0];
	assign JZ=(~op[5])&op[4]&op[3]&op[2]&op[1]&(~op[0]);
	assign JNZ=(~op[5])&op[4]&op[3]&op[2]&op[1]&op[0];
	assign JMP=(~op[5])&op[4]&op[3]&(~op[2])&(~op[1])&(~op[0]);
	assign RET=(~op[5])&op[4]&(~op[3])&(~op[2])&(~op[1])&(~op[0]);
	
	/*
	assign JV=(~op[0])&op[1]&op[2]&op[3]&(~op[4])&(~op[5]);
	assign JNV=(~op[0])&op[1]&op[2]&op[3]&(~op[4])&op[5];
	assign JZ=(~op[0])&op[1]&op[2]&op[3]&op[4]&(~op[5]);
	assign JNZ=(~op[0])&op[1]&op[2]&op[3]&op[4]&op[5];
	assign JMP=(~op[0])&op[1]&op[2]&(~op[3])&(~op[4])&(~op[5]);
	assign RET=(~op[0])&op[1]&(~op[2])&(~op[3])&(op[4])&(~op[5]);
	*/
	d_flipflop d1(interrupt,clk,reset,d1out);
	d_flipflop d2(d1out,clk,reset,d2out);
	
	//current address counter
	wire curr_addr_plus;
	//reg curr_addr_plus;
	
	wire [15:0]mux1b,mux2u,mux3o;
	wire [1:0] mux4f,mux5fi;
	reg [15:0]hold_addr;
	reg [1:0] flag_ex_save;
	
	//jmp_loc logic + flag
	assign curr_addr_plus=current_address+1;
	assign mux1b=(interrupt==1)?curr_addr_plus:hold_addr;
	assign mux2u=(d1out==0)?jmp_address_pm:'hf000;
	assign mux3o=(RET==0)?mux2u:hold_addr;
	assign mux5fi=(d2out==1)?flag_ex:flag_ex_save;
	assign mux4f=(RET==0)?flag_ex:flag_ex_save;
	
	//reg
	always @(posedge clk)
	begin
	
	hold_addr<=(reset==1)?curr_addr_plus:0;
	flag_ex_save<=(reset==1)?mux5fi:0;
	
	end
	
	
	assign jmp_loc=mux3o;
	//pc_mux_sel logic
	
	// split
	wire flag0,flag1;
	assign flag0=mux4f[0];
	assign flag1=mux4f[1];
	
	wire and1,and2,and3,and4;
	
	assign and1=JV&flag0;
	assign and2=JNV&(~flag0);
	assign and3=JZ&(flag1);
	assign and4=JNZ&(~flag1);
	
	wire or1;
	
	assign or1=and1|and2|and3|and4|JMP|RET|d1out;

	assign pc_mux_sel=or1;
	
		
endmodule
