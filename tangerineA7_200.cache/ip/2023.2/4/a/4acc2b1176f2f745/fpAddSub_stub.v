// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Dec 28 09:58:25 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fpAddSub_stub.v
// Design      : fpAddSub
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "floating_point_v7_1_16,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(aclk, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, s_axis_operation_tvalid, s_axis_operation_tdata, 
  m_axis_result_tvalid, m_axis_result_tdata)
/* synthesis syn_black_box black_box_pad_pin="s_axis_a_tvalid,s_axis_a_tdata[31:0],s_axis_b_tvalid,s_axis_b_tdata[31:0],s_axis_operation_tvalid,s_axis_operation_tdata[7:0],m_axis_result_tvalid,m_axis_result_tdata[31:0]" */
/* synthesis syn_force_seq_prim="aclk" */;
  input aclk /* synthesis syn_isclock = 1 */;
  input s_axis_a_tvalid;
  input [31:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [31:0]s_axis_b_tdata;
  input s_axis_operation_tvalid;
  input [7:0]s_axis_operation_tdata;
  output m_axis_result_tvalid;
  output [31:0]m_axis_result_tdata;
endmodule
