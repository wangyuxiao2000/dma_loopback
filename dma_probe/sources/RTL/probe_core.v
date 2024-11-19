 /*************************************************************/
 //function: DMA数据抓取器内核
 //Author  : WangYuxiao
 //Email   : wyxee2000@163.com
 //Data    : 2024.11.19
 //Version : V 1.0
 /*************************************************************/
`timescale 1 ns / 1 ps

module probe_core (clk,rst_n,en,sel,size,data_num,s0_axis_tdata,s0_axis_tvalid,s0_axis_tlast,s0_axis_tkeep,s0_axis_tstrb,s0_axis_tready,s1_axis_tdata,s1_axis_tvalid,s1_axis_tlast,s1_axis_tkeep,s1_axis_tstrb,s1_axis_tready,s2_axis_tdata,s2_axis_tvalid,s2_axis_tlast,s2_axis_tkeep,s2_axis_tstrb,s2_axis_tready,s3_axis_tdata,s3_axis_tvalid,s3_axis_tlast,s3_axis_tkeep,s3_axis_tstrb,s3_axis_tready,s4_axis_tdata,s4_axis_tvalid,s4_axis_tlast,s4_axis_tkeep,s4_axis_tstrb,s4_axis_tready,s5_axis_tdata,s5_axis_tvalid,s5_axis_tlast,s5_axis_tkeep,s5_axis_tstrb,s5_axis_tready,s6_axis_tdata,s6_axis_tvalid,s6_axis_tlast,s6_axis_tkeep,s6_axis_tstrb,s6_axis_tready,s7_axis_tdata,s7_axis_tvalid,s7_axis_tlast,s7_axis_tkeep,s7_axis_tstrb,s7_axis_tready,probe_axis_tdata,probe_axis_tvalid,probe_axis_tlast,probe_axis_tkeep,probe_axis_tstrb,probe_axis_tready,m0_axis_tdata,m0_axis_tvalid,m0_axis_tlast,m0_axis_tkeep,m0_axis_tstrb,m0_axis_tready,m1_axis_tdata,m1_axis_tvalid,m1_axis_tlast,m1_axis_tkeep,m1_axis_tstrb,m1_axis_tready,m2_axis_tdata,m2_axis_tvalid,m2_axis_tlast,m2_axis_tkeep,m2_axis_tstrb,m2_axis_tready,m3_axis_tdata,m3_axis_tvalid,m3_axis_tlast,m3_axis_tkeep,m3_axis_tstrb,m3_axis_tready,m4_axis_tdata,m4_axis_tvalid,m4_axis_tlast,m4_axis_tkeep,m4_axis_tstrb,m4_axis_tready,m5_axis_tdata,m5_axis_tvalid,m5_axis_tlast,m5_axis_tkeep,m5_axis_tstrb,m5_axis_tready,m6_axis_tdata,m6_axis_tvalid,m6_axis_tlast,m6_axis_tkeep,m6_axis_tstrb,m6_axis_tready,m7_axis_tdata,m7_axis_tvalid,m7_axis_tlast,m7_axis_tkeep,m7_axis_tstrb,m7_axis_tready);
/******************************************工作参数设置******************************************/
parameter width=32;
parameter num=8;
parameter timeout=1000;
/************************************************************************************************/
input clk;   /*系统时钟*/
input rst_n; /*低电平异步复位信号*/

input en;                   /*en上升沿触发一次抓取*/
input [2:0] sel;            /*目标抓取通道*/
input [16:0] size;          /*目标抓取数据量*/
output reg [16:0] data_num; /*实际抓取数据量*/

input [width-1:0] s0_axis_tdata;   /*AXIS输入接口0*/
input s0_axis_tvalid;
input s0_axis_tlast;
input [width/8-1:0] s0_axis_tkeep;
input [width/8-1:0] s0_axis_tstrb;
output reg s0_axis_tready;

input [width-1:0] s1_axis_tdata;   /*AXIS输入接口1*/
input s1_axis_tvalid;
input s1_axis_tlast;
input [width/8-1:0] s1_axis_tkeep;
input [width/8-1:0] s1_axis_tstrb;
output reg s1_axis_tready;

input [width-1:0] s2_axis_tdata;   /*AXIS输入接口2*/
input s2_axis_tvalid;
input s2_axis_tlast;
input [width/8-1:0] s2_axis_tkeep;
input [width/8-1:0] s2_axis_tstrb;
output reg s2_axis_tready;

input [width-1:0] s3_axis_tdata;   /*AXIS输入接口3*/
input s3_axis_tvalid;
input s3_axis_tlast;
input [width/8-1:0] s3_axis_tkeep;
input [width/8-1:0] s3_axis_tstrb;
output reg s3_axis_tready;

input [width-1:0] s4_axis_tdata;   /*AXIS输入接口4*/
input s4_axis_tvalid;
input s4_axis_tlast;
input [width/8-1:0] s4_axis_tkeep;
input [width/8-1:0] s4_axis_tstrb;
output reg s4_axis_tready;

input [width-1:0] s5_axis_tdata;   /*AXIS输入接口5*/
input s5_axis_tvalid;
input s5_axis_tlast;
input [width/8-1:0] s5_axis_tkeep;
input [width/8-1:0] s5_axis_tstrb;
output reg s5_axis_tready;

input [width-1:0] s6_axis_tdata;   /*AXIS输入接口6*/
input s6_axis_tvalid;
input s6_axis_tlast;
input [width/8-1:0] s6_axis_tkeep;
input [width/8-1:0] s6_axis_tstrb;
output reg s6_axis_tready;

input [width-1:0] s7_axis_tdata;   /*AXIS输入接口7*/
input s7_axis_tvalid;
input s7_axis_tlast;
input [width/8-1:0] s7_axis_tkeep;
input [width/8-1:0] s7_axis_tstrb;
output reg s7_axis_tready;

output reg [width-1:0] probe_axis_tdata;  /*数据抓取输出接口*/
output reg probe_axis_tvalid;
output reg probe_axis_tlast;
output reg [width/8-1:0] probe_axis_tkeep;
output reg [width/8-1:0] probe_axis_tstrb;
input probe_axis_tready;

output reg [width-1:0] m0_axis_tdata;     /*AXIS输出接口0*/
output reg m0_axis_tvalid;
output reg m0_axis_tlast;
output reg [width/8-1:0] m0_axis_tkeep;
output reg [width/8-1:0] m0_axis_tstrb;
input m0_axis_tready;

output reg [width-1:0] m1_axis_tdata;     /*AXIS输出接口1*/
output reg m1_axis_tvalid;
output reg m1_axis_tlast;
output reg [width/8-1:0] m1_axis_tkeep;
output reg [width/8-1:0] m1_axis_tstrb;
input m1_axis_tready;

output reg [width-1:0] m2_axis_tdata;     /*AXIS输出接口2*/
output reg m2_axis_tvalid;
output reg m2_axis_tlast;
output reg [width/8-1:0] m2_axis_tkeep;
output reg [width/8-1:0] m2_axis_tstrb;
input m2_axis_tready;

output reg [width-1:0] m3_axis_tdata;     /*AXIS输出接口3*/
output reg m3_axis_tvalid;
output reg m3_axis_tlast;
output reg [width/8-1:0] m3_axis_tkeep;
output reg [width/8-1:0] m3_axis_tstrb;
input m3_axis_tready;

output reg [width-1:0] m4_axis_tdata;     /*AXIS输出接口4*/
output reg m4_axis_tvalid;
output reg m4_axis_tlast;
output reg [width/8-1:0] m4_axis_tkeep;
output reg [width/8-1:0] m4_axis_tstrb;
input m4_axis_tready;

output reg [width-1:0] m5_axis_tdata;     /*AXIS输出接口5*/
output reg m5_axis_tvalid;
output reg m5_axis_tlast;
output reg [width/8-1:0] m5_axis_tkeep;
output reg [width/8-1:0] m5_axis_tstrb;
input m5_axis_tready;

output reg [width-1:0] m6_axis_tdata;     /*AXIS输出接口6*/
output reg m6_axis_tvalid;
output reg m6_axis_tlast;
output reg [width/8-1:0] m6_axis_tkeep;
output reg [width/8-1:0] m6_axis_tstrb;
input m6_axis_tready;

output reg [width-1:0] m7_axis_tdata;     /*AXIS输出接口7*/
output reg m7_axis_tvalid;
output reg m7_axis_tlast;
output reg [width/8-1:0] m7_axis_tkeep;
output reg [width/8-1:0] m7_axis_tstrb;
input m7_axis_tready;



/**************************************************数据直通**************************************************/
always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    begin
      s0_axis_tready<=0;
      m0_axis_tdata<=0;
      m0_axis_tvalid<=0;
      m0_axis_tlast<=0;
      m0_axis_tkeep<=0;
      m0_axis_tstrb<=0;
      s1_axis_tready<=0;
      m1_axis_tdata<=0;
      m1_axis_tvalid<=0;
      m1_axis_tlast<=0;
      m1_axis_tkeep<=0;
      m1_axis_tstrb<=0;
      s2_axis_tready<=0;
      m2_axis_tdata<=0;
      m2_axis_tvalid<=0;
      m2_axis_tlast<=0;
      m2_axis_tkeep<=0;
      m2_axis_tstrb<=0;
      s3_axis_tready<=0;
      m3_axis_tdata<=0;
      m3_axis_tvalid<=0;
      m3_axis_tlast<=0;
      m3_axis_tkeep<=0;
      m3_axis_tstrb<=0;
      s4_axis_tready<=0;
      m4_axis_tdata<=0;
      m4_axis_tvalid<=0;
      m4_axis_tlast<=0;
      m4_axis_tkeep<=0;
      m4_axis_tstrb<=0;
      s5_axis_tready<=0;
      m5_axis_tdata<=0;
      m5_axis_tvalid<=0;
      m5_axis_tlast<=0;
      m5_axis_tkeep<=0;
      m5_axis_tstrb<=0;
      s6_axis_tready<=0;
      m6_axis_tdata<=0;
      m6_axis_tvalid<=0;
      m6_axis_tlast<=0;
      m6_axis_tkeep<=0;
      m6_axis_tstrb<=0;
      s7_axis_tready<=0;
      m7_axis_tdata<=0;
      m7_axis_tvalid<=0;
      m7_axis_tlast<=0;
      m7_axis_tkeep<=0;
      m7_axis_tstrb<=0;
    end
  else
    begin
      s0_axis_tready<=m0_axis_tready;
      m0_axis_tdata<=s0_axis_tdata;
      m0_axis_tvalid<=s0_axis_tvalid;
      m0_axis_tlast<=s0_axis_tlast;
      m0_axis_tkeep<=s0_axis_tkeep;
      m0_axis_tstrb<=s0_axis_tstrb;
      s1_axis_tready<=m1_axis_tready;
      m1_axis_tdata<=s1_axis_tdata;
      m1_axis_tvalid<=s1_axis_tvalid;
      m1_axis_tlast<=s1_axis_tlast;
      m1_axis_tkeep<=s1_axis_tkeep;
      m1_axis_tstrb<=s1_axis_tstrb;
      s2_axis_tready<=m2_axis_tready;
      m2_axis_tdata<=s2_axis_tdata;
      m2_axis_tvalid<=s2_axis_tvalid;
      m2_axis_tlast<=s2_axis_tlast;
      m2_axis_tkeep<=s2_axis_tkeep;
      m2_axis_tstrb<=s2_axis_tstrb;
      s3_axis_tready<=m3_axis_tready;
      m3_axis_tdata<=s3_axis_tdata;
      m3_axis_tvalid<=s3_axis_tvalid;
      m3_axis_tlast<=s3_axis_tlast;
      m3_axis_tkeep<=s3_axis_tkeep;
      m3_axis_tstrb<=s3_axis_tstrb;
      s4_axis_tready<=m4_axis_tready;
      m4_axis_tdata<=s4_axis_tdata;
      m4_axis_tvalid<=s4_axis_tvalid;
      m4_axis_tlast<=s4_axis_tlast;
      m4_axis_tkeep<=s4_axis_tkeep;
      m4_axis_tstrb<=s4_axis_tstrb;
      s5_axis_tready<=m5_axis_tready;
      m5_axis_tdata<=s5_axis_tdata;
      m5_axis_tvalid<=s5_axis_tvalid;
      m5_axis_tlast<=s5_axis_tlast;
      m5_axis_tkeep<=s5_axis_tkeep;
      m5_axis_tstrb<=s5_axis_tstrb;
      s6_axis_tready<=m6_axis_tready;
      m6_axis_tdata<=s6_axis_tdata;
      m6_axis_tvalid<=s6_axis_tvalid;
      m6_axis_tlast<=s6_axis_tlast;
      m6_axis_tkeep<=s6_axis_tkeep;
      m6_axis_tstrb<=s6_axis_tstrb;
      s7_axis_tready<=m7_axis_tready;
      m7_axis_tdata<=s7_axis_tdata;
      m7_axis_tvalid<=s7_axis_tvalid;
      m7_axis_tlast<=s7_axis_tlast;
      m7_axis_tkeep<=s7_axis_tkeep;
      m7_axis_tstrb<=s7_axis_tstrb;
    end
end

/***********************************************************************************************************/



/**************************************************数据抓取**************************************************/
reg en_reg;
always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    en_reg<=0;
  else
    en_reg<=en;
end

reg [width-1:0] target_tdata;
reg target_tvalid;
reg target_tlast;
reg [width/8-1:0] target_tkeep;
reg [width/8-1:0] target_tstrb;
reg target_tready;
always@(*)
begin
  if(!rst_n)
    begin
      target_tdata=0;
      target_tvalid=0;
      target_tlast=0;
      target_tkeep=0;
      target_tstrb=0;
      target_tready=0;
    end
  else
    begin
      case(sel)
        3'd0 : begin
                 target_tdata=s0_axis_tdata;
                 target_tvalid=s0_axis_tvalid;
                 target_tlast=s0_axis_tlast;
                 target_tkeep=s0_axis_tkeep;
                 target_tstrb=s0_axis_tstrb;
                 target_tready=s0_axis_tready;
               end

        3'd1 : begin
                 target_tdata=s1_axis_tdata;
                 target_tvalid=s1_axis_tvalid;
                 target_tlast=s1_axis_tlast;
                 target_tkeep=s1_axis_tkeep;
                 target_tstrb=s1_axis_tstrb;
                 target_tready=s1_axis_tready;
               end

        3'd2 : begin
                 target_tdata=s2_axis_tdata;
                 target_tvalid=s2_axis_tvalid;
                 target_tlast=s2_axis_tlast;
                 target_tkeep=s2_axis_tkeep;
                 target_tstrb=s2_axis_tstrb;
                 target_tready=s2_axis_tready;
               end

        3'd3 : begin
                 target_tdata=s3_axis_tdata;
                 target_tvalid=s3_axis_tvalid;
                 target_tlast=s3_axis_tlast;
                 target_tkeep=s3_axis_tkeep;
                 target_tstrb=s3_axis_tstrb;
                 target_tready=s3_axis_tready;
               end

        3'd4 : begin
                 target_tdata=s4_axis_tdata;
                 target_tvalid=s4_axis_tvalid;
                 target_tlast=s4_axis_tlast;
                 target_tkeep=s4_axis_tkeep;
                 target_tstrb=s4_axis_tstrb;
                 target_tready=s4_axis_tready;
               end

        3'd5 : begin
                 target_tdata=s5_axis_tdata;
                 target_tvalid=s5_axis_tvalid;
                 target_tlast=s5_axis_tlast;
                 target_tkeep=s5_axis_tkeep;
                 target_tstrb=s5_axis_tstrb;
                 target_tready=s5_axis_tready;
               end

        3'd6 : begin
                 target_tdata=s6_axis_tdata;
                 target_tvalid=s6_axis_tvalid;
                 target_tlast=s6_axis_tlast;
                 target_tkeep=s6_axis_tkeep;
                 target_tstrb=s6_axis_tstrb;
                 target_tready=s6_axis_tready;
               end

        3'd7 : begin
                 target_tdata=s7_axis_tdata;
                 target_tvalid=s7_axis_tvalid;
                 target_tlast=s7_axis_tlast;
                 target_tkeep=s7_axis_tkeep;
                 target_tstrb=s7_axis_tstrb;
                 target_tready=s7_axis_tready;
               end
      endcase
    end
end

reg [15:0] wait_time;
reg [16:0] data_cnt;
reg [2:0] state;
localparam STATE_init=3'b001;     /*等待en信号上升沿,启动数据抓取*/
localparam STATE_transfer=3'b010; /*抓取数据*/
localparam STATE_done=3'b100;     /*数据抓取结束*/
always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    begin
      state<=STATE_init;
      wait_time<=0;
      data_num<=0;
      data_cnt<=0;
      probe_axis_tdata<=0;
      probe_axis_tvalid<=0;
      probe_axis_tlast<=0;
      probe_axis_tkeep<=0;
      probe_axis_tstrb<=0;
    end
  else
    begin
      case(state)
        STATE_init : begin
                       if(!en_reg&&en)
                         begin
                           state<=STATE_transfer;
                           wait_time<=0;
                           data_num<=0;
                           data_cnt<=0;
                           probe_axis_tdata<=0;
                           probe_axis_tvalid<=0;
                           probe_axis_tlast<=0;
                           probe_axis_tkeep<=0;
                           probe_axis_tstrb<=0;
                         end
                       else
                         begin
                           state<=STATE_init;
                           wait_time<=0;
                           data_num<=data_num;
                           data_cnt<=0;
                           probe_axis_tdata<=0;
                           probe_axis_tvalid<=0;
                           probe_axis_tlast<=0;
                           probe_axis_tkeep<=0;
                           probe_axis_tstrb<=0;
                         end
                     end

        STATE_transfer : begin
                           if(probe_axis_tready&&target_tready)
                             begin
                               if(probe_axis_tvalid) /*后级模块取走有效数据*/
                                 data_num<=data_num+1;
                               else
                                 data_num<=data_num;

                               if(target_tvalid) /*输出有效数据*/
                                 begin
                                   wait_time<=0;
                                   data_cnt<=data_cnt+1;
                                   probe_axis_tdata<=target_tdata;
                                   probe_axis_tvalid<=target_tvalid;
                                   probe_axis_tkeep<=target_tkeep;
                                   probe_axis_tstrb<=target_tstrb;
                                   if(data_cnt==size-1) /*对最后一个数据添加tlast信号*/
                                     begin
                                       state<=STATE_done;
                                       probe_axis_tlast<=1;
                                     end
                                   else
                                     begin
                                       state<=state;
                                       probe_axis_tlast<=0;
                                     end
                                 end
                               else /*超时等待,防止因前级数据不足导致PS端DMA驱动卡死*/
                                 begin
                                   if(wait_time==timeout)
                                     begin
                                       state<=STATE_done;
                                       wait_time<=wait_time;
                                       data_cnt<=data_cnt;
                                       probe_axis_tdata<=0;
                                       probe_axis_tvalid<=1;
                                       probe_axis_tlast<=1;
                                       probe_axis_tkeep<=(1<<(width/8))-1;
                                       probe_axis_tstrb<=(1<<(width/8))-1;
                                     end
                                   else
                                     begin
                                       state<=state;
                                       wait_time<=wait_time+1;
                                       data_cnt<=data_cnt;
                                       probe_axis_tdata<=0;
                                       probe_axis_tvalid<=0;
                                       probe_axis_tlast<=0;
                                       probe_axis_tkeep<=0;
                                       probe_axis_tstrb<=0;
                                     end
                                 end
                             end
                           else
                             begin
                               state<=state;
                               wait_time<=wait_time;
                               data_num<=data_num;
                               data_cnt<=data_cnt;
                               probe_axis_tdata<=probe_axis_tdata;
                               probe_axis_tvalid<=probe_axis_tvalid;
                               probe_axis_tlast<=probe_axis_tlast;
                               probe_axis_tkeep<=probe_axis_tkeep;
                               probe_axis_tstrb<=probe_axis_tstrb;
                             end
                         end

        STATE_done : begin
                       if(probe_axis_tready)
                         begin
                           state<=STATE_init;
                           wait_time<=0;
                           data_cnt<=0;
                           probe_axis_tdata<=0;
                           probe_axis_tvalid<=0;
                           probe_axis_tlast<=0;
                           probe_axis_tkeep<=0;
                           probe_axis_tstrb<=0;
                           if(wait_time==0) /*最后一个数据是有效数据*/
                             data_num<=data_num+1;
                           else /*最后一个数据是超时填充数据*/
                             data_num<=data_num;
                         end
                       else
                         begin
                           state<=state;
                           wait_time<=wait_time;
                           data_num<=data_num;
                           data_cnt<=data_cnt;
                           probe_axis_tdata<=probe_axis_tdata;
                           probe_axis_tvalid<=probe_axis_tvalid;
                           probe_axis_tlast<=probe_axis_tlast;
                           probe_axis_tkeep<=probe_axis_tkeep;
                           probe_axis_tstrb<=probe_axis_tstrb;
                         end
                     end

        default : begin
                    state<=STATE_init;
                    wait_time<=0;
                    data_num<=0;
                    data_cnt<=0;
                    probe_axis_tdata<=0;
                    probe_axis_tvalid<=0;
                    probe_axis_tlast<=0;
                    probe_axis_tkeep<=0;
                    probe_axis_tstrb<=0;
                  end
      endcase
    end
end
/***********************************************************************************************************/

endmodule