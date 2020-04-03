`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:27:16 10/15/2019
// Design Name:   dependency_check
// Module Name:   C:/Users/patel/Desktop/CLG/Sem - 3/CO/LAB/MIPS/DC_TB.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dependency_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DC_Block_TB;

	// Inputs
	reg [31:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] imm;
	wire [5:0] op_dec;
	wire [4:0] RW_dm;
	wire [1:0] mux_sel_A;
	wire [1:0] mux_sel_B;
	wire imm_sel;
	wire mem_en_ex;
	wire mem_rw_ex;
	wire mem_mux_sel_dm;

	// Instantiate the Unit Under Test (UUT)
	DC_Block uut (
		.ins(ins), 
		.clk(clk), 
		.reset(reset), 
		.imm(imm), 
		.op_dec(op_dec), 
		.RW_dm(RW_dm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm)
	);

	initial begin
		// Initialize Inputs
		ins = 32'b0;
		reset = 0;
      #10;
		reset=1;
		ins = 32'b00000000001000100001100000000000;
		#10;
		ins = 32'b01010000100000010000000000000000;
		#20;
		ins = 32'b00010000101000010010000000000000;
		#10;
		ins = 32'b00110100110000010000000000000101;

	end
	
   initial begin
   clk=0;
	forever begin
	#5;
	clk=~clk;
	end

	end
      
endmodule

