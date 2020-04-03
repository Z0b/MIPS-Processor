`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:03 08/27/2019 
// Design Name: 
// Module Name:    reg_bank 
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
module reg_bank(
    input [4:0] RA1,
    input [4:0] RB1,
    input [4:0] RW_dm_1,
    input clk,
    input [15:0] ans_dm_1,
    output [15:0] AR1,
    output [15:0] BR1
    );

reg [15:0] bank [31:0];

assign AR1 = bank[RA1];
assign BR1 = bank[RB1];

always @ (posedge clk)
begin 
	bank[RW_dm_1] <= ans_dm_1;
end			

endmodule
