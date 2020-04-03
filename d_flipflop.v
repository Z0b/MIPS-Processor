`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:43 09/03/2019 
// Design Name: 
// Module Name:    d_flipflop 
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
module d_flipflop(
    input D,
    input clk,
	 input reset,
    output reg Q
    );
always @(posedge clk) 
begin
 if(reset==1'b0)
   Q <= 1'b0;
 else
   Q <= D; 
end 
endmodule 

