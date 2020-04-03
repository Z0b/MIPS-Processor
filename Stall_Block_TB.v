`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:17:31 09/03/2019
// Design Name:   stall_block
// Module Name:   C:/Users/student/Desktop/CO_2019/G2_modules/stall_TB.v
// Project Name:  G2_modules
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stall_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Stall_Block_TB;

	// Inputs
	reg [0:5] op;
	reg clk;
	reg reset;

	// Outputs
	wire stall;
	wire stall_pm;

	// Instantiate the Unit Under Test (UUT)
	Stall_Block uut (
		.op(op), 
		.clk(clk), 
		.reset(reset), 
		.stall(stall), 
		.stall_pm(stall_pm)
	);

always begin
clk=0;
forever #5 clk = ~clk;
end
	initial begin
		
		op = 0;
		clk = 0;
		reset = 1; 
		#2
		reset=0;
		
		#6
		reset=1;
		
		#8
		op=6'b010100;
		
		#20
		op=6'b000000;
		#10
		op=6'b011110;
		#30
		op=6'b000000;
		#10
		op=6'b010001;
		

		// Wait 100 ns for global reset to finish
		        
		// Add stimulus here

	end
      
endmodule

