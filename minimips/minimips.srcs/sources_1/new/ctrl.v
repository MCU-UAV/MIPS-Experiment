`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/24 10:41:54
// Design Name: 
// Module Name: ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`include "defines.v"

module ctrl(

	input wire					 rst,

	input wire                   stallreq_from_id, // 来自ID阶段的暂停请求
	input wire                   stallreq_from_ex, // 来自EX阶段的暂停请求
	output reg[5:0]              stall       
	
);


    // 1表示暂停，0表示继续执行
	always @ (*) begin
		if(rst == `RstEnable) begin
			stall <= 6'b000000;
		end else if(stallreq_from_ex == 1'b1) begin
			stall <= 6'b001111;
		end else if(stallreq_from_id == 1'b1) begin
			stall <= 6'b000111;			
		end else begin
			stall <= 6'b000000;
		end    //if
	end      //always
			

endmodule
