`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:39 08/27/2019 
// Design Name: 
// Module Name:    data_mem 
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
module DM_Block(
    input [15:0] DM_data,
    input [15:0] ans_ex,
    input mem_rw_ex,
    input mem_en_ex,
    input mem_mux_sel_dm,
    input reset,
    input clk,
    output [15:0] ans_dm
    );

wire [15:0] DM_out, Ex_out;
reg [15:0] Ex_out_1;

P_M Data_Mem (
  .clka(clk), // input clka
  .ena(mem_en_ex), // input ena
  .wea(mem_rw_ex), // input [0 : 0] wea
  .addra(ans_ex), // input [15 : 0] addra
  .dina(DM_data), // input [15 : 0] dina
  .douta(DM_out) // output [15 : 0] douta
);

assign Ex_out = (reset==1)? 0: Ex_out_1;

assign ans_dm = (mem_mux_sel_dm == 1)? DM_out: Ex_out;

endmodule
