/*************************************************************/
//function: DMA数据抓取器
//Author  : WangYuxiao
//Email   : wyxee2000@163.com
//Data    : 2024.11.19
//Version : V 1.0
/*************************************************************/
`timescale 1 ns / 1 ps

module dma_probe (ap_clk,ap_rst_n,s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_AWADDR,s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_WDATA,s_axi_control_WSTRB,s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_ARADDR,s_axi_control_RVALID,s_axi_control_RREADY,s_axi_control_RDATA,s_axi_control_RRESP,s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_BRESP,data_num,s0_axis_tdata,s0_axis_tvalid,s0_axis_tlast,s0_axis_tkeep,s0_axis_tready,s1_axis_tdata,s1_axis_tvalid,s1_axis_tlast,s1_axis_tkeep,s1_axis_tready,s2_axis_tdata,s2_axis_tvalid,s2_axis_tlast,s2_axis_tkeep,s2_axis_tready,s3_axis_tdata,s3_axis_tvalid,s3_axis_tlast,s3_axis_tkeep,s3_axis_tready,s4_axis_tdata,s4_axis_tvalid,s4_axis_tlast,s4_axis_tkeep,s4_axis_tready,s5_axis_tdata,s5_axis_tvalid,s5_axis_tlast,s5_axis_tkeep,s5_axis_tready,s6_axis_tdata,s6_axis_tvalid,s6_axis_tlast,s6_axis_tkeep,s6_axis_tready,s7_axis_tdata,s7_axis_tvalid,s7_axis_tlast,s7_axis_tkeep,s7_axis_tready,probe_axis_tdata,probe_axis_tvalid,probe_axis_tlast,probe_axis_tkeep,probe_axis_tready,m0_axis_tdata,m0_axis_tvalid,m0_axis_tlast,m0_axis_tkeep,m0_axis_tready,m1_axis_tdata,m1_axis_tvalid,m1_axis_tlast,m1_axis_tkeep,m1_axis_tready,m2_axis_tdata,m2_axis_tvalid,m2_axis_tlast,m2_axis_tkeep,m2_axis_tready,m3_axis_tdata,m3_axis_tvalid,m3_axis_tlast,m3_axis_tkeep,m3_axis_tready,m4_axis_tdata,m4_axis_tvalid,m4_axis_tlast,m4_axis_tkeep,m4_axis_tready,m5_axis_tdata,m5_axis_tvalid,m5_axis_tlast,m5_axis_tkeep,m5_axis_tready,m6_axis_tdata,m6_axis_tvalid,m6_axis_tlast,m6_axis_tkeep,m6_axis_tready,m7_axis_tdata,m7_axis_tvalid,m7_axis_tlast,m7_axis_tkeep,m7_axis_tready);
/******************************************工作参数设置******************************************/
parameter width=32;
parameter num=8;
parameter timeout=1000;

localparam C_S_AXI_CONTROL_ADDR_WIDTH=6;
localparam C_S_AXI_CONTROL_DATA_WIDTH=32;
localparam C_S_AXI_CONTROL_WSTRB_WIDTH=(32/8);
/************************************************************************************************/
input ap_clk;
input ap_rst_n;
input s_axi_control_AWVALID;
output s_axi_control_AWREADY;
input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_AWADDR;
input s_axi_control_WVALID;
output s_axi_control_WREADY;
input [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_WDATA;
input [C_S_AXI_CONTROL_WSTRB_WIDTH-1:0] s_axi_control_WSTRB;
input s_axi_control_ARVALID;
output s_axi_control_ARREADY;
input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_ARADDR;
output s_axi_control_RVALID;
input s_axi_control_RREADY;
output [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_RDATA;
output [1:0] s_axi_control_RRESP;
output s_axi_control_BVALID;
input s_axi_control_BREADY;
output [1:0] s_axi_control_BRESP;

output [16:0] data_num;            /*实际抓取数据量*/

input [width-1:0] s0_axis_tdata;   /*AXIS输入接口0*/
input s0_axis_tvalid;
input s0_axis_tlast;
input [width/8-1:0] s0_axis_tkeep;
output s0_axis_tready;

input [width-1:0] s1_axis_tdata;   /*AXIS输入接口1*/
input s1_axis_tvalid;
input s1_axis_tlast;
input [width/8-1:0] s1_axis_tkeep;
output s1_axis_tready;

input [width-1:0] s2_axis_tdata;   /*AXIS输入接口2*/
input s2_axis_tvalid;
input s2_axis_tlast;
input [width/8-1:0] s2_axis_tkeep;
output s2_axis_tready;

input [width-1:0] s3_axis_tdata;   /*AXIS输入接口3*/
input s3_axis_tvalid;
input s3_axis_tlast;
input [width/8-1:0] s3_axis_tkeep;
output s3_axis_tready;

input [width-1:0] s4_axis_tdata;   /*AXIS输入接口4*/
input s4_axis_tvalid;
input s4_axis_tlast;
input [width/8-1:0] s4_axis_tkeep;
output s4_axis_tready;

input [width-1:0] s5_axis_tdata;   /*AXIS输入接口5*/
input s5_axis_tvalid;
input s5_axis_tlast;
input [width/8-1:0] s5_axis_tkeep;
output s5_axis_tready;

input [width-1:0] s6_axis_tdata;   /*AXIS输入接口6*/
input s6_axis_tvalid;
input s6_axis_tlast;
input [width/8-1:0] s6_axis_tkeep;
output s6_axis_tready;

input [width-1:0] s7_axis_tdata;   /*AXIS输入接口7*/
input s7_axis_tvalid;
input s7_axis_tlast;
input [width/8-1:0] s7_axis_tkeep;
output s7_axis_tready;

output [width-1:0] probe_axis_tdata;  /*数据抓取输出接口*/
output probe_axis_tvalid;
output probe_axis_tlast;
output [width/8-1:0] probe_axis_tkeep;
input probe_axis_tready;

output [width-1:0] m0_axis_tdata;     /*AXIS输出接口0*/
output m0_axis_tvalid;
output m0_axis_tlast;
output [width/8-1:0] m0_axis_tkeep;
input m0_axis_tready;

output [width-1:0] m1_axis_tdata;     /*AXIS输出接口1*/
output m1_axis_tvalid;
output m1_axis_tlast;
output [width/8-1:0] m1_axis_tkeep;
input m1_axis_tready;

output [width-1:0] m2_axis_tdata;     /*AXIS输出接口2*/
output m2_axis_tvalid;
output m2_axis_tlast;
output [width/8-1:0] m2_axis_tkeep;
input m2_axis_tready;

output [width-1:0] m3_axis_tdata;     /*AXIS输出接口3*/
output m3_axis_tvalid;
output m3_axis_tlast;
output [width/8-1:0] m3_axis_tkeep;
input m3_axis_tready;

output [width-1:0] m4_axis_tdata;     /*AXIS输出接口4*/
output m4_axis_tvalid;
output m4_axis_tlast;
output [width/8-1:0] m4_axis_tkeep;
input m4_axis_tready;

output [width-1:0] m5_axis_tdata;     /*AXIS输出接口5*/
output m5_axis_tvalid;
output m5_axis_tlast;
output [width/8-1:0] m5_axis_tkeep;
input m5_axis_tready;

output [width-1:0] m6_axis_tdata;     /*AXIS输出接口6*/
output m6_axis_tvalid;
output m6_axis_tlast;
output [width/8-1:0] m6_axis_tkeep;
input m6_axis_tready;

output [width-1:0] m7_axis_tdata;     /*AXIS输出接口7*/
output m7_axis_tvalid;
output m7_axis_tlast;
output [width/8-1:0] m7_axis_tkeep;
input m7_axis_tready;



/****************************************************例化***************************************************/
wire en;
wire [2:0] sel;
wire [16:0] size;
ctrl_s_axi #(
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH(C_S_AXI_CONTROL_DATA_WIDTH))
U_ctrl_s_axi(
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
    .ARESET(!ap_rst_n),
    .ACLK_EN(1'b1),
    .en(en),
    .sel(sel),
    .size(size)
);

probe_core #(
    .width(width),
    .num(num),
    .timeout(timeout))
U_core(
    .clk(ap_clk),
    .rst_n(ap_rst_n),
    .en(en),
    .sel(sel),
    .size(size),
    .data_num(data_num),
    .s0_axis_tdata(s0_axis_tdata),
    .s0_axis_tvalid(s0_axis_tvalid),
    .s0_axis_tlast(s0_axis_tlast),
    .s0_axis_tkeep(s0_axis_tkeep),
    .s0_axis_tstrb(0),
    .s0_axis_tready(s0_axis_tready),
    .s1_axis_tdata(s1_axis_tdata),
    .s1_axis_tvalid(s1_axis_tvalid),
    .s1_axis_tlast(s1_axis_tlast),
    .s1_axis_tkeep(s1_axis_tkeep),
    .s1_axis_tstrb(0),
    .s1_axis_tready(s1_axis_tready),
    .s2_axis_tdata(s2_axis_tdata),
    .s2_axis_tvalid(s2_axis_tvalid),
    .s2_axis_tlast(s2_axis_tlast),
    .s2_axis_tkeep(s2_axis_tkeep),
    .s2_axis_tstrb(0),
    .s2_axis_tready(s2_axis_tready),
    .s3_axis_tdata(s3_axis_tdata),
    .s3_axis_tvalid(s3_axis_tvalid),
    .s3_axis_tlast(s3_axis_tlast),
    .s3_axis_tkeep(s3_axis_tkeep),
    .s3_axis_tstrb(0),
    .s3_axis_tready(s3_axis_tready),
    .s4_axis_tdata(s4_axis_tdata),
    .s4_axis_tvalid(s4_axis_tvalid),
    .s4_axis_tlast(s4_axis_tlast),
    .s4_axis_tkeep(s4_axis_tkeep),
    .s4_axis_tstrb(0),
    .s4_axis_tready(s4_axis_tready),
    .s5_axis_tdata(s5_axis_tdata),
    .s5_axis_tvalid(s5_axis_tvalid),
    .s5_axis_tlast(s5_axis_tlast),
    .s5_axis_tkeep(s5_axis_tkeep),
    .s5_axis_tstrb(0),
    .s5_axis_tready(s5_axis_tready),
    .s6_axis_tdata(s6_axis_tdata),
    .s6_axis_tvalid(s6_axis_tvalid),
    .s6_axis_tlast(s6_axis_tlast),
    .s6_axis_tkeep(s6_axis_tkeep),
    .s6_axis_tstrb(0),
    .s6_axis_tready(s6_axis_tready),
    .s7_axis_tdata(s7_axis_tdata),
    .s7_axis_tvalid(s7_axis_tvalid),
    .s7_axis_tlast(s7_axis_tlast),
    .s7_axis_tkeep(s7_axis_tkeep),
    .s7_axis_tstrb(0),
    .s7_axis_tready(s7_axis_tready),
    .probe_axis_tdata(probe_axis_tdata),
    .probe_axis_tvalid(probe_axis_tvalid),
    .probe_axis_tlast(probe_axis_tlast),
    .probe_axis_tkeep(probe_axis_tkeep),
    .probe_axis_tstrb(),
    .probe_axis_tready(probe_axis_tready),
    .m0_axis_tdata(m0_axis_tdata),
    .m0_axis_tvalid(m0_axis_tvalid),
    .m0_axis_tlast(m0_axis_tlast),
    .m0_axis_tkeep(m0_axis_tkeep),
    .m0_axis_tstrb(),
    .m0_axis_tready(m0_axis_tready),
    .m1_axis_tdata(m1_axis_tdata),
    .m1_axis_tvalid(m1_axis_tvalid),
    .m1_axis_tlast(m1_axis_tlast),
    .m1_axis_tkeep(m1_axis_tkeep),
    .m1_axis_tstrb(),
    .m1_axis_tready(m1_axis_tready),
    .m2_axis_tdata(m2_axis_tdata),
    .m2_axis_tvalid(m2_axis_tvalid),
    .m2_axis_tlast(m2_axis_tlast),
    .m2_axis_tkeep(m2_axis_tkeep),
    .m2_axis_tstrb(),
    .m2_axis_tready(m2_axis_tready),
    .m3_axis_tdata(m3_axis_tdata),
    .m3_axis_tvalid(m3_axis_tvalid),
    .m3_axis_tlast(m3_axis_tlast),
    .m3_axis_tkeep(m3_axis_tkeep),
    .m3_axis_tstrb(),
    .m3_axis_tready(m3_axis_tready),
    .m4_axis_tdata(m4_axis_tdata),
    .m4_axis_tvalid(m4_axis_tvalid),
    .m4_axis_tlast(m4_axis_tlast),
    .m4_axis_tkeep(m4_axis_tkeep),
    .m4_axis_tstrb(),
    .m4_axis_tready(m4_axis_tready),
    .m5_axis_tdata(m5_axis_tdata),
    .m5_axis_tvalid(m5_axis_tvalid),
    .m5_axis_tlast(m5_axis_tlast),
    .m5_axis_tkeep(m5_axis_tkeep),
    .m5_axis_tstrb(),
    .m5_axis_tready(m5_axis_tready),
    .m6_axis_tdata(m6_axis_tdata),
    .m6_axis_tvalid(m6_axis_tvalid),
    .m6_axis_tlast(m6_axis_tlast),
    .m6_axis_tkeep(m6_axis_tkeep),
    .m6_axis_tstrb(),
    .m6_axis_tready(m6_axis_tready),
    .m7_axis_tdata(m7_axis_tdata),
    .m7_axis_tvalid(m7_axis_tvalid),
    .m7_axis_tlast(m7_axis_tlast),
    .m7_axis_tkeep(m7_axis_tkeep),
    .m7_axis_tstrb(),
    .m7_axis_tready(m7_axis_tready)
);
/***********************************************************************************************************/

endmodule