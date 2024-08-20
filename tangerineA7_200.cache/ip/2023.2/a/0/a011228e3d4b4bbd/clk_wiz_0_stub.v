// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Aug 20 10:16:39 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk25, clk25ps, clk125, clk125ps, clk50, clk100, 
  clk100ps, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="resetn,locked,clk_in1" */
/* synthesis syn_force_seq_prim="clk25" */
/* synthesis syn_force_seq_prim="clk25ps" */
/* synthesis syn_force_seq_prim="clk125" */
/* synthesis syn_force_seq_prim="clk125ps" */
/* synthesis syn_force_seq_prim="clk50" */
/* synthesis syn_force_seq_prim="clk100" */
/* synthesis syn_force_seq_prim="clk100ps" */;
  output clk25 /* synthesis syn_isclock = 1 */;
  output clk25ps /* synthesis syn_isclock = 1 */;
  output clk125 /* synthesis syn_isclock = 1 */;
  output clk125ps /* synthesis syn_isclock = 1 */;
  output clk50 /* synthesis syn_isclock = 1 */;
  output clk100 /* synthesis syn_isclock = 1 */;
  output clk100ps /* synthesis syn_isclock = 1 */;
  input resetn;
  output locked;
  input clk_in1;
endmodule
