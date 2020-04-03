`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:57 08/20/2019 
// Design Name: 
// Module Name:    prog_mem 
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
module PM_Block(
    output [31:0] ins,
    output [15:0] current_address,
    input [15:0] jmp_loc,
    input pc_mux_sel,
    input stall,
    input stall_pm,
    input reset,
    input clk
    );
   
	 reg [15:0] hold_address;
    reg [15:0] next_address;
    wire [15:0] CAJ;
    wire [15:0] CAR; 
    reg [31:0] ins_prv;
	 wire [31:0] ins_pm;
    wire [31:0] PM_out;
    wire [15:0] hold_address_tmp;
    wire [15:0] next_address_tmp;
    wire [31:0] ins_prv_tmp;
	 D_M Prog_Mem(
  .clka(clk), // input clka
  .addra(current_address), // input [15 : 0] addra
  .douta(PM_out) // output [31 : 0] douta
);

    
//	 reg [31:0] PM_out_tmp;
    
    assign CAJ = (stall == 1'b0) ? next_address : hold_address;
    assign CAR = (pc_mux_sel == 1'b0) ? CAJ : jmp_loc;
    assign current_address  = (reset == 1'b0) ? 16'b0 : CAR;

    assign ins_pm = (stall_pm == 1'b0) ? PM_out : ins_prv_tmp;
    assign ins = (reset == 1'b0) ? 32'b0 : ins_pm;
    
    
    assign hold_address_tmp = (reset == 1'b0) ? 16'b0 : hold_address;
    assign next_address_tmp = (reset == 1'b0) ? 16'b0 : next_address;
    assign ins_prv_tmp = (reset == 1'b0) ? 32'b0 : ins_prv;

    always @ (posedge clk) begin
        hold_address = current_address;
        next_address = current_address + 16'b0000000000000001;
        ins_prv = ins;
    end
    
endmodule
