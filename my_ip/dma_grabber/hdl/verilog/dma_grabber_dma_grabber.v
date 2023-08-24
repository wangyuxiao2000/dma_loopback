// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="dma_grabber_dma_grabber,hls_ip_2021_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=7.072000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=150,HLS_SYN_LUT=200,HLS_VERSION=2021_2}" *)

module dma_grabber_dma_grabber (
        ap_local_block,
        ap_clk,
        ap_rst_n,
        is_r_TDATA,
        is_r_TVALID,
        is_r_TREADY,
        is_r_TKEEP,
        is_r_TSTRB,
        is_r_TLAST,
        os_TDATA,
        os_TVALID,
        os_TREADY,
        os_TKEEP,
        os_TSTRB,
        os_TLAST,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP
);

parameter    ap_ST_iter0_fsm_state1 = 1'd1;
parameter    ap_ST_iter1_fsm_state2 = 2'd2;
parameter    ap_ST_iter2_fsm_state3 = 2'd2;
parameter    ap_ST_iter1_fsm_state0 = 2'd1;
parameter    ap_ST_iter2_fsm_state0 = 2'd1;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

output   ap_local_block;
input   ap_clk;
input   ap_rst_n;
input  [31:0] is_r_TDATA;
input   is_r_TVALID;
output   is_r_TREADY;
input  [3:0] is_r_TKEEP;
input  [3:0] is_r_TSTRB;
input  [0:0] is_r_TLAST;
output  [31:0] os_TDATA;
output   os_TVALID;
input   os_TREADY;
output  [3:0] os_TKEEP;
output  [3:0] os_TSTRB;
output  [0:0] os_TLAST;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;

wire   [0:0] ap_local_deadlock;
 reg    ap_rst_n_inv;
wire   [0:0] en;
wire   [15:0] size;
reg   [0:0] p_start_V;
reg   [15:0] p_size_V;
reg   [15:0] p_cnt_V;
reg   [0:0] p_en_V;
reg    is_r_TDATA_blk_n;
reg   [0:0] ap_CS_iter0_fsm;
wire    ap_CS_iter0_fsm_state1;
reg   [1:0] ap_CS_iter1_fsm;
wire    ap_CS_iter1_fsm_state2;
reg   [1:0] ap_CS_iter2_fsm;
wire    ap_CS_iter2_fsm_state3;
wire   [0:0] p_start_V_load_load_fu_136_p1;
wire   [0:0] tmp_nbreadreq_fu_94_p6;
reg    os_TDATA_blk_n;
reg   [0:0] p_start_V_load_reg_230;
reg   [0:0] tmp_reg_237;
reg   [0:0] p_start_V_load_reg_230_pp0_iter1_reg;
reg   [0:0] tmp_reg_237_pp0_iter1_reg;
reg    ap_predicate_op45_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_predicate_op55_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg    ap_predicate_op56_write_state3;
wire    regslice_both_os_V_data_V_U_apdone_blk;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg   [31:0] tmp_data_V_reg_241;
reg   [3:0] tmp_keep_V_reg_246;
reg   [3:0] tmp_strb_V_reg_251;
wire   [0:0] in_last_V_fu_212_p2;
reg   [0:0] in_last_V_reg_256;
wire   [0:0] xor_ln946_fu_218_p2;
wire   [0:0] or_ln30_fu_158_p2;
wire   [15:0] add_ln229_fu_200_p2;
wire   [0:0] xor_ln30_fu_152_p2;
reg   [0:0] ap_NS_iter0_fsm;
reg   [1:0] ap_NS_iter1_fsm;
reg   [1:0] ap_NS_iter2_fsm;
reg    ap_ST_iter0_fsm_state1_blk;
reg    ap_ST_iter1_fsm_state2_blk;
reg    ap_ST_iter2_fsm_state3_blk;
wire    regslice_both_is_r_V_data_V_U_apdone_blk;
wire   [31:0] is_r_TDATA_int_regslice;
wire    is_r_TVALID_int_regslice;
reg    is_r_TREADY_int_regslice;
wire    regslice_both_is_r_V_data_V_U_ack_in;
wire    regslice_both_is_r_V_keep_V_U_apdone_blk;
wire   [3:0] is_r_TKEEP_int_regslice;
wire    regslice_both_is_r_V_keep_V_U_vld_out;
wire    regslice_both_is_r_V_keep_V_U_ack_in;
wire    regslice_both_is_r_V_strb_V_U_apdone_blk;
wire   [3:0] is_r_TSTRB_int_regslice;
wire    regslice_both_is_r_V_strb_V_U_vld_out;
wire    regslice_both_is_r_V_strb_V_U_ack_in;
wire    regslice_both_is_r_V_last_V_U_apdone_blk;
wire   [0:0] is_r_TLAST_int_regslice;
wire    regslice_both_is_r_V_last_V_U_vld_out;
wire    regslice_both_is_r_V_last_V_U_ack_in;
reg    os_TVALID_int_regslice;
wire    os_TREADY_int_regslice;
wire    regslice_both_os_V_data_V_U_vld_out;
wire    regslice_both_os_V_keep_V_U_apdone_blk;
wire    regslice_both_os_V_keep_V_U_ack_in_dummy;
wire    regslice_both_os_V_keep_V_U_vld_out;
wire    regslice_both_os_V_strb_V_U_apdone_blk;
wire    regslice_both_os_V_strb_V_U_ack_in_dummy;
wire    regslice_both_os_V_strb_V_U_vld_out;
wire    regslice_both_os_V_last_V_U_apdone_blk;
wire    regslice_both_os_V_last_V_U_ack_in_dummy;
wire    regslice_both_os_V_last_V_U_vld_out;
reg    ap_condition_328;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 p_start_V = 1'd0;
#0 p_size_V = 16'd0;
#0 p_cnt_V = 16'd0;
#0 p_en_V = 1'd0;
#0 ap_CS_iter0_fsm = 1'd1;
#0 ap_CS_iter1_fsm = 2'd1;
#0 ap_CS_iter2_fsm = 2'd1;
end

dma_grabber_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .en(en),
    .size(size),
    .ap_local_deadlock(ap_local_deadlock)
);

dma_grabber_regslice_both #(
    .DataWidth( 32 ))
regslice_both_is_r_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(is_r_TDATA),
    .vld_in(is_r_TVALID),
    .ack_in(regslice_both_is_r_V_data_V_U_ack_in),
    .data_out(is_r_TDATA_int_regslice),
    .vld_out(is_r_TVALID_int_regslice),
    .ack_out(is_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_is_r_V_data_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 4 ))
regslice_both_is_r_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(is_r_TKEEP),
    .vld_in(is_r_TVALID),
    .ack_in(regslice_both_is_r_V_keep_V_U_ack_in),
    .data_out(is_r_TKEEP_int_regslice),
    .vld_out(regslice_both_is_r_V_keep_V_U_vld_out),
    .ack_out(is_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_is_r_V_keep_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 4 ))
regslice_both_is_r_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(is_r_TSTRB),
    .vld_in(is_r_TVALID),
    .ack_in(regslice_both_is_r_V_strb_V_U_ack_in),
    .data_out(is_r_TSTRB_int_regslice),
    .vld_out(regslice_both_is_r_V_strb_V_U_vld_out),
    .ack_out(is_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_is_r_V_strb_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 1 ))
regslice_both_is_r_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(is_r_TLAST),
    .vld_in(is_r_TVALID),
    .ack_in(regslice_both_is_r_V_last_V_U_ack_in),
    .data_out(is_r_TLAST_int_regslice),
    .vld_out(regslice_both_is_r_V_last_V_U_vld_out),
    .ack_out(is_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_is_r_V_last_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 32 ))
regslice_both_os_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(tmp_data_V_reg_241),
    .vld_in(os_TVALID_int_regslice),
    .ack_in(os_TREADY_int_regslice),
    .data_out(os_TDATA),
    .vld_out(regslice_both_os_V_data_V_U_vld_out),
    .ack_out(os_TREADY),
    .apdone_blk(regslice_both_os_V_data_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 4 ))
regslice_both_os_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(tmp_keep_V_reg_246),
    .vld_in(os_TVALID_int_regslice),
    .ack_in(regslice_both_os_V_keep_V_U_ack_in_dummy),
    .data_out(os_TKEEP),
    .vld_out(regslice_both_os_V_keep_V_U_vld_out),
    .ack_out(os_TREADY),
    .apdone_blk(regslice_both_os_V_keep_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 4 ))
regslice_both_os_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(tmp_strb_V_reg_251),
    .vld_in(os_TVALID_int_regslice),
    .ack_in(regslice_both_os_V_strb_V_U_ack_in_dummy),
    .data_out(os_TSTRB),
    .vld_out(regslice_both_os_V_strb_V_U_vld_out),
    .ack_out(os_TREADY),
    .apdone_blk(regslice_both_os_V_strb_V_U_apdone_blk)
);

dma_grabber_regslice_both #(
    .DataWidth( 1 ))
regslice_both_os_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_last_V_reg_256),
    .vld_in(os_TVALID_int_regslice),
    .ack_in(regslice_both_os_V_last_V_U_ack_in_dummy),
    .data_out(os_TLAST),
    .vld_out(regslice_both_os_V_last_V_U_vld_out),
    .ack_out(os_TREADY),
    .apdone_blk(regslice_both_os_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_iter0_fsm <= ap_ST_iter0_fsm_state1;
    end else begin
        ap_CS_iter0_fsm <= ap_NS_iter0_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_iter1_fsm <= ap_ST_iter1_fsm_state0;
    end else begin
        ap_CS_iter1_fsm <= ap_NS_iter1_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_iter2_fsm <= ap_ST_iter2_fsm_state0;
    end else begin
        ap_CS_iter2_fsm <= ap_NS_iter2_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        p_cnt_V <= 16'd0;
    end else begin
        if ((1'b1 == ap_condition_328)) begin
            if (((tmp_nbreadreq_fu_94_p6 == 1'd1) & (p_start_V == 1'd1))) begin
                p_cnt_V <= add_ln229_fu_200_p2;
            end else if (((p_start_V_load_load_fu_136_p1 == 1'd0) & (or_ln30_fu_158_p2 == 1'd0))) begin
                p_cnt_V <= 16'd0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        p_en_V <= 1'd0;
    end else begin
        if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1) & (p_start_V_load_load_fu_136_p1 == 1'd0))) begin
            p_en_V <= en;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        p_size_V <= 16'd0;
    end else begin
        if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1) & (p_start_V_load_load_fu_136_p1 == 1'd0) & (or_ln30_fu_158_p2 == 1'd0))) begin
            p_size_V <= size;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        p_start_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_condition_328)) begin
            if (((tmp_nbreadreq_fu_94_p6 == 1'd1) & (p_start_V == 1'd1))) begin
                p_start_V <= xor_ln946_fu_218_p2;
            end else if (((p_start_V_load_load_fu_136_p1 == 1'd0) & (or_ln30_fu_158_p2 == 1'd0))) begin
                p_start_V <= 1'd1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1) & (tmp_nbreadreq_fu_94_p6 == 1'd1) & (p_start_V == 1'd1))) begin
        in_last_V_reg_256 <= in_last_V_fu_212_p2;
        tmp_data_V_reg_241 <= is_r_TDATA_int_regslice;
        tmp_keep_V_reg_246 <= is_r_TKEEP_int_regslice;
        tmp_strb_V_reg_251 <= is_r_TSTRB_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1))) begin
        p_start_V_load_reg_230 <= p_start_V;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))))) & (1'b1 == ap_CS_iter1_fsm_state2))) begin
        p_start_V_load_reg_230_pp0_iter1_reg <= p_start_V_load_reg_230;
        tmp_reg_237_pp0_iter1_reg <= tmp_reg_237;
    end
end

always @ (posedge ap_clk) begin
    if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1) & (p_start_V == 1'd1))) begin
        tmp_reg_237 <= tmp_nbreadreq_fu_94_p6;
    end
end

always @ (*) begin
    if (((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0))) begin
        ap_ST_iter0_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_iter0_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_iter1_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_iter1_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) begin
        ap_ST_iter2_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_iter2_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_iter0_fsm_state1) & (tmp_nbreadreq_fu_94_p6 == 1'd1) & (p_start_V == 1'd1))) begin
        is_r_TDATA_blk_n = is_r_TVALID_int_regslice;
    end else begin
        is_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (ap_predicate_op45_read_state1 == 1'b1) & (1'b1 == ap_CS_iter0_fsm_state1))) begin
        is_r_TREADY_int_regslice = 1'b1;
    end else begin
        is_r_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_reg_237_pp0_iter1_reg == 1'd1) & (p_start_V_load_reg_230_pp0_iter1_reg == 1'd1) & (1'b1 == ap_CS_iter2_fsm_state3)) | ((1'b1 == ap_CS_iter1_fsm_state2) & (tmp_reg_237 == 1'd1) & (p_start_V_load_reg_230 == 1'd1)))) begin
        os_TDATA_blk_n = os_TREADY_int_regslice;
    end else begin
        os_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))))) & (ap_predicate_op55_write_state2 == 1'b1) & (1'b1 == ap_CS_iter1_fsm_state2))) begin
        os_TVALID_int_regslice = 1'b1;
    end else begin
        os_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_iter0_fsm)
        ap_ST_iter0_fsm_state1 : begin
            ap_NS_iter0_fsm = ap_ST_iter0_fsm_state1;
        end
        default : begin
            ap_NS_iter0_fsm = 'bx;
        end
    endcase
end

always @ (*) begin
    case (ap_CS_iter1_fsm)
        ap_ST_iter1_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))))) & ~((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) & (1'b1 == ap_CS_iter0_fsm_state1))) begin
                ap_NS_iter1_fsm = ap_ST_iter1_fsm_state2;
            end else if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))))) & ((1'b0 == ap_CS_iter0_fsm_state1) | ((ap_predicate_op45_read_state1 == 1'b1) & (1'b1 == ap_CS_iter0_fsm_state1) & (is_r_TVALID_int_regslice == 1'b0))))) begin
                ap_NS_iter1_fsm = ap_ST_iter1_fsm_state0;
            end else begin
                ap_NS_iter1_fsm = ap_ST_iter1_fsm_state2;
            end
        end
        ap_ST_iter1_fsm_state0 : begin
            if ((~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1))) begin
                ap_NS_iter1_fsm = ap_ST_iter1_fsm_state2;
            end else begin
                ap_NS_iter1_fsm = ap_ST_iter1_fsm_state0;
            end
        end
        default : begin
            ap_NS_iter1_fsm = 'bx;
        end
    endcase
end

always @ (*) begin
    case (ap_CS_iter2_fsm)
        ap_ST_iter2_fsm_state3 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))) & ~((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))) & (1'b1 == ap_CS_iter1_fsm_state2))) begin
                ap_NS_iter2_fsm = ap_ST_iter2_fsm_state3;
            end else if ((~((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))) & ((1'b0 == ap_CS_iter1_fsm_state2) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))))) begin
                ap_NS_iter2_fsm = ap_ST_iter2_fsm_state0;
            end else begin
                ap_NS_iter2_fsm = ap_ST_iter2_fsm_state3;
            end
        end
        ap_ST_iter2_fsm_state0 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1))))) & (1'b1 == ap_CS_iter1_fsm_state2))) begin
                ap_NS_iter2_fsm = ap_ST_iter2_fsm_state3;
            end else begin
                ap_NS_iter2_fsm = ap_ST_iter2_fsm_state0;
            end
        end
        default : begin
            ap_NS_iter2_fsm = 'bx;
        end
    endcase
end

assign add_ln229_fu_200_p2 = (p_cnt_V + 16'd1);

assign ap_CS_iter0_fsm_state1 = ap_CS_iter0_fsm[32'd0];

assign ap_CS_iter1_fsm_state2 = ap_CS_iter1_fsm[32'd1];

assign ap_CS_iter2_fsm_state3 = ap_CS_iter2_fsm[32'd1];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2_io = ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_condition_328 = (~(((ap_predicate_op45_read_state1 == 1'b1) & (is_r_TVALID_int_regslice == 1'b0)) | ((1'b1 == ap_CS_iter2_fsm_state3) & ((1'b1 == ap_block_state3_io) | (regslice_both_os_V_data_V_U_apdone_blk == 1'b1) | ((os_TREADY_int_regslice == 1'b0) & (ap_predicate_op56_write_state3 == 1'b1)))) | ((1'b1 == ap_CS_iter1_fsm_state2) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op55_write_state2 == 1'b1) & (os_TREADY_int_regslice == 1'b0))))) & (1'b1 == ap_CS_iter0_fsm_state1));
end

assign ap_local_block = 1'b0;

assign ap_local_deadlock = 1'd0;

always @ (*) begin
    ap_predicate_op45_read_state1 = ((tmp_nbreadreq_fu_94_p6 == 1'd1) & (p_start_V == 1'd1));
end

always @ (*) begin
    ap_predicate_op55_write_state2 = ((tmp_reg_237 == 1'd1) & (p_start_V_load_reg_230 == 1'd1));
end

always @ (*) begin
    ap_predicate_op56_write_state3 = ((tmp_reg_237_pp0_iter1_reg == 1'd1) & (p_start_V_load_reg_230_pp0_iter1_reg == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign in_last_V_fu_212_p2 = ((add_ln229_fu_200_p2 == p_size_V) ? 1'b1 : 1'b0);

assign is_r_TREADY = regslice_both_is_r_V_data_V_U_ack_in;

assign or_ln30_fu_158_p2 = (xor_ln30_fu_152_p2 | p_en_V);

assign os_TVALID = regslice_both_os_V_data_V_U_vld_out;

assign p_start_V_load_load_fu_136_p1 = p_start_V;

assign tmp_nbreadreq_fu_94_p6 = is_r_TVALID_int_regslice;

assign xor_ln30_fu_152_p2 = (en ^ 1'd1);

assign xor_ln946_fu_218_p2 = (in_last_V_fu_212_p2 ^ 1'd1);

endmodule //dma_grabber_dma_grabber