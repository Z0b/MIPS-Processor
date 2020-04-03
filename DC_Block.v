`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:47 10/03/2019 
// Design Name: 
// Module Name:    dependency_check_block 
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
module DC_Block(ins, clk, reset, imm, op_dec, RW_dm, mux_sel_A, mux_sel_B, imm_sel, mem_en_ex, mem_rw_ex, mem_mux_sel_dm );

input [31:0] ins;
input clk, reset;

output [15:0] imm;
output [4:0] RW_dm;
output [5:0] op_dec;
output [1:0] mux_sel_A, mux_sel_B;
output  imm_sel, mem_en_ex, mem_rw_ex, mem_mux_sel_dm ;

wire JMP, Cond_J, LD_fb, IMM, Ld, ST;
wire [14:0] a1;
wire a2,a3,a4,a5,a6,a7;
wire or1,or2;
wire [14:0] w1;
wire c1,c2,c3,c4,c5,c6;

reg d1, d2, d3, d4, d5, d6, d7, d8, d9;
reg [5:0]r1;
reg [15:0]r2;
reg [4:0]r3,r4,r5,r6,r7,r8;

assign JMP = ((~ins[26]) & (~ins[27]) & (~ins[28]) & (ins[29]) & (ins[30]) & (~ins[31]));
assign Cond_J = ((ins[28]) & (ins[29]) & (ins[30]) & (~ins[31]));
assign LD_fb = ((~ins[26]) & (~ins[27]) & (ins[28]) & (~ins[29]) & (ins[30]) & (~ins[31]) & (~d1));
assign IMM = ((ins[29]) & (~ins[30]) & (~ins[31]));
assign Ld = ((~ins[26]) & (~ins[27]) & (ins[28]) & (~ins[29]) & (ins[30]) & (~ins[31]));
assign ST = ((ins[26]) & (~ins[27]) & (ins[28]) & (~ins[29]) & (ins[30]) & (~ins[31]));

assign a2 = (Ld & (~d3));
assign or1 = (~(JMP | Cond_J | d1));
assign w1 = ((or1==1'b0)? 15'b000000000000000 : 15'b111111111111111);
assign a1 = ((ins[25:11]) & w1); 
assign or2 = (d3 | d4);
assign a3 = (or2 & (~d2));

assign c1= ((r6==r3) ? 1'b1 : 1'b0 );
assign c2= ((r3==r7) ? 1'b1 : 1'b0 );
assign c3= ((r3==r8) ? 1'b1 : 1'b0 );
assign c4= ((r5==r6) ? 1'b1 : 1'b0 );
assign c5= ((r5==r7) ? 1'b1 : 1'b0 );
assign c6= ((r5==r8) ? 1'b1 : 1'b0 );

assign a4 = ((~c1) & c2);
assign a5 = ((~c1) & (~c2) & c3);
assign a6 = ((~c4) & c5);
assign a7 = ((~c4) & (~c5) & c6);

always@(posedge clk)
begin
	if (reset==1'b1)
	    begin
		 d1<=LD_fb;
		 d2<=ins[26];
		 d3<=a2;
		 d4<=ST;
		 d5<=IMM;
		 d6<=d2;
		 d7<=a3;
		 d8<=or2;
		 d9<=d7;
		 r1<=ins[31:26];
		 r2<=ins[15:0];
		 r3<=a1[9:5];
		 r4<=a1[14:10];
		 r5<=a1[4:0];
		 r6<=r4;
		 r7<=r6;
		 r8<=r7;
		 
		 end
		 
   else
       begin
		 d1<=1'b0;
		 d2<=1'b0;
		 d3<=1'b0;
		 d4<=1'b0;
		 d5<=1'b0;
		 d6<=1'b0;
		 d7<=1'b0;
		 d8<=1'b0;
		 d9<=1'b0;
		 r1<=6'b0;
		 r2<=15'b0;
		 r3<=5'b0;
		 r4<=5'b0;
		 r5<=5'b0;
		 r6<=1'b0;
		 r7<=1'b0;
		 r8<=1'b0;
		 
		 end
end	

assign imm_sel = d5;
assign mem_rw_ex = d6;
assign mem_mux_sel_dm = d9;
assign mem_en_ex = d8;
assign op_dec=r1;
assign imm=r2;
assign RW_dm=r7;
assign mux_sel_A=(((c1==1'b1 ? 2'b01 : (a4==1'b1 ? 2'b10 :(a5==1'b1 ? 2'b11 : 2'b00)))));
assign mux_sel_B=(( (c4==1'b1 ? 2'b01 : (a6==1'b1 ? 2'b10 :(a7==1'b1 ? 2'b11 : 2'b00)))));



endmodule
