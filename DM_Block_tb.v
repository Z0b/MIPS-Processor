`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:30 08/27/2019
// Design Name:   data_mem
// Module Name:   C:/Users/patel/Desktop/CLG/Sem - 3/CO/LAB/L1/dat_mem_TB.v
// Project Name:  L1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DM_Block_TB;

	// Inputs
	reg [15:0] DM_data;
	reg [15:0] ans_ex;
	reg mem_rw_ex;
	reg mem_en_ex;
	reg mem_mux_sel_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] ans_dm;

	// Instantiate the Unit Under Test (UUT)
	DM_Block uut (
		.DM_data(DM_data), 
		.ans_ex(ans_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_en_ex(mem_en_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm), 
		.reset(reset), 
		.clk(clk), 
		.ans_dm(ans_dm)
	);

	always begin
        clk = 0;
        forever #5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		DM_data = 'hFFFF;
		ans_ex = 'h0003;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		
		#2
		reset=0;
		#6
		reset=1;
		#2
		mem_en_ex=1;
		mem_mux_sel_dm=1;
		#10
		mem_rw_ex=1;
		#10
		mem_rw_ex=0;
		
		
		
	end
		      
endmodule

