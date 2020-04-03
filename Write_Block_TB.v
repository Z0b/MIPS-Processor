`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:02:19 09/03/2019
// Design Name:   write_block
// Module Name:   C:/Users/student/Desktop/CO_2019/G2_modules/write_block_TB.v
// Project Name:  G2_modules
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Write_Block_TB;

	// Inputs
	reg [0:15] ans_dm;
	reg clk;
	reg reset;

	// Outputs
	wire [0:15] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	Write_Block uut (
		.ans_dm(ans_dm), 
		.clk(clk), 
		.reset(reset), 
		.ans_wb(ans_wb)
	);
always begin
clk=0;
forever #5 clk = ~clk;
end
	initial begin
		// Initialize Inputs
		ans_dm = 0;
		reset = 0;
      clk=1;
		reset=1;
		#10
      ans_dm=16'b0000000000000000;
      #10
      ans_dm=16'b1111111111111111;
      #10
		reset=0;
      ans_dm=16'b0000000000000010;
  end
 endmodule
