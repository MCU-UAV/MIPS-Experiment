module mycpu_top(
    input         clk,
    input         resetn,
    // inst sram interface
    output        inst_sram_en,
    output [ 3:0] inst_sram_wen,
    output [31:0] inst_sram_addr,
    output [31:0] inst_sram_wdata,
    input  [31:0] inst_sram_rdata,
    // data sram interface
    output        data_sram_en,
    output [ 3:0] data_sram_wen,
    output [31:0] data_sram_addr,
    output [31:0] data_sram_wdata,
    input  [31:0] data_sram_rdata,
    // trace debug interface
    output [31:0] debug_wb_pc,
    output [ 3:0] debug_wb_rf_wen,
    output [ 4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata
);
reg         reset;
always @(posedge clk) reset <= ~resetn;

wire [31:0] seq_pc;
wire [31:0] nextpc;
// fs_ -- IF  stage
wire        fs_allowin;
wire        fs_ready_go;
wire        fs_to_ds_valid;
reg         fs_valid;
reg  [31:0] fs_pc;
wire [31:0] inst;
// ds_ -- ID  stage
wire        ds_stall;
wire        ds_allowin;
wire        ds_ready_go;
wire        ds_to_es_valid;
reg         ds_valid;
reg  [31:0] ds_pc;
reg  [31:0] ds_inst;
wire [ 5:0] op;
wire [ 4:0] rs;
wire [ 4:0] rt;
wire [ 4:0] rd;
wire [ 4:0] sa;
wire [ 5:0] func;
wire [15:0] imm;
wire [25:0] jidx;
wire [63:0] op_d;
wire [31:0] rs_d;
wire [31:0] rt_d;
wire [31:0] rd_d;
wire [31:0] sa_d;
wire [63:0] func_d;
wire        inst_addu;
wire        inst_subu;
wire        inst_slt;
wire        inst_sltu;
wire        inst_and;
wire        inst_or;
wire        inst_xor;
wire        inst_nor;
wire        inst_sll;
wire        inst_srl;
wire        inst_sra;
wire        inst_addiu;
wire        inst_lui;
wire        inst_lw;
wire        inst_sw;
wire        inst_beq;
wire        inst_bne;
wire        inst_jal;
wire        inst_jr;
wire [11:0] alu_op;
wire        src1_is_sa;  
wire        src1_is_pc;
wire        src2_is_imm; 
wire        src2_is_8;
wire        res_from_mem;
wire        dst_is_r31;  
wire        dst_is_rt;   
wire        gr_we;       
wire        mem_we;      
wire [ 4:0] dest;
wire        is_load_op;
wire [ 4:0] rf_raddr1;
wire [31:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [31:0] rf_rdata2;
wire        rs_mch_es_dst;
wire        rt_mch_es_dst;
wire        rs_mch_ms_dst;
wire        rt_mch_ms_dst;
wire        rs_mch_ws_dst;
wire        rt_mch_ws_dst;
wire [31:0] rs_value;
wire [31:0] rt_value;
wire        rs_eq_rt;
wire        br_taken;
wire [31:0] br_target;
// es_ -- EXE stage
wire        es_allowin;
wire        es_ready_go;
wire        es_to_ms_valid;
reg         es_valid;
reg  [31:0] es_pc;
reg  [31:0] es_rs_value;
reg  [31:0] es_rt_value;
reg  [15:0] es_imm;
reg  [11:0] es_alu_op;
reg         es_src1_is_sa;  
reg         es_src1_is_pc;
reg         es_src2_is_imm; 
reg         es_src2_is_8;
reg         es_res_from_mem;
reg         es_gr_we;
reg         es_mem_we;
reg  [ 4:0] es_dest;
reg         es_is_load_op;
wire [31:0] alu_src1;
wire [31:0] alu_src2;
wire [31:0] alu_result;
// ms_ -- MEM stage
wire        ms_allowin;
wire        ms_ready_go;
wire        ms_to_ws_valid;
reg         ms_valid;
reg  [31:0] ms_pc;
reg  [ 4:0] ms_dest;
reg         ms_res_from_mem;
reg         ms_gr_we;
reg  [31:0] ms_alu_result;
wire [31:0] mem_result;
wire [31:0] final_result;
// ws_ -- WB  stage
wire        ws_allowin;
wire        ws_ready_go;
reg         ws_valid;
reg  [31:0] ws_pc;
reg         ws_gr_we;
reg  [ 4:0] ws_dest;
reg  [31:0] ws_final_result;
wire        rf_we;
wire [ 4:0] rf_waddr;
wire [31:0] rf_wdata;


// pre-IF stage
assign to_fs_valid  = ~reset;
assign seq_pc = fs_pc + 3'h4;
assign nextpc = br_taken ? br_target : seq_pc; 

// IF stage
assign fs_ready_go    = 1'b1;
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid = fs_valid && fs_ready_go;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end
    else if (fs_allowin) begin
        fs_valid <= to_fs_valid;
    end

    if (reset) begin
        fs_pc <= 32'hbfbffffc;  //trick: to make nextpc be 0xbfc00000 during reset 
    end
    else if (to_fs_valid && fs_allowin) begin
        fs_pc <= nextpc;
    end
end

assign inst_sram_en    = to_fs_valid && fs_allowin;
assign inst_sram_wen   = 4'h0;
assign inst_sram_addr  = nextpc;
assign inst_sram_wdata = 32'b0;

assign inst            = inst_sram_rdata;
    
// ID stage
assign ds_stall = (es_valid && es_is_load_op && (es_dest!=5'b0) && !inst_jal && (es_dest==rs || (es_dest==rt && !dst_is_rt)));
assign ds_ready_go    = !ds_stall;
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go;


// EXE stage




// MEM stage




// WB stage





endmodule

