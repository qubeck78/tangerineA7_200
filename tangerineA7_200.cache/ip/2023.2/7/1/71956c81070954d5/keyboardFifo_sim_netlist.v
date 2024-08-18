// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Aug 17 21:47:45 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ keyboardFifo_sim_netlist.v
// Design      : keyboardFifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "keyboardFifo,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_9 U0
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "8" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
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

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
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
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 114432)
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
