`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:33 10/06/2018
// Design Name:   MIPS
// Module Name:   C:/Users/student/Desktop/CO_13/Execution_Block/MIPS_tb.v
// Project Name:  Execution_Block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_TB;

	// Inputs
	reg [15:0] data_in;
	reg clk;
	reg interrupt;
	reg reset;

	// Outputs
	 wire [15:0] data_out;
    wire [31:0] ins;
    wire [15:0] A;
    wire [15:0] B;
    wire [15:0] current_address;
    wire [15:0] ans_ex;
    wire [15:0] ans_dm;
    wire [15:0] ans_wb;
    wire [1:0] mux_sel_A;
    wire [1:0] mux_sel_B;
    wire imm_sel;

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.data_in(data_in), 
		.clk(clk), 
		.interrupt(interrupt), 
		.reset(reset), 
		.data_out(data_out),
		.ins(ins),
		.A(A),
		.B(B),
		.current_address(current_address),
		.ans_ex(ans_ex),
		.ans_dm(ans_dm),
		.ans_wb(ans_wb),
		.mux_sel_A(mux_sel_A),
		.mux_sel_B(mux_sel_B),
		.imm_sel(imm_sel)
	);

		initial begin
		// Initialize Inputs
					data_in = 0;
					interrupt = 0;
					clk = 0;
					reset = 1;
					#200; reset = 0;
					#500; reset = 1;
					#1800; data_in = 'h0008;
		// Wait 100 ns for global reset to finish
				  end
		always
		         #500 clk = ~clk;
		// Add stimulus here
		// Add stimulus here

	
      
endmodule

