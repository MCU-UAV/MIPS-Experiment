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
	output wire[5:0]              stall       
	
);
    assign stall = (rst==1'b1)? 6'b000000: ((stallreq_from_id)? 6'b000011:6'b000000); 

endmodule
