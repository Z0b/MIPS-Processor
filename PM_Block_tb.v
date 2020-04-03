`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:53:52 08/20/2019
// Design Name:   program_memory
// Module Name:   C:\Users\patel\Desktop\CLG\Sem - 3\CO\LAB\L1\program_memory_TB.v
// Project Name:  L1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module PM_Block_TB;

	// Inputs
	reg [15:0] jmp_loc;
	reg pc_mux_sel;
	reg stall;
	reg stall_pm;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire [15:0] current_address;
	

	// Instantiate the Unit Under Test (UUT)
	PM_Block uut (
		.ins(ins), 
		.current_address(current_address), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.stall(stall), 
		.stall_pm(stall_pm), 
		.reset(reset), 
		.clk(clk)
	);
    
   always begin
        clk = 0;
        forever #5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		
		#2
		reset = 0;
		jmp_loc = 'h0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		
		#6
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		
		#2
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		
		#30
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 0;
		stall = 1;
		stall_pm = 0;
		
		#10
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 1;
		
		#10
		reset = 1;
		jmp_loc = 'h0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		
		
		
	end
      
endmodule

