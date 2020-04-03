`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:32 08/06/2018 
// Design Name: 
// Module Name:    ALU 
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
module EX_Block(A,B,data_in,op_dec,clk,reset,ans_ex,DM_data,data_out,flag_ex);

input [15:0] A,B,data_in;
input [5:0] op_dec;
input clk,reset;
output reg[15:0] ans_ex,DM_data,data_out;
output [1:0] flag_ex;

wire [15:0] x,y,z,C,AS,ASR,ASS,z1,result;
wire [1:0] del,del1;
wire r,s,sft,C1,C2,r1;
wire [15:0] ans_tmp,data_out_buff;
reg[1:0] flag_prv;



assign result = (op_dec[0]==1'b0) ? B :((op_dec[0]==1'b1) ? ~B + 16'b0000000000000001 : B);
assign {C1,x[14:0]} = A[14:0]+result[14:0];
assign {C2,x[15]}=A[15]+result[15]+C1; 
assign r = C1^C2;


assign C[15:0] = (~B[15:0] + 16'b0000000000000001);


assign ASS=(B[3:0]==4'b0000)?(A):
			 (B[3:0]==4'b0001)?({A[15],A[15:1]}):
			 (B[3:0]==4'b0010)?({{2{A[15]}},A[15:2]}):
			 (B[3:0]==4'b0011)?({{3{A[15]}},A[15:3]}):
			 (B[3:0]==4'b0100)?({{4{A[15]}},A[15:4]}):
			 (B[3:0]==4'b0101)?({{5{A[15]}},A[15:5]}):
			 (B[3:0]==4'b0110)?({{6{A[15]}},A[15:6]}):
			 (B[3:0]==4'b0111)?({{7{A[15]}},A[15:7]}): 
			 (B[3:0]==4'b1000)?({{8{A[15]}},A[15:8]}):
				(B[3:0]==4'b1001)?({{9{A[15]}},A[15:9]}):
				(B[3:0]==4'b1010)?({{10{A[15]}},A[15:10]}):
				(B[3:0]==4'b1011)?({{11{A[15]}},A[15:11]}):
				(B[3:0]==4'b1100)?({{12{A[15]}},A[15:12]}):
				(B[3:0]==4'b1101)?({{13{A[15]}},A[15:13]}):
				(B[3:0]==4'b1110)?({{14{A[15]}},A[15:14]}):
				(B[3:0]==4'b1111)?({{15{A[15]}},A[15]}):0;
				
assign ans_tmp = (op_dec == 6'b000000)?x:
					 ((op_dec == 6'b000001)?x:
					 ((op_dec == 6'b000010)?B:
					 ((op_dec == 6'b000100)?(A&B):
					 ((op_dec == 6'b000101)?(A|B):
					 ((op_dec == 6'b000110)?(A^B):
					 ((op_dec == 6'b000111)?~B:
					 ((op_dec == 6'b001000)?x:
					 ((op_dec == 6'b001001)?x:
					 ((op_dec == 6'b001010)?B:
					 ((op_dec == 6'b001100)?(A&B):
					 ((op_dec == 6'b001101)?(A|B):
					 ((op_dec == 6'b001110)?(A^B):
					 ((op_dec == 6'b001111)?~B:
					 ((op_dec == 6'b010000)?ans_tmp:
					 ((op_dec == 6'b010001)?ans_tmp:
					 ((op_dec == 6'b010100)?A:
					 ((op_dec == 6'b010101)?A:
					 ((op_dec == 6'b010110)?data_in:
					 ((op_dec == 6'b010111)?ans_tmp:
					 ((op_dec == 6'b011000)?ans_tmp:
					 ((op_dec == 6'b011001)?(A<<B):
					 ((op_dec == 6'b011010)?(A>>B):
					 ((op_dec == 6'b011011)?ASS: 
					 ((op_dec == 6'b011100)?ans_tmp:
					 ((op_dec == 6'b011100)?ans_tmp:
					 ((op_dec == 6'b011101)?ans_tmp:
					 ((op_dec == 6'b011110)?ans_tmp:
					 ((op_dec == 6'b011111)?ans_tmp:ans_tmp))))))))))))))))))))))))))));
					 
					 
assign s = (ans_tmp == 16'b0)?1'b1:1'b0;

assign flag_ex =(op_dec == 6'b000000)?{s,r}:
					 ((op_dec == 6'b000001)?{s,r}:
					 ((op_dec == 6'b000010)?{s,1'b0}:
					 ((op_dec == 6'b000100)?{s,1'b0}:
					 ((op_dec == 6'b000101)?{s,1'b0}:
					 ((op_dec == 6'b000110)?{s,1'b0}:
					 ((op_dec == 6'b000111)?{s,1'b0}:
					 ((op_dec == 6'b001000)?{s,r}:
					 ((op_dec == 6'b001001)?{s,r}:
					 ((op_dec == 6'b001010)?{s,1'b0}:
					 ((op_dec == 6'b001100)?{s,1'b0}:
					 ((op_dec == 6'b001101)?{s,1'b0}:
					 ((op_dec == 6'b001110)?{s,1'b0}:
					 ((op_dec == 6'b001111)?{s,1'b0}:
					 ((op_dec == 6'b010000)?{1'b0,1'b0}:
					 ((op_dec == 6'b010001)?{1'b0,1'b0}:
					 ((op_dec == 6'b010100)?{1'b0,1'b0}:
					 ((op_dec == 6'b010101)?{1'b0,1'b0}:
					 ((op_dec == 6'b010110)?{s,1'b0}:
					 ((op_dec == 6'b010111)?{1'b0,1'b0}:
					 ((op_dec == 6'b011000)?{1'b0,1'b0}:
					 ((op_dec == 6'b011001)?{s,1'b0}:
					 ((op_dec == 6'b011010)?{s,1'b0}:
					 ((op_dec == 6'b011011)?{s,1'b0}:
					 ((op_dec == 6'b011100)?flag_ex:
					 ((op_dec == 6'b011100)?flag_ex:
					 ((op_dec == 6'b011101)?flag_ex:
					 ((op_dec == 6'b011110)?flag_ex:
					 ((op_dec == 6'b011111)?flag_ex:flag_ex))))))))))))))))))))))))))));
					 
				
assign data_out_buff = (op_dec == 6'b010111)?A:data_out;
					 
//Register			 
					 
always @(posedge clk,negedge reset)
begin
	if(reset == 1'b0)
	begin
		ans_ex <= 16'b0;
		DM_data <= 16'b0;
		data_out <= 16'b0;
		flag_prv <= 16'b0;
	end
	else
	begin
		ans_ex <= ans_tmp;
		data_out <= data_out_buff;
		DM_data <= B;
		flag_prv <= flag_ex;
	end
end


endmodule
