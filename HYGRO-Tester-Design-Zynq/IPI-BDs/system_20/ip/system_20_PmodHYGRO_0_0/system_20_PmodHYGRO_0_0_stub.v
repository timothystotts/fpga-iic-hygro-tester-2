// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Sep 10 13:38:04 2020
// Host        : l4study running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/timothystotts/Workareas/GitHub/timothystotts/fpga-iic-hygro-tester-2/HYGRO-Tester-Design-Zynq/IPI-BDs/system_20/ip/system_20_PmodHYGRO_0_0/system_20_PmodHYGRO_0_0_stub.v
// Design      : system_20_PmodHYGRO_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "PmodHYGRO,Vivado 2019.1" *)
module system_20_PmodHYGRO_0_0(AXI_LITE_IIC_araddr, AXI_LITE_IIC_arready, 
  AXI_LITE_IIC_arvalid, AXI_LITE_IIC_awaddr, AXI_LITE_IIC_awready, AXI_LITE_IIC_awvalid, 
  AXI_LITE_IIC_bready, AXI_LITE_IIC_bresp, AXI_LITE_IIC_bvalid, AXI_LITE_IIC_rdata, 
  AXI_LITE_IIC_rready, AXI_LITE_IIC_rresp, AXI_LITE_IIC_rvalid, AXI_LITE_IIC_wdata, 
  AXI_LITE_IIC_wready, AXI_LITE_IIC_wstrb, AXI_LITE_IIC_wvalid, AXI_LITE_TMR_araddr, 
  AXI_LITE_TMR_arready, AXI_LITE_TMR_arvalid, AXI_LITE_TMR_awaddr, AXI_LITE_TMR_awready, 
  AXI_LITE_TMR_awvalid, AXI_LITE_TMR_bready, AXI_LITE_TMR_bresp, AXI_LITE_TMR_bvalid, 
  AXI_LITE_TMR_rdata, AXI_LITE_TMR_rready, AXI_LITE_TMR_rresp, AXI_LITE_TMR_rvalid, 
  AXI_LITE_TMR_wdata, AXI_LITE_TMR_wready, AXI_LITE_TMR_wstrb, AXI_LITE_TMR_wvalid, 
  I2C_Interrupt, Pmod_out_pin10_i, Pmod_out_pin10_o, Pmod_out_pin10_t, Pmod_out_pin1_i, 
  Pmod_out_pin1_o, Pmod_out_pin1_t, Pmod_out_pin2_i, Pmod_out_pin2_o, Pmod_out_pin2_t, 
  Pmod_out_pin3_i, Pmod_out_pin3_o, Pmod_out_pin3_t, Pmod_out_pin4_i, Pmod_out_pin4_o, 
  Pmod_out_pin4_t, Pmod_out_pin7_i, Pmod_out_pin7_o, Pmod_out_pin7_t, Pmod_out_pin8_i, 
  Pmod_out_pin8_o, Pmod_out_pin8_t, Pmod_out_pin9_i, Pmod_out_pin9_o, Pmod_out_pin9_t, 
  s_axi_aclk, s_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="AXI_LITE_IIC_araddr[8:0],AXI_LITE_IIC_arready,AXI_LITE_IIC_arvalid,AXI_LITE_IIC_awaddr[8:0],AXI_LITE_IIC_awready,AXI_LITE_IIC_awvalid,AXI_LITE_IIC_bready,AXI_LITE_IIC_bresp[1:0],AXI_LITE_IIC_bvalid,AXI_LITE_IIC_rdata[31:0],AXI_LITE_IIC_rready,AXI_LITE_IIC_rresp[1:0],AXI_LITE_IIC_rvalid,AXI_LITE_IIC_wdata[31:0],AXI_LITE_IIC_wready,AXI_LITE_IIC_wstrb[3:0],AXI_LITE_IIC_wvalid,AXI_LITE_TMR_araddr[8:0],AXI_LITE_TMR_arready,AXI_LITE_TMR_arvalid,AXI_LITE_TMR_awaddr[8:0],AXI_LITE_TMR_awready,AXI_LITE_TMR_awvalid,AXI_LITE_TMR_bready,AXI_LITE_TMR_bresp[1:0],AXI_LITE_TMR_bvalid,AXI_LITE_TMR_rdata[31:0],AXI_LITE_TMR_rready,AXI_LITE_TMR_rresp[1:0],AXI_LITE_TMR_rvalid,AXI_LITE_TMR_wdata[31:0],AXI_LITE_TMR_wready,AXI_LITE_TMR_wstrb[3:0],AXI_LITE_TMR_wvalid,I2C_Interrupt,Pmod_out_pin10_i,Pmod_out_pin10_o,Pmod_out_pin10_t,Pmod_out_pin1_i,Pmod_out_pin1_o,Pmod_out_pin1_t,Pmod_out_pin2_i,Pmod_out_pin2_o,Pmod_out_pin2_t,Pmod_out_pin3_i,Pmod_out_pin3_o,Pmod_out_pin3_t,Pmod_out_pin4_i,Pmod_out_pin4_o,Pmod_out_pin4_t,Pmod_out_pin7_i,Pmod_out_pin7_o,Pmod_out_pin7_t,Pmod_out_pin8_i,Pmod_out_pin8_o,Pmod_out_pin8_t,Pmod_out_pin9_i,Pmod_out_pin9_o,Pmod_out_pin9_t,s_axi_aclk,s_axi_aresetn" */;
  input [8:0]AXI_LITE_IIC_araddr;
  output AXI_LITE_IIC_arready;
  input AXI_LITE_IIC_arvalid;
  input [8:0]AXI_LITE_IIC_awaddr;
  output AXI_LITE_IIC_awready;
  input AXI_LITE_IIC_awvalid;
  input AXI_LITE_IIC_bready;
  output [1:0]AXI_LITE_IIC_bresp;
  output AXI_LITE_IIC_bvalid;
  output [31:0]AXI_LITE_IIC_rdata;
  input AXI_LITE_IIC_rready;
  output [1:0]AXI_LITE_IIC_rresp;
  output AXI_LITE_IIC_rvalid;
  input [31:0]AXI_LITE_IIC_wdata;
  output AXI_LITE_IIC_wready;
  input [3:0]AXI_LITE_IIC_wstrb;
  input AXI_LITE_IIC_wvalid;
  input [8:0]AXI_LITE_TMR_araddr;
  output AXI_LITE_TMR_arready;
  input AXI_LITE_TMR_arvalid;
  input [8:0]AXI_LITE_TMR_awaddr;
  output AXI_LITE_TMR_awready;
  input AXI_LITE_TMR_awvalid;
  input AXI_LITE_TMR_bready;
  output [1:0]AXI_LITE_TMR_bresp;
  output AXI_LITE_TMR_bvalid;
  output [31:0]AXI_LITE_TMR_rdata;
  input AXI_LITE_TMR_rready;
  output [1:0]AXI_LITE_TMR_rresp;
  output AXI_LITE_TMR_rvalid;
  input [31:0]AXI_LITE_TMR_wdata;
  output AXI_LITE_TMR_wready;
  input [3:0]AXI_LITE_TMR_wstrb;
  input AXI_LITE_TMR_wvalid;
  output I2C_Interrupt;
  input Pmod_out_pin10_i;
  output Pmod_out_pin10_o;
  output Pmod_out_pin10_t;
  input Pmod_out_pin1_i;
  output Pmod_out_pin1_o;
  output Pmod_out_pin1_t;
  input Pmod_out_pin2_i;
  output Pmod_out_pin2_o;
  output Pmod_out_pin2_t;
  input Pmod_out_pin3_i;
  output Pmod_out_pin3_o;
  output Pmod_out_pin3_t;
  input Pmod_out_pin4_i;
  output Pmod_out_pin4_o;
  output Pmod_out_pin4_t;
  input Pmod_out_pin7_i;
  output Pmod_out_pin7_o;
  output Pmod_out_pin7_t;
  input Pmod_out_pin8_i;
  output Pmod_out_pin8_o;
  output Pmod_out_pin8_t;
  input Pmod_out_pin9_i;
  output Pmod_out_pin9_o;
  output Pmod_out_pin9_t;
  input s_axi_aclk;
  input s_axi_aresetn;
endmodule
