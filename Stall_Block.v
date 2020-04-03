`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:49 09/03/2019 
// Design Name: 
// Module Name:    stall_block 
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


//make alu LD1
module Stall_Block(
    input [0:5] op,
    input clk,
    input reset,
    output stall,
    output stall_pm
    );


// HLT

wire HLT,LD1,JUMP;
wire D1out,D2out,D3out,D4out;
assign HLT=(op[5])&(~op[4])&(~op[3])&(~op[2])&(op[1])&(~op[0]);
assign LD1=(~op[5])&(~op[4])&(op[3])&(~op[2])&(op[1])&(~op[0])&(~D1out);
assign JUMP=(op[3])&(op[2])&(op[1])&(~op[0])&(~D4out);

//always @(*)
assign stall=HLT|LD1|JUMP;


d_flipflop d1 (LD1,clk,reset,D1out);
d_flipflop d2(stall,clk,reset,D2out);
d_flipflop d3(JUMP,clk,reset,D3out);
d_flipflop d4(D3out,clk,reset,D4out);

assign stall_pm=D2out;

endmodule
