`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:57 08/06/2018
// Design Name:   Execution_Block
// Module Name:   E:/param/SEM_3/CO/Lab_1/Execution_Block_tb.v
// Project Name:  Lab_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execution_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [15:0] data_in;
	reg [5:0] op_dec;
	reg clk;
	reg reset;
	integer i;
	// Outputs
	wire [15:0] ans_ex;
	wire [15:0] data_out;
	wire [15:0] DM_data;
	wire [1:0] flag_ex;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.ans_ex(ans_ex), 
		.data_out(data_out), 
		.DM_data(DM_data), 
		.flag_ex(flag_ex), 
		.A(A), 
		.B(B), 
		.data_in(data_in), 
		.op_dec(op_dec), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		A = 16'h0;
		B = 16'h0;
		data_in = 16'h0;
		op_dec = 6'b0;
		clk = 1'b0;
		reset = 1'b1;
		
		#2	reset = 1'b0;
		
		#6	reset = 1'b1;
		
		#2	/*A = 16'h4000;
			B = 16'hc000;
			data_in = 16'h0008;
			op_dec = 6'b000000;

		#10 op_dec = 6'b000001;

		#10 op_dec = 6'b000010;

		#10 op_dec = 6'b000100;

		#10 op_dec = 6'b000101;

		#10 op_dec = 6'b000110;

		#10 op_dec = 6'b000111;

		#10 op_dec = 6'b001000;

		#10 op_dec = 6'b001001;

		#10 op_dec = 6'b001010;

		#10 op_dec = 6'b001100;

		#10 op_dec = 6'b001101;

		#10 op_dec = 6'b001110;

		#10 op_dec = 6'b001111;

		#10 op_dec = 6'b010000;

		#10 op_dec = 6'b010001;

		#10 op_dec = 6'b010100;

		#10 op_dec = 6'b010101;

		#10 op_dec = 6'b010110;

		#10 op_dec = 6'b010111;

		#10 op_dec = 6'b011000;

		#10 A = 16'hc000;
			B = 16'h0001;
			op_dec = 6'b011001;

		#10 op_dec = 6'b011010;

		#10 op_dec = 6'b011011;

		#10 op_dec = 6'b011100;

		#10 op_dec = 6'b011101;

		#10 op_dec = 6'b011110;

		#10 op_dec = 6'b011111;
		*/
			A = 16'h4000;
			B = 16'hc000;
			data_in = 16'h0008;
		
		for(i=0;i<25;i=i+1)
		begin
			if((i==3) || (i==11) || (i==18) ||(i==19))
			begin
				
			end
			else
			begin

				op_dec = i;
				#10;
			end			
		end
		
		A = 16'hc000;
		B = 16'h0001;
		
		for(i=25;i<32;i=i+1)
		begin
			op_dec = i;
			#10;
		end
		
	end

	always 
		#5 clk = ~clk;
      
endmodule

