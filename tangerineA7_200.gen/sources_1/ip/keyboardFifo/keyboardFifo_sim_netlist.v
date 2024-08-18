// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Aug 17 21:47:45 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/keyboardFifo/keyboardFifo_sim_netlist.v
// Design      : keyboardFifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "keyboardFifo,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module keyboardFifo
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [7:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [7:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [7:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "8" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "255" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "254" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "8" *) 
  (* C_RD_DEPTH = "256" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "8" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "8" *) 
  (* C_WR_DEPTH = "256" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "8" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  keyboardFifo_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[7:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[7:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[7:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "8" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module keyboardFifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [7:0]src_in_bin;
  input dest_clk;
  output [7:0]dest_out_bin;

  wire [7:0]async_path;
  wire [6:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[1] ;
  wire [7:0]dest_out_bin;
  wire [6:0]gray_enc;
  wire src_clk;
  wire [7:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[2]),
        .I2(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[2]),
        .O(binval[1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[7]),
        .Q(async_path[7]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "8" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module keyboardFifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [7:0]src_in_bin;
  input dest_clk;
  output [7:0]dest_out_bin;

  wire [7:0]async_path;
  wire [6:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [7:0]\dest_graysync_ff[1] ;
  wire [7:0]dest_out_bin;
  wire [6:0]gray_enc;
  wire src_clk;
  wire [7:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[2]),
        .I2(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[2]),
        .O(binval[1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[7]),
        .Q(async_path[7]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module keyboardFifo_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module keyboardFifo_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module keyboardFifo_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module keyboardFifo_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 113984)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
