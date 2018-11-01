// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:myrom4bit:1.0
// IP Revision: 1

(* X_CORE_INFO = "myrom4bit,Vivado 2017.4" *)
(* CHECK_LICENSE_TYPE = "design_1_myrom4bit_4_0,myrom4bit,{}" *)
(* CORE_GENERATION_INFO = "design_1_myrom4bit_4_0,myrom4bit,{x_ipProduct=Vivado 2017.4,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=myrom4bit,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,RESULT_00=0x8000,RESULT_01=0x783E,RESULT_02=0x70F5,RESULT_03=0x6A1D,RESULT_04=0x63AF,RESULT_05=0x5DA5,RESULT_06=0x57F9,RESULT_07=0x52A4,RESULT_08=0x4DA2,RESULT_09=0x48EE,RESULT_10=0x4483,RESULT_11=0x405C,RESULT_12=0x3C76,RESULT_13=0x38CC,RESULT_14=0x355B,RESULT_15=0x3220}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_myrom4bit_4_0 (
  cur_substrate_N,
  clk,
  rst_n,
  cur_result
);

input wire [3 : 0] cur_substrate_N;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 10000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
output wire [15 : 0] cur_result;

  myrom4bit #(
    .RESULT_00(16'H8000),
    .RESULT_01(16'H783E),
    .RESULT_02(16'H70F5),
    .RESULT_03(16'H6A1D),
    .RESULT_04(16'H63AF),
    .RESULT_05(16'H5DA5),
    .RESULT_06(16'H57F9),
    .RESULT_07(16'H52A4),
    .RESULT_08(16'H4DA2),
    .RESULT_09(16'H48EE),
    .RESULT_10(16'H4483),
    .RESULT_11(16'H405C),
    .RESULT_12(16'H3C76),
    .RESULT_13(16'H38CC),
    .RESULT_14(16'H355B),
    .RESULT_15(16'H3220)
  ) inst (
    .cur_substrate_N(cur_substrate_N),
    .clk(clk),
    .rst_n(rst_n),
    .cur_result(cur_result)
  );
endmodule
