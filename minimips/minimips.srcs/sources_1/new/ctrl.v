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
    input wire                   clk,
	input wire					 rst,

	input wire                   stallreq_from_id, // 来自ID阶段的暂停请求
	input wire                   stallreq_from_ex, // 来自EX阶段的暂停请求
	output wire[5:0]              stall       
	
);
    assign stall = (rst==1'b1)? 6'b000000: ((stallreq_from_ex)? 6'b000111:((stallreq_from_id)? 6'b000011:6'b000000)); 
    /*
    // 1表示暂停，0表示继续执行
	always @ (clk) begin
		if(rst == `RstEnable) begin
			stall <= 6'b000000;
		end else if(stallreq_from_ex) begin
			stall <= 6'b111000;
		end else if(stallreq_from_id) begin
			stall <= 6'b110000;			
		end else begin
			stall <= 6'b000000;
		end    //if
	end      //always
			*/

endmodule
