-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: digilentinc.com:IP:PmodHYGRO:1.0
-- IP Revision: 28

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_20_PmodHYGRO_0_0 IS
  PORT (
    AXI_LITE_IIC_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_IIC_arready : OUT STD_LOGIC;
    AXI_LITE_IIC_arvalid : IN STD_LOGIC;
    AXI_LITE_IIC_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_IIC_awready : OUT STD_LOGIC;
    AXI_LITE_IIC_awvalid : IN STD_LOGIC;
    AXI_LITE_IIC_bready : IN STD_LOGIC;
    AXI_LITE_IIC_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_IIC_bvalid : OUT STD_LOGIC;
    AXI_LITE_IIC_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_IIC_rready : IN STD_LOGIC;
    AXI_LITE_IIC_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_IIC_rvalid : OUT STD_LOGIC;
    AXI_LITE_IIC_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_IIC_wready : OUT STD_LOGIC;
    AXI_LITE_IIC_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI_LITE_IIC_wvalid : IN STD_LOGIC;
    AXI_LITE_TMR_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_TMR_arready : OUT STD_LOGIC;
    AXI_LITE_TMR_arvalid : IN STD_LOGIC;
    AXI_LITE_TMR_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_TMR_awready : OUT STD_LOGIC;
    AXI_LITE_TMR_awvalid : IN STD_LOGIC;
    AXI_LITE_TMR_bready : IN STD_LOGIC;
    AXI_LITE_TMR_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_TMR_bvalid : OUT STD_LOGIC;
    AXI_LITE_TMR_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_TMR_rready : IN STD_LOGIC;
    AXI_LITE_TMR_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_TMR_rvalid : OUT STD_LOGIC;
    AXI_LITE_TMR_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_TMR_wready : OUT STD_LOGIC;
    AXI_LITE_TMR_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI_LITE_TMR_wvalid : IN STD_LOGIC;
    I2C_Interrupt : OUT STD_LOGIC;
    Pmod_out_pin10_i : IN STD_LOGIC;
    Pmod_out_pin10_o : OUT STD_LOGIC;
    Pmod_out_pin10_t : OUT STD_LOGIC;
    Pmod_out_pin1_i : IN STD_LOGIC;
    Pmod_out_pin1_o : OUT STD_LOGIC;
    Pmod_out_pin1_t : OUT STD_LOGIC;
    Pmod_out_pin2_i : IN STD_LOGIC;
    Pmod_out_pin2_o : OUT STD_LOGIC;
    Pmod_out_pin2_t : OUT STD_LOGIC;
    Pmod_out_pin3_i : IN STD_LOGIC;
    Pmod_out_pin3_o : OUT STD_LOGIC;
    Pmod_out_pin3_t : OUT STD_LOGIC;
    Pmod_out_pin4_i : IN STD_LOGIC;
    Pmod_out_pin4_o : OUT STD_LOGIC;
    Pmod_out_pin4_t : OUT STD_LOGIC;
    Pmod_out_pin7_i : IN STD_LOGIC;
    Pmod_out_pin7_o : OUT STD_LOGIC;
    Pmod_out_pin7_t : OUT STD_LOGIC;
    Pmod_out_pin8_i : IN STD_LOGIC;
    Pmod_out_pin8_o : OUT STD_LOGIC;
    Pmod_out_pin8_t : OUT STD_LOGIC;
    Pmod_out_pin9_i : IN STD_LOGIC;
    Pmod_out_pin9_o : OUT STD_LOGIC;
    Pmod_out_pin9_t : OUT STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC
  );
END system_20_PmodHYGRO_0_0;

ARCHITECTURE system_20_PmodHYGRO_0_0_arch OF system_20_PmodHYGRO_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_20_PmodHYGRO_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT PmodHYGRO IS
    PORT (
      AXI_LITE_IIC_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      AXI_LITE_IIC_arready : OUT STD_LOGIC;
      AXI_LITE_IIC_arvalid : IN STD_LOGIC;
      AXI_LITE_IIC_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      AXI_LITE_IIC_awready : OUT STD_LOGIC;
      AXI_LITE_IIC_awvalid : IN STD_LOGIC;
      AXI_LITE_IIC_bready : IN STD_LOGIC;
      AXI_LITE_IIC_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      AXI_LITE_IIC_bvalid : OUT STD_LOGIC;
      AXI_LITE_IIC_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      AXI_LITE_IIC_rready : IN STD_LOGIC;
      AXI_LITE_IIC_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      AXI_LITE_IIC_rvalid : OUT STD_LOGIC;
      AXI_LITE_IIC_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      AXI_LITE_IIC_wready : OUT STD_LOGIC;
      AXI_LITE_IIC_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      AXI_LITE_IIC_wvalid : IN STD_LOGIC;
      AXI_LITE_TMR_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      AXI_LITE_TMR_arready : OUT STD_LOGIC;
      AXI_LITE_TMR_arvalid : IN STD_LOGIC;
      AXI_LITE_TMR_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      AXI_LITE_TMR_awready : OUT STD_LOGIC;
      AXI_LITE_TMR_awvalid : IN STD_LOGIC;
      AXI_LITE_TMR_bready : IN STD_LOGIC;
      AXI_LITE_TMR_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      AXI_LITE_TMR_bvalid : OUT STD_LOGIC;
      AXI_LITE_TMR_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      AXI_LITE_TMR_rready : IN STD_LOGIC;
      AXI_LITE_TMR_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      AXI_LITE_TMR_rvalid : OUT STD_LOGIC;
      AXI_LITE_TMR_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      AXI_LITE_TMR_wready : OUT STD_LOGIC;
      AXI_LITE_TMR_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      AXI_LITE_TMR_wvalid : IN STD_LOGIC;
      I2C_Interrupt : OUT STD_LOGIC;
      Pmod_out_pin10_i : IN STD_LOGIC;
      Pmod_out_pin10_o : OUT STD_LOGIC;
      Pmod_out_pin10_t : OUT STD_LOGIC;
      Pmod_out_pin1_i : IN STD_LOGIC;
      Pmod_out_pin1_o : OUT STD_LOGIC;
      Pmod_out_pin1_t : OUT STD_LOGIC;
      Pmod_out_pin2_i : IN STD_LOGIC;
      Pmod_out_pin2_o : OUT STD_LOGIC;
      Pmod_out_pin2_t : OUT STD_LOGIC;
      Pmod_out_pin3_i : IN STD_LOGIC;
      Pmod_out_pin3_o : OUT STD_LOGIC;
      Pmod_out_pin3_t : OUT STD_LOGIC;
      Pmod_out_pin4_i : IN STD_LOGIC;
      Pmod_out_pin4_o : OUT STD_LOGIC;
      Pmod_out_pin4_t : OUT STD_LOGIC;
      Pmod_out_pin7_i : IN STD_LOGIC;
      Pmod_out_pin7_o : OUT STD_LOGIC;
      Pmod_out_pin7_t : OUT STD_LOGIC;
      Pmod_out_pin8_i : IN STD_LOGIC;
      Pmod_out_pin8_o : OUT STD_LOGIC;
      Pmod_out_pin8_t : OUT STD_LOGIC;
      Pmod_out_pin9_i : IN STD_LOGIC;
      Pmod_out_pin9_o : OUT STD_LOGIC;
      Pmod_out_pin9_t : OUT STD_LOGIC;
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC
    );
  END COMPONENT PmodHYGRO;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME RST.S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME CLK.S_AXI_ACLK, ASSOCIATED_BUSIF AXI_LITE_TMR:AXI_LITE_IIC, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN system_20_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin9_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin9_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin9_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin8_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin8_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin8_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin7_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin7_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin7_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin4_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin4_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin4_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin3_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin3_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin3_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin2_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin2_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin2_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin1_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin1_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_O";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin1_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_I";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin10_t: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_T";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin10_o: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_O";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Pmod_out_pin10_i: SIGNAL IS "XIL_INTERFACENAME Pmod_out, BUSIF.BOARD_INTERFACE Custom, BOARD.ASSOCIATED_PARAM PMOD";
  ATTRIBUTE X_INTERFACE_INFO OF Pmod_out_pin10_i: SIGNAL IS "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_I";
  ATTRIBUTE X_INTERFACE_PARAMETER OF I2C_Interrupt: SIGNAL IS "XIL_INTERFACENAME INTR.I2C_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1, XIL_INTERFACENAME I2C_Interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF I2C_Interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 INTR.I2C_INTERRUPT INTERRUPT, xilinx.com:signal:interrupt:1.0 I2C_Interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR ARREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI_LITE_TMR_araddr: SIGNAL IS "XIL_INTERFACENAME AXI_LITE_TMR, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, BUSER_WIDTH 0, RUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, FREQ_HZ 50000000, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_20_processing_system7_0_0_FCLK_CLK0, NUM_READ" & 
"_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_TMR_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_TMR ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC ARREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI_LITE_IIC_araddr: SIGNAL IS "XIL_INTERFACENAME AXI_LITE_IIC, PROTOCOL AXI4LITE, ADDR_WIDTH 12, ID_WIDTH 0, DATA_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, READ_WRITE_MODE READ_WRITE, FREQ_HZ 50000000, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_20_processing_system7_0_0_FCLK_CLK0, NUM_READ" & 
"_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF AXI_LITE_IIC_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE_IIC ARADDR";
BEGIN
  U0 : PmodHYGRO
    PORT MAP (
      AXI_LITE_IIC_araddr => AXI_LITE_IIC_araddr,
      AXI_LITE_IIC_arready => AXI_LITE_IIC_arready,
      AXI_LITE_IIC_arvalid => AXI_LITE_IIC_arvalid,
      AXI_LITE_IIC_awaddr => AXI_LITE_IIC_awaddr,
      AXI_LITE_IIC_awready => AXI_LITE_IIC_awready,
      AXI_LITE_IIC_awvalid => AXI_LITE_IIC_awvalid,
      AXI_LITE_IIC_bready => AXI_LITE_IIC_bready,
      AXI_LITE_IIC_bresp => AXI_LITE_IIC_bresp,
      AXI_LITE_IIC_bvalid => AXI_LITE_IIC_bvalid,
      AXI_LITE_IIC_rdata => AXI_LITE_IIC_rdata,
      AXI_LITE_IIC_rready => AXI_LITE_IIC_rready,
      AXI_LITE_IIC_rresp => AXI_LITE_IIC_rresp,
      AXI_LITE_IIC_rvalid => AXI_LITE_IIC_rvalid,
      AXI_LITE_IIC_wdata => AXI_LITE_IIC_wdata,
      AXI_LITE_IIC_wready => AXI_LITE_IIC_wready,
      AXI_LITE_IIC_wstrb => AXI_LITE_IIC_wstrb,
      AXI_LITE_IIC_wvalid => AXI_LITE_IIC_wvalid,
      AXI_LITE_TMR_araddr => AXI_LITE_TMR_araddr,
      AXI_LITE_TMR_arready => AXI_LITE_TMR_arready,
      AXI_LITE_TMR_arvalid => AXI_LITE_TMR_arvalid,
      AXI_LITE_TMR_awaddr => AXI_LITE_TMR_awaddr,
      AXI_LITE_TMR_awready => AXI_LITE_TMR_awready,
      AXI_LITE_TMR_awvalid => AXI_LITE_TMR_awvalid,
      AXI_LITE_TMR_bready => AXI_LITE_TMR_bready,
      AXI_LITE_TMR_bresp => AXI_LITE_TMR_bresp,
      AXI_LITE_TMR_bvalid => AXI_LITE_TMR_bvalid,
      AXI_LITE_TMR_rdata => AXI_LITE_TMR_rdata,
      AXI_LITE_TMR_rready => AXI_LITE_TMR_rready,
      AXI_LITE_TMR_rresp => AXI_LITE_TMR_rresp,
      AXI_LITE_TMR_rvalid => AXI_LITE_TMR_rvalid,
      AXI_LITE_TMR_wdata => AXI_LITE_TMR_wdata,
      AXI_LITE_TMR_wready => AXI_LITE_TMR_wready,
      AXI_LITE_TMR_wstrb => AXI_LITE_TMR_wstrb,
      AXI_LITE_TMR_wvalid => AXI_LITE_TMR_wvalid,
      I2C_Interrupt => I2C_Interrupt,
      Pmod_out_pin10_i => Pmod_out_pin10_i,
      Pmod_out_pin10_o => Pmod_out_pin10_o,
      Pmod_out_pin10_t => Pmod_out_pin10_t,
      Pmod_out_pin1_i => Pmod_out_pin1_i,
      Pmod_out_pin1_o => Pmod_out_pin1_o,
      Pmod_out_pin1_t => Pmod_out_pin1_t,
      Pmod_out_pin2_i => Pmod_out_pin2_i,
      Pmod_out_pin2_o => Pmod_out_pin2_o,
      Pmod_out_pin2_t => Pmod_out_pin2_t,
      Pmod_out_pin3_i => Pmod_out_pin3_i,
      Pmod_out_pin3_o => Pmod_out_pin3_o,
      Pmod_out_pin3_t => Pmod_out_pin3_t,
      Pmod_out_pin4_i => Pmod_out_pin4_i,
      Pmod_out_pin4_o => Pmod_out_pin4_o,
      Pmod_out_pin4_t => Pmod_out_pin4_t,
      Pmod_out_pin7_i => Pmod_out_pin7_i,
      Pmod_out_pin7_o => Pmod_out_pin7_o,
      Pmod_out_pin7_t => Pmod_out_pin7_t,
      Pmod_out_pin8_i => Pmod_out_pin8_i,
      Pmod_out_pin8_o => Pmod_out_pin8_o,
      Pmod_out_pin8_t => Pmod_out_pin8_t,
      Pmod_out_pin9_i => Pmod_out_pin9_i,
      Pmod_out_pin9_o => Pmod_out_pin9_o,
      Pmod_out_pin9_t => Pmod_out_pin9_t,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn
    );
END system_20_PmodHYGRO_0_0_arch;
