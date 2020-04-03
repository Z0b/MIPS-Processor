`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:49 08/22/2019 
// Design Name: 
// Module Name:    ALU_1 
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
module ALU(A, B, op_dec, data_in, ans_ex, data_out, DM_data ,clk, reset, flag_ex);

input [15:0] A,B,data_in;
input [5:0] op_dec;
input clk,reset;

output reg[15:0] ans_ex,DM_data,data_out;
output [1:0] flag_ex;

wire [15:0] ans_tmp,data_out_buff;
wire[15:0] temp,add,ans;
wire ans_zero,overflow;
reg[1:0] flag_prv;

assign temp =(op_dec[0] == 1'b1 ? (~B + 16'b0000000000000001) : B);
assign {c1, add[14:0]} = A[14:0] + temp[14:0];
assign {c2, add[15]} = c1 + A[15] + temp[15];
assign overflow = c1 ^ c2;
RSA shift (A,B,ans);

assign ans_tmp=(op_dec==6'b000000 ? add :
	
	(op_dec==6'b000001 ? add:
	(op_dec==6'b000010 ? B:
	(op_dec==6'b000100 ? A&B:
	(op_dec==6'b000101 ? A|B:
	(op_dec==6'b000110 ? A^B:
	(op_dec==6'b000111 ? ~B:
	(op_dec==6'b001000 ? add:
	(op_dec==6'b001001 ? add:
	(op_dec==6'b001010 ? B:
	(op_dec==6'b001100 ? A&B:
	(op_dec==6'b001101 ? A|B:
	(op_dec==6'b001110 ? A^B:
	(op_dec==6'b001111 ? ~B:
	(op_dec==6'b010000 ? ans_ex:
	(op_dec==6'b010001 ? ans_ex:
	(op_dec==6'b010100 ? A:
	(op_dec==6'b010101 ? A:
	(op_dec==6'b010110 ? data_in:
	(op_dec==6'b010111 ? ans_ex:
	(op_dec==6'b011000 ? ans_ex:
	(op_dec==6'b011001 ? A<<B:
	(op_dec==6'b011010 ? A>>B:
	(op_dec==6'b011011 ? ans:
	(op_dec==6'b011100 ? ans_ex:
	(op_dec==6'b011101 ? ans_ex:
	(op_dec==6'b011110 ? ans_ex:
	(op_dec==6'b011111 ? ans_ex:  16'b0000000000000000))))))))))))))))))))))))))));


assign flag_ex[0]=(reset == 1'b0 ? 1'b0 :(op_dec == 6'b000000 || op_dec == 6'b000001 || op_dec == 6'b001000 || op_dec == 6'b001001 ? overflow : 1'b0));

assign flag_ex[1] = (reset == 1'b0 ? 1'b0 : (ans_tmp == 16'b0000000000000000)? 1'b1 : 1'b0);
assign data_out_buff = (op_dec == 6'b010111 ?A : data_out);

always@(posedge clk,negedge reset)
begin 
if(reset==1'b0)
	begin 
		ans_ex = 16'b0;
		data_out = 16'b0;
		DM_data = 16'b0;
	end

else
	begin
		ans_ex = ans_tmp;
		data_out = data_out_buff;
		DM_data = B;
		flag_prv = flag_ex;
	end
end
endmodule

module RSA(A,B,shifted);
input [15:0] A,B;
output [15:0] shifted;
assign shifted[15] =A[15];
assign shifted[14:0]=A[14:0]>>B[14:0];
endmodule




  



