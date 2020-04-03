`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:01 09/03/2019 
// Design Name: 
// Module Name:    write_block 
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
module Write_Block(
    input [0:15] ans_dm,
    input clk,
    input reset,
    output reg [0:15] ans_wb
	 //reg [0:15] 
    );
always@(posedge clk)
begin
 if(reset==1'b0)
  ans_wb=16'b0000000000000000;
 else
  ans_wb<=ans_dm;
end
 


endmodule
