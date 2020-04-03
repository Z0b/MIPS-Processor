`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:56:24 09/10/2019
// Design Name:   jc_block
// Module Name:   C:/Users/patel/Desktop/CLG/Sem - 3/CO/LAB/L1/jc_block_TB.v
// Project Name:  L1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jc_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JC_Block_TB;

	// Inputs
	reg [15:0] jmp_address_pm;
	reg [15:0] current_address;
	reg [5:0] op;
	reg [1:0] flag_ex;
	reg interrupt;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] jmp_loc;
	wire pc_mux_sel;

	// Instantiate the Unit Under Test (UUT)
	JC_Block uut (
		.jmp_address_pm(jmp_address_pm), 
		.current_address(current_address), 
		.op(op), 
		.flag_ex(flag_ex), 
		.interrupt(interrupt), 
		.clk(clk), 
		.reset(reset), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel)
	);
	
	always begin
        clk = 0;
        forever #5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		jmp_address_pm = 'h0000;
		current_address = 'h0001;
		op = 'h00;
		flag_ex = 2'b11;
		interrupt = 0;
		reset = 1;
		
		#2 //2
		jmp_address_pm = 'h0000;
		current_address = 'h0001;
		op = 'h00;
		flag_ex = 2'b11;
		interrupt = 0;
		clk = 0;
		reset = 0;
		
		
		#6 //8
		jmp_address_pm = 'h0000;
		current_address = 'h0001;
		op = 'h00;
		flag_ex = 2'b11;
		interrupt = 0;
		reset = 1;
		
		#8 //16
		jmp_address_pm = 'h0000;
		current_address = 'h0001;
		op = 'h00;
		flag_ex = 2'b11;
		interrupt = 1;
		reset = 1;
		
		#10 //26
		jmp_address_pm = 'h0008;
		current_address = 'h0001;
		op = 'h00;
		flag_ex = 2'b11;
		interrupt = 0;
		reset = 1;
		
		#10 //36
		jmp_address_pm = 'h0008;
		current_address = 'h0001;
		op = 'h18;
		flag_ex = 2'b11;
		interrupt = 0;
		reset = 1;
		
		#20 //56
		jmp_address_pm = 'h0008;
		current_address = 'h0001;
		op = 'h10;
		flag_ex = 2'b00;
		interrupt = 0;
		reset = 1;
		
		#10 //66
		jmp_address_pm = 'h0008;
		current_address = 'h0001;
		op = 'h1e;
		flag_ex = 2'b00;
		interrupt = 0;
		reset = 1;

		
		
	end
      
endmodule

