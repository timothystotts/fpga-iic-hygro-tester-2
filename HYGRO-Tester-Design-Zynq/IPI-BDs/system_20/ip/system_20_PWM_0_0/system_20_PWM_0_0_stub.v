// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Sep 10 13:36:26 2020
// Host        : l4study running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/timothystotts/Workareas/GitHub/timothystotts/fpga-iic-hygro-tester-2/HYGRO-Tester-Design-Zynq/IPI-BDs/system_20/ip/system_20_PWM_0_0/system_20_PWM_0_0_stub.v
// Design      : system_20_PWM_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "PWM_v2_0,Vivado 2019.1" *)
module system_20_PWM_0_0(pwm, pwm_axi_awaddr, pwm_axi_awprot, 
  pwm_axi_awvalid, pwm_axi_awready, pwm_axi_wdata, pwm_axi_wstrb, pwm_axi_wvalid, 
  pwm_axi_wready, pwm_axi_bresp, pwm_axi_bvalid, pwm_axi_bready, pwm_axi_araddr, 
  pwm_axi_arprot, pwm_axi_arvalid, pwm_axi_arready, pwm_axi_rdata, pwm_axi_rresp, 
  pwm_axi_rvalid, pwm_axi_rready, pwm_axi_aclk, pwm_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="pwm[5:0],pwm_axi_awaddr[6:0],pwm_axi_awprot[2:0],pwm_axi_awvalid,pwm_axi_awready,pwm_axi_wdata[31:0],pwm_axi_wstrb[3:0],pwm_axi_wvalid,pwm_axi_wready,pwm_axi_bresp[1:0],pwm_axi_bvalid,pwm_axi_bready,pwm_axi_araddr[6:0],pwm_axi_arprot[2:0],pwm_axi_arvalid,pwm_axi_arready,pwm_axi_rdata[31:0],pwm_axi_rresp[1:0],pwm_axi_rvalid,pwm_axi_rready,pwm_axi_aclk,pwm_axi_aresetn" */;
  output [5:0]pwm;
  input [6:0]pwm_axi_awaddr;
  input [2:0]pwm_axi_awprot;
  input pwm_axi_awvalid;
  output pwm_axi_awready;
  input [31:0]pwm_axi_wdata;
  input [3:0]pwm_axi_wstrb;
  input pwm_axi_wvalid;
  output pwm_axi_wready;
  output [1:0]pwm_axi_bresp;
  output pwm_axi_bvalid;
  input pwm_axi_bready;
  input [6:0]pwm_axi_araddr;
  input [2:0]pwm_axi_arprot;
  input pwm_axi_arvalid;
  output pwm_axi_arready;
  output [31:0]pwm_axi_rdata;
  output [1:0]pwm_axi_rresp;
  output pwm_axi_rvalid;
  input pwm_axi_rready;
  input pwm_axi_aclk;
  input pwm_axi_aresetn;
endmodule