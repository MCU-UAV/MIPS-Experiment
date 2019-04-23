//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     RegFile
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
`include "defines.v"
module RegFile
(
    input  wire         clk,
    input  wire         rst,
    // read section
    input  wire [ 4: 0] r1addr,
    output reg [31: 0] r1data,
    input  wire [ 4: 0] r2addr,
    output reg [31: 0] r2data,
    // write section
    input  wire         wen,       // write enable
    input  wire [ 4: 0] waddr,     // write address
    input  wire [31: 0] wdata      // write data
);
    reg  [31: 0] GPR [31: 0]; // General-Purpose Registers

    integer i;
    initial begin//系统运行之初对寄存器清零
        for (i = 0; i < 32; i = i + 1)
            GPR[i] = 32'b0;
    end

    always @(posedge clk) begin//写端口逻辑
        if(!rst) begin
            if(wen) GPR[waddr] <= wdata;
        end
    end
    
    always @(*)begin
        if(rst== 1'b0) begin    //复位状态只能读出0
            r1data<=32'b0;
        end else if(r1addr==5'b0) begin//读0号寄存器只能读出0
            r1data<=32'b0;
        end else if((r1addr==waddr)&&wen) begin
            r1data<=wdata;
        end else r1data<=GPR[r1addr];
    end
    
    always @(*)begin
        if(rst== 1'b0) begin    //复位状态只能读出0
            r2data<=32'b0;
        end else if(r2addr==5'b0) begin//读0号寄存器只能读出0
            r2data<=32'b0;
        end else if((r2addr==waddr)&&wen) begin
            r2data<=wdata;
        end else r2data<=GPR[r2addr];
    end

endmodule
