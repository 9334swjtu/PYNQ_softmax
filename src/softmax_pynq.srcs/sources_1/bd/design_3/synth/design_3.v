//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Jun  1 15:50:04 2018
//Host        : DESKTOP-RQ40L4D running 64-bit major release  (build 9200)
//Command     : generate_target design_3.bd
//Design      : design_3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=30,numReposBlks=30,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=20,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=5,synth_mode=Global}" *) (* HW_HANDOFF = "design_3.hwdef" *) 
module design_3
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    can_read_0,
    can_write_0,
    led,
    m00_axi_init_axi_txn_0);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  input can_read_0;
  input can_write_0;
  output [7:0]led;
  input m00_axi_init_axi_txn_0;

  wire clk_0_1;
  wire [0:0]custom_register_0_data_out;
  wire [0:0]custom_register_1_data_out;
  wire [0:0]custom_register_2_data_out;
  wire [0:0]custom_register_3_data_out;
  wire [31:0]custom_register_5_data_out;
  wire [31:0]custom_register_6_data_out;
  wire [31:0]custom_register_7_data_out;
  wire [31:0]custom_register_8_data_out;
  wire [31:0]custom_register_9_data_out;
  wire [3:0]fix_shift_0_after_point_0;
  wire [3:0]fix_shift_0_after_point_1;
  wire [3:0]fix_shift_0_after_point_2;
  wire [3:0]fix_shift_0_after_point_3;
  wire [4:0]fix_shift_0_befor_point;
  wire m00_axi_init_axi_txn_0_1;
  wire [31:0]mult_gen_0_P;
  wire [31:0]mult_gen_1_P;
  wire [31:0]mult_gen_2_P;
  wire [31:0]mult_gen_3_P;
  wire [31:0]myresigter_0_data_out;
  wire [31:0]myresigter_1_data_out;
  wire [31:0]myrom4bit_4_cur_result;
  wire [31:0]myrom4bit_5_cur_result;
  wire [31:0]myrom4bit_6_cur_result;
  wire [31:0]myrom4bit_7_cur_result;
  wire [31:0]myrom5bit_1_cur_result;
  wire [31:0]new_axi_m_0_M_AXI_ARADDR;
  wire [2:0]new_axi_m_0_M_AXI_ARPROT;
  wire new_axi_m_0_M_AXI_ARREADY;
  wire new_axi_m_0_M_AXI_ARVALID;
  wire [31:0]new_axi_m_0_M_AXI_AWADDR;
  wire [2:0]new_axi_m_0_M_AXI_AWPROT;
  wire new_axi_m_0_M_AXI_AWREADY;
  wire new_axi_m_0_M_AXI_AWVALID;
  wire new_axi_m_0_M_AXI_BREADY;
  wire [1:0]new_axi_m_0_M_AXI_BRESP;
  wire new_axi_m_0_M_AXI_BVALID;
  wire [31:0]new_axi_m_0_M_AXI_RDATA;
  wire new_axi_m_0_M_AXI_RREADY;
  wire [1:0]new_axi_m_0_M_AXI_RRESP;
  wire new_axi_m_0_M_AXI_RVALID;
  wire [31:0]new_axi_m_0_M_AXI_WDATA;
  wire new_axi_m_0_M_AXI_WREADY;
  wire [3:0]new_axi_m_0_M_AXI_WSTRB;
  wire new_axi_m_0_M_AXI_WVALID;
  wire [31:0]new_axi_m_0_r_data1;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [0:0]rst_ps7_0_100M_peripheral_aresetn;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_0_M00_AXI_ARLEN;
  wire [1:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire [3:0]smartconnect_0_M00_AXI_ARQOS;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_0_M00_AXI_AWLEN;
  wire [1:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire [3:0]smartconnect_0_M00_AXI_AWQOS;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [0:0]xlconstant_0_dout;
  wire [1:0]xlconstant_1_dout;
  wire [7:0]xlslice_0_Dout;

  assign led[7:0] = xlslice_0_Dout;
  assign m00_axi_init_axi_txn_0_1 = m00_axi_init_axi_txn_0;
  design_3_custom_register_0_0 custom_register_0
       (.clk(clk_0_1),
        .data_in(1'b0),
        .data_out(custom_register_0_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_1_0 custom_register_1
       (.clk(clk_0_1),
        .data_in(custom_register_0_data_out),
        .data_out(custom_register_1_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_2_0 custom_register_2
       (.clk(clk_0_1),
        .data_in(custom_register_1_data_out),
        .data_out(custom_register_2_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_3_0 custom_register_3
       (.clk(clk_0_1),
        .data_in(custom_register_2_data_out),
        .data_out(custom_register_3_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_4_0 custom_register_4
       (.clk(clk_0_1),
        .data_in(custom_register_3_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_5_0 custom_register_5
       (.clk(clk_0_1),
        .data_in(new_axi_m_0_r_data1),
        .data_out(custom_register_5_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_5_1 custom_register_6
       (.clk(clk_0_1),
        .data_in(custom_register_5_data_out),
        .data_out(custom_register_6_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_6_0 custom_register_7
       (.clk(clk_0_1),
        .data_in(custom_register_6_data_out),
        .data_out(custom_register_7_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_7_0 custom_register_8
       (.clk(clk_0_1),
        .data_in(custom_register_7_data_out),
        .data_out(custom_register_8_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_custom_register_8_0 custom_register_9
       (.clk(clk_0_1),
        .data_in(custom_register_8_data_out),
        .data_out(custom_register_9_data_out),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_fix_shift_0_0 fix_shift_0
       (.after_point_0(fix_shift_0_after_point_0),
        .after_point_1(fix_shift_0_after_point_1),
        .after_point_2(fix_shift_0_after_point_2),
        .after_point_3(fix_shift_0_after_point_3),
        .befor_point(fix_shift_0_befor_point),
        .clk(clk_0_1),
        .rst(rst_ps7_0_100M_peripheral_aresetn));
  design_3_mult_gen_0_0 mult_gen_0
       (.A(myresigter_0_data_out),
        .B(mult_gen_1_P),
        .CLK(clk_0_1),
        .P(mult_gen_0_P));
  design_3_mult_gen_1_0 mult_gen_1
       (.A(mult_gen_3_P),
        .B(mult_gen_2_P),
        .CLK(clk_0_1),
        .P(mult_gen_1_P));
  design_3_mult_gen_2_0 mult_gen_2
       (.A(myrom4bit_6_cur_result),
        .B(myrom4bit_7_cur_result),
        .CLK(clk_0_1),
        .P(mult_gen_2_P));
  design_3_mult_gen_3_0 mult_gen_3
       (.A(myrom4bit_4_cur_result),
        .B(myrom4bit_5_cur_result),
        .CLK(clk_0_1),
        .P(mult_gen_3_P));
  design_3_myresigter_0_0 myresigter_0
       (.clk(clk_0_1),
        .data_in(myresigter_1_data_out),
        .data_out(myresigter_0_data_out),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myresigter_1_0 myresigter_1
       (.clk(clk_0_1),
        .data_in(myrom5bit_1_cur_result),
        .data_out(myresigter_1_data_out),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myresigter_2_0 myresigter_2
       (.clk(clk_0_1),
        .data_in(mult_gen_0_P),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myrom4bit_4_0 myrom4bit_4
       (.clk(clk_0_1),
        .cur_result(myrom4bit_4_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_0),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myrom4bit_5_0 myrom4bit_5
       (.clk(clk_0_1),
        .cur_result(myrom4bit_5_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_1),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myrom4bit_6_0 myrom4bit_6
       (.clk(clk_0_1),
        .cur_result(myrom4bit_6_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_2),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myrom4bit_7_0 myrom4bit_7
       (.clk(clk_0_1),
        .cur_result(myrom4bit_7_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_3),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_myrom5bit_1_0 myrom5bit_1
       (.clk(clk_0_1),
        .cur_result(myrom5bit_1_cur_result),
        .cur_substrate_N(fix_shift_0_befor_point),
        .rst_n(rst_ps7_0_100M_peripheral_aresetn));
  design_3_new_axi_m_0_0 new_axi_m_0
       (.INIT_AXI_TXN(m00_axi_init_axi_txn_0_1),
        .M_AXI_ACLK(clk_0_1),
        .M_AXI_ARADDR(new_axi_m_0_M_AXI_ARADDR),
        .M_AXI_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M_AXI_ARPROT(new_axi_m_0_M_AXI_ARPROT),
        .M_AXI_ARREADY(new_axi_m_0_M_AXI_ARREADY),
        .M_AXI_ARVALID(new_axi_m_0_M_AXI_ARVALID),
        .M_AXI_AWADDR(new_axi_m_0_M_AXI_AWADDR),
        .M_AXI_AWPROT(new_axi_m_0_M_AXI_AWPROT),
        .M_AXI_AWREADY(new_axi_m_0_M_AXI_AWREADY),
        .M_AXI_AWVALID(new_axi_m_0_M_AXI_AWVALID),
        .M_AXI_BREADY(new_axi_m_0_M_AXI_BREADY),
        .M_AXI_BRESP(new_axi_m_0_M_AXI_BRESP),
        .M_AXI_BVALID(new_axi_m_0_M_AXI_BVALID),
        .M_AXI_RDATA(new_axi_m_0_M_AXI_RDATA),
        .M_AXI_RREADY(new_axi_m_0_M_AXI_RREADY),
        .M_AXI_RRESP(new_axi_m_0_M_AXI_RRESP),
        .M_AXI_RVALID(new_axi_m_0_M_AXI_RVALID),
        .M_AXI_WDATA(new_axi_m_0_M_AXI_WDATA),
        .M_AXI_WREADY(new_axi_m_0_M_AXI_WREADY),
        .M_AXI_WSTRB(new_axi_m_0_M_AXI_WSTRB),
        .M_AXI_WVALID(new_axi_m_0_M_AXI_WVALID),
        .can_read(1'b0),
        .can_write(1'b0),
        .cur_state(xlconstant_1_dout),
        .r_data(new_axi_m_0_r_data1),
        .w_data(custom_register_9_data_out),
        .write_data_valid(xlconstant_0_dout));
  design_3_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(clk_0_1),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(clk_0_1),
        .M_AXI_GP0_ARREADY(1'b0),
        .M_AXI_GP0_AWREADY(1'b0),
        .M_AXI_GP0_BID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_BRESP({1'b0,1'b0}),
        .M_AXI_GP0_BVALID(1'b0),
        .M_AXI_GP0_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RLAST(1'b0),
        .M_AXI_GP0_RRESP({1'b0,1'b0}),
        .M_AXI_GP0_RVALID(1'b0),
        .M_AXI_GP0_WREADY(1'b0),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(clk_0_1),
        .S_AXI_HP0_ARADDR(smartconnect_0_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(smartconnect_0_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(smartconnect_0_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN(smartconnect_0_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(smartconnect_0_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(smartconnect_0_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(smartconnect_0_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(smartconnect_0_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(smartconnect_0_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(smartconnect_0_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(smartconnect_0_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(smartconnect_0_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(smartconnect_0_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(smartconnect_0_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(smartconnect_0_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(smartconnect_0_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(smartconnect_0_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(smartconnect_0_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(smartconnect_0_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(smartconnect_0_M00_AXI_AWVALID),
        .S_AXI_HP0_BREADY(smartconnect_0_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(smartconnect_0_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(smartconnect_0_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(smartconnect_0_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RLAST(smartconnect_0_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(smartconnect_0_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(smartconnect_0_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(smartconnect_0_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(smartconnect_0_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(smartconnect_0_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(smartconnect_0_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(smartconnect_0_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(smartconnect_0_M00_AXI_WVALID));
  design_3_rst_ps7_0_100M_0 rst_ps7_0_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(m00_axi_init_axi_txn_0_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_0_1));
  design_3_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(new_axi_m_0_M_AXI_ARADDR),
        .S00_AXI_arprot(new_axi_m_0_M_AXI_ARPROT),
        .S00_AXI_arready(new_axi_m_0_M_AXI_ARREADY),
        .S00_AXI_arvalid(new_axi_m_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(new_axi_m_0_M_AXI_AWADDR),
        .S00_AXI_awprot(new_axi_m_0_M_AXI_AWPROT),
        .S00_AXI_awready(new_axi_m_0_M_AXI_AWREADY),
        .S00_AXI_awvalid(new_axi_m_0_M_AXI_AWVALID),
        .S00_AXI_bready(new_axi_m_0_M_AXI_BREADY),
        .S00_AXI_bresp(new_axi_m_0_M_AXI_BRESP),
        .S00_AXI_bvalid(new_axi_m_0_M_AXI_BVALID),
        .S00_AXI_rdata(new_axi_m_0_M_AXI_RDATA),
        .S00_AXI_rready(new_axi_m_0_M_AXI_RREADY),
        .S00_AXI_rresp(new_axi_m_0_M_AXI_RRESP),
        .S00_AXI_rvalid(new_axi_m_0_M_AXI_RVALID),
        .S00_AXI_wdata(new_axi_m_0_M_AXI_WDATA),
        .S00_AXI_wready(new_axi_m_0_M_AXI_WREADY),
        .S00_AXI_wstrb(new_axi_m_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(new_axi_m_0_M_AXI_WVALID),
        .aclk(clk_0_1),
        .aresetn(rst_ps7_0_100M_peripheral_aresetn));
  design_3_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_3_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_3_xlslice_0_0 xlslice_0
       (.Dout(xlslice_0_Dout));
endmodule
