
B
Command: %s
53*	vivadotcl2
phys_opt_designZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2

xc7a200tZ17-347h px� 
p
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2

xc7a200tZ17-349h px� 
R

Starting %s Task
103*constraints2
Initial Update TimingZ18-103h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
2.002
3.26Z4-1435h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0102

2807.1372
0.000Z17-268h px� 
O

Starting %s Task
103*constraints2
Physical SynthesisZ18-103h px� 
^

Phase %s%s
101*constraints2
1 2#
!Physical Synthesis InitializationZ18-101h px� 
n
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
2Z32-721h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.8522
	-1429.460Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 19dd30585
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.8522
	-1429.460Z32-619h px� 
V

Phase %s%s
101*constraints2
2 2
DSP Register OptimizationZ18-101h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
S
%s*common2:
8Phase 2 DSP Register Optimization | Checksum: 19dd30585
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
W

Phase %s%s
101*constraints2
3 2
Critical Path OptimizationZ18-101h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.8522
	-1429.460Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[28].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[28]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[28]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[28]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[28]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[28]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[28]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[28]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.8042
	-1428.548Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[29].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[29]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[29]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[29]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.7202
	-1427.678Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[30].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[30]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[30]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[30]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[30]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[30]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[30]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[30]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.6102
	-1427.180Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[17].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[17]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[17]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[17]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[17]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[17]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[17]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[17]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.5652
	-1426.784Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[27].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[27]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[27]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[27]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[27]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[27]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[27]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[27]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.5202
	-1426.046Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[25].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[25]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[25]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[25]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[25]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[25]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[25]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[25]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4912
	-1425.540Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[19].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[19]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[19]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[19]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[19]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[19]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[19]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[19]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4882
	-1424.883Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[31].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[31]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[31]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[31]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[31]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[31]_i_9_n_0-tangerineSOCInst/nekoRvInst/rdVal[31]_i_9_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4882
	-1424.228Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[26].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[26]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[26]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[26]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[26]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[26]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[26]_i_6_n_0-tangerineSOCInst/nekoRvInst/rdVal[26]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4652
	-1423.741Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[21].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[21]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[21]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[21]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[21]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[21]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[21]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[21]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4452
	-1423.181Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[18].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[18]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[18]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[18]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[18]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[18]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[18]_i_6_n_0-tangerineSOCInst/nekoRvInst/rdVal[18]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4412
	-1422.648Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[22].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[22]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[22]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[22]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[22]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[22]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[22]_i_6_n_0-tangerineSOCInst/nekoRvInst/rdVal[22]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4312
	-1422.137Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[9]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[9]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[9]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[9]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[9]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[9]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[9]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[9]_i_5_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4242
	-1421.614Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_0.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.4032
	-1416.814Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_22t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_2	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.3762
	-1415.911Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[6]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[6]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.3502
	-1415.417Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[24]&tangerineSOCInst/nekoRvInst/rs2Val[24]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[24]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[24]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[24]&tangerineSOCInst/nekoRvInst/rs2Val[24]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2962
	-1415.131Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_02V
(tangerineSOCInst/nekoRvInst/rdVal[2]_i_7	(tangerineSOCInst/nekoRvInst/rdVal[2]_i_78Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2682
	-1415.047Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[5]%tangerineSOCInst/nekoRvInst/rs2Val[5]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[5]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[5]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[5]%tangerineSOCInst/nekoRvInst/rs2Val[5]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2242
	-1414.526Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_comp	/tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[7]_i_19_n_0-tangerineSOCInst/nekoRvInst/rdVal[7]_i_19_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2122
	-1404.228Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
182
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1962
	-1404.198Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1822
	-1403.868Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1752
	-1403.813Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1732
	-1403.234Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_54tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_52j
2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_5	2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_54tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1722
	-1402.935Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_42j
2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_4	2tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1622
	-1402.678Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[5].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[5]2X
)tangerineSOCInst/nekoRvInst/rs1Val_reg[5]	)tangerineSOCInst/nekoRvInst/rs1Val_reg[5]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[5].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[5]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1272
	-1402.322Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_20	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_208Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1232
	-1402.212Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[5]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[5]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1222
	-1402.055Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_27tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_22p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_2	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_27tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1172
	-1401.623Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[21]&tangerineSOCInst/nekoRvInst/rs2Val[21]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[21]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[21]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[21]&tangerineSOCInst/nekoRvInst/rs2Val[21]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1002
	-1401.294Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0972
	-1401.253Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[22]&tangerineSOCInst/nekoRvInst/rs2Val[22]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[22]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[22]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[22]&tangerineSOCInst/nekoRvInst/rs2Val[22]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0912
	-1401.053Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0832
	-1400.570Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[24]_i_1_psdsp_n8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[24]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[24]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rs2Val[24]_i_7_n_0.tangerineSOCInst/nekoRvInst/rs2Val[24]_i_7_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/itImm[1]_i_1_comp	-tangerineSOCInst/nekoRvInst/itImm[1]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_2_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0672
	-1371.595Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[7]%tangerineSOCInst/nekoRvInst/rs2Val[7]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[7]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[7]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[7]%tangerineSOCInst/nekoRvInst/rs2Val[7]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0542
	-1371.375Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_37tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_32p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_3	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_37tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0282
	-1371.193Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_5:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_52v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_5	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_5:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0282
	-1370.903Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_57tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_52p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_5	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_57tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0172
	-1370.476Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_21	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_218Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0162
	-1370.297Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[16]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[16]2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[16]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[16]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[16]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[16]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0072
	-1370.091Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[13].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[13]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[13]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[13]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[13]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[13]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[13]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[13]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0062
	-1369.546Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_19tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_12t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_1	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_19tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9982
	-1369.297Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9852
	-1368.758Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_26tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_22n
4tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_2	4tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_26tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9812
	-1368.046Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[1]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[1]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[1]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_0,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9742
	-1367.948Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[16]&tangerineSOCInst/nekoRvInst/rs2Val[16]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[16]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[16]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[16]&tangerineSOCInst/nekoRvInst/rs2Val[16]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9682
	-1367.544Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_12h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_1	1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9672
	-1367.412Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp	5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9662
	-1367.261Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[5]_i_22	)tangerineSOCInst/nekoRvInst/rdVal[5]_i_228Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9622
	-1367.212Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_n_39tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_n_32t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_3	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_n_39tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_2_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9572
	-1367.025Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_49tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_42t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_4	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_49tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9542
	-1366.741Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_59tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_52t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_5	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_59tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9492
	-1366.722Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[12].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[12]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[12]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[12]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[12]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[12]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[12]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[12]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9422
	-1366.325Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp	5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_4_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9422
	-1366.122Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_53tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_52h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_5	1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_53tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9362
	-1365.442Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_59tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_1_psdsp_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_19_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_19_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_89_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_89_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_n_02r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_comp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_222_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[0]_i_2_n_0*tangerineSOCInst/nekoRvInst/rs1[0]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9162
	-1347.841Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_comp_1	/tangerineSOCInst/nekoRvInst/rdVal[5]_i_1_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_22_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9162
	-1347.775Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_33tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_32h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_3	1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_33tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9092
	-1347.561Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_42p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_4	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9022
	-1347.738Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[19]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[19]2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[19]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[19]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[19]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[19]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8982
	-1347.344Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[0]%tangerineSOCInst/nekoRvInst/rs2Val[0]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[0]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[0]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[0]%tangerineSOCInst/nekoRvInst/rs2Val[0]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8942
	-1347.011Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_42p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_4	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8932
	-1346.771Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_12v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_1	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8822
	-1346.626Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[6]_i_22	)tangerineSOCInst/nekoRvInst/rdVal[6]_i_228Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8822
	-1346.593Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_0-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[1]_i_11	)tangerineSOCInst/nekoRvInst/rdVal[1]_i_118Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_0-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8682
	-1346.414Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_59tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_52t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_5	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_59tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8652
	-1346.730Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8502
	-1346.702Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[5]_i_21	)tangerineSOCInst/nekoRvInst/rdVal[5]_i_218Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8502
	-1346.492Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_18Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val_reg[7]_i_3_n_01tangerineSOCInst/nekoRvInst/rs2Val_reg[7]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rs2Val[7]_i_9_n_0-tangerineSOCInst/nekoRvInst/rs2Val[7]_i_9_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_0/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2d
/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_0/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_02f
0tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_comp	0tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_2_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8492
	-1345.182Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[6]_i_21	)tangerineSOCInst/nekoRvInst/rdVal[6]_i_218Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8462
	-1345.168Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_10_psdsp_n_48Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/resultMuluu0_i_52_n_01tangerineSOCInst/nekoRvInst/resultMuluu0_i_52_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_149_n_02tangerineSOCInst/nekoRvInst/resultMuluu0_i_149_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8452
	-1345.161Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_148_n_02tangerineSOCInst/nekoRvInst/resultMuluu0_i_148_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8392
	-1343.789Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2d
/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_0/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_n_02j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_comp_1	2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_15_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_6_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8382
	-1315.475Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp_1	/tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_20_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8372
	-1315.379Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp	5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8352
	-1315.349Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp_1	/tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_22_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8072
	-1315.199Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7992
	-1315.143Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_118_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_118_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7962
	-1314.415Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_1_n_02d
/tangerineSOCInst/nekoRvInst/itImm[1]_i_1_comp_1	/tangerineSOCInst/nekoRvInst/itImm[1]_i_1_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[1]_i_6_n_0,tangerineSOCInst/nekoRvInst/itImm[1]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7912
	-1301.693Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_3:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_32v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_3	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_3:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7802
	-1301.597Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n2r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7732
	-1301.387Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_4:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n_48Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_66_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_66_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_182_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_182_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7712
	-1301.275Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_42p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_4	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_47tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7642
	-1301.365Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_12v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_1	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7642
	-1301.161Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_2:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_22v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_2	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_2:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7582
	-1300.988Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_12v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_1	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_1:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7572
	-1300.865Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_183_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_183_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7562
	-1299.507Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[10]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[10]_i_7_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_0.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_02Z
*tangerineSOCInst/nekoRvInst/rdVal[10]_i_21	*tangerineSOCInst/nekoRvInst/rdVal[10]_i_218Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_0.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7552
	-1299.468Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n2r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_17_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7482
	-1299.329Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[8].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[8]2X
)tangerineSOCInst/nekoRvInst/rs1Val_reg[8]	)tangerineSOCInst/nekoRvInst/rs1Val_reg[8]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[8].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[8]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7432
	-1298.907Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_56tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_52n
4tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_5	4tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_56tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7432
	-1298.507Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/btImm[11]_i_1_n_0-tangerineSOCInst/nekoRvInst/btImm[11]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/btImm[11]_i_1_n_0-tangerineSOCInst/nekoRvInst/btImm[11]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/btImm[11]_i_1_comp	.tangerineSOCInst/nekoRvInst/btImm[11]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/btImm[11]_i_2_n_0-tangerineSOCInst/nekoRvInst/btImm[11]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7422
	-1296.767Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_21	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_218Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7422
	-1296.689Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_4:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_42v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_4	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_4:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7412
	-1296.702Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[24]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[24]2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[24]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[24]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[24]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[24]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7382
	-1296.415Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_5:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_52v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_5	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_58Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_5:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_10_psdsp_n_58Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.7322
	-1296.270Z32-619h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Physopt 32-6192
100Z17-14h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_28Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_3_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_2_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_2_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]2�
}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0	}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_08Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]8Z32-735h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[10]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[10]_i_7_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
142
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_0.tangerineSOCInst/nekoRvInst/rdVal[10]_i_21_n_08Z32-735h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n8Z32-735h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Physopt 32-7352
100Z17-14h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_46tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_n_42n
4tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_4	4tangerineSOCInst/nekoRvInst/resultMuluu0_i_5_psdsp_48Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_0,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_comp	-tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_comp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_n_4:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_n_42v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_4	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_48Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_0-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[1]_i_2_n_0*tangerineSOCInst/nekoRvInst/rs1[1]_i_2_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[16]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[16]2�
}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[16]_INST_0	}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[16]_INST_08Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/opcode[6]_i_2_n_0-tangerineSOCInst/nekoRvInst/opcode[6]_i_2_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/opcode[6]_i_4_n_0-tangerineSOCInst/nekoRvInst/opcode[6]_i_4_n_02X
)tangerineSOCInst/nekoRvInst/opcode[6]_i_4	)tangerineSOCInst/nekoRvInst/opcode[6]_i_48Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[26]&tangerineSOCInst/nekoRvInst/rs2Val[26]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[26]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[26]8Z32-663h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
122
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_21_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/opcode[2]_i_1_n_0-tangerineSOCInst/nekoRvInst/opcode[2]_i_1_n_02X
)tangerineSOCInst/nekoRvInst/opcode[2]_i_1	)tangerineSOCInst/nekoRvInst/opcode[2]_i_18Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_30_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_30_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_30	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_308Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_38Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[0]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[0]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[0]_i_6_n_0,tangerineSOCInst/nekoRvInst/rdVal[0]_i_6_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[0]_i_17_n_0-tangerineSOCInst/nekoRvInst/rdVal[0]_i_17_n_08Z32-702h px� 
^
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
82
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[23]&tangerineSOCInst/nekoRvInst/rs2Val[23]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[23]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[23]8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[26]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[26]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[26]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[26]_i_1_psdsp_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n4tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp	2tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_0.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_comp	/tangerineSOCInst/nekoRvInst/rdVal[31]_i_52_comp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_3_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_3_psdsp_n_22t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_3_psdsp_2	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_3_psdsp_28Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_21_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/opcode[5]_i_1_n_0-tangerineSOCInst/nekoRvInst/opcode[5]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/opcode[5]_i_2_n_0-tangerineSOCInst/nekoRvInst/opcode[5]_i_2_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
utangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[5]utangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[5]2�
|tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[5]_INST_0	|tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[5]_INST_08Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/p_1_in3_in&tangerineSOCInst/nekoRvInst/p_1_in3_in2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[31]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[31]8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_38Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n_48Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[20]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[20]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
132
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_4_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_11_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_11_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_26_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[22]_INST_0_i_26_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
*tangerineSOCInst/nekoRvInst/regs[0]_32[22]*tangerineSOCInst/nekoRvInst/regs[0]_32[22]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[132].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0[6]�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[132].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0[6]8Z32-702h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0412

2807.1372
0.000Z17-268h px� 
T
%s*common2;
9Phase 3 Critical Path Optimization | Checksum: 1b6d1d2d7
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:14 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
W

Phase %s%s
101*constraints2
4 2
Critical Path OptimizationZ18-101h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[22]_i_1_psdsp_n_28Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_3_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_02^
,tangerineSOCInst/nekoRvInst/csrA[2]_i_1_comp	,tangerineSOCInst/nekoRvInst/csrA[2]_i_1_comp8Z32-710h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[20]_i_1_psdsp_n_48Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[20]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[20]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
132
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2r
6tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_56tangerineSOCInst/nekoRvInst/resultMuluu0_i_6_psdsp_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/resultMuluu0_i_37_n_01tangerineSOCInst/nekoRvInst/resultMuluu0_i_37_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_119_n_02tangerineSOCInst/nekoRvInst/resultMuluu0_i_119_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_n_02tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2j
2tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_n_02tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_n_02l
3tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_comp	3tangerineSOCInst/nekoRvInst/resultMuluu0_i_196_comp8Z32-710h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp_n2r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_13_psdsp8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[22]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_38Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp_n2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp	5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_5_psdsp8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[14].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[14]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_comp8Z32-710h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[12]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[12]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_04tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_34_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_0*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_0*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_02\
+tangerineSOCInst/nekoRvInst/rs1[2]_i_1_comp	+tangerineSOCInst/nekoRvInst/rs1[2]_i_1_comp8Z32-710h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[15]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[15]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_0.tangerineSOCInst/nekoRvInst/rdVal[15]_i_15_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
152
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[23]_i_3_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[23]_i_3_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_38Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_28Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[23]_i_2_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[23]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[6]%tangerineSOCInst/nekoRvInst/rs2Val[6]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[6]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[6]8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_n_42j
2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_4	2tangerineSOCInst/nekoRvInst/rs2Val[18]_i_1_psdsp_48Z32-663h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n_42j
2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_4	2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_48Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_n_27tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_n_22p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_2	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_7_psdsp_n7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_7_psdsp_n2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_7_psdsp	5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_7_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[21]_i_1_psdsp_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp_n2r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_11_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2z
:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_14_psdsp_n_3:tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_14_psdsp_n_32v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_14_psdsp_3	8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_14_psdsp_38Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n2l
3tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp	3tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
5tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_05tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_119_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_0-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_0-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_comp	.tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_comp8Z32-710h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n_54tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n_52j
2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_5	2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_58Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_17tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_12p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_1	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_18Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_27tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_n_22p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_2	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_13_psdsp_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2t
7tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_n_57tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_n_52p
5tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_5	5tangerineSOCInst/nekoRvInst/resultMuluu0_i_14_psdsp_58Z32-663h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Physopt 32-6632
100Z17-14h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[12].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[12]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_28Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val_reg[10]_i_5_n_02tangerineSOCInst/nekoRvInst/rs2Val_reg[10]_i_5_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[10]'tangerineSOCInst/nekoRvInst/csrDOut[10]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_18Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val_reg[7]_i_3_n_01tangerineSOCInst/nekoRvInst/rs2Val_reg[7]_i_3_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
232
pinsZ32-608h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0382

2807.1372
0.000Z17-268h px� 
T
%s*common2;
9Phase 4 Critical Path Optimization | Checksum: 241f2e6da
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:13 ; elapsed = 00:00:18 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0102

2807.1372
0.000Z17-268h px� 
y
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-2.5382
	-1203.767Z32-603h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          1.314  |        225.693  |            0  |              0  |                   162  |           0  |           2  |  00:00:16  |
|  Total          |          1.314  |        225.693  |            0  |              0  |                   162  |           0  |           3  |  00:00:16  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:012
00:00:00.0092

2807.1372
0.000Z17-268h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 221ddc332
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:14 ; elapsed = 00:00:19 . Memory (MB): peak = 2807.137 ; gain = 0.000h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
6032
22
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
phys_opt_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
phys_opt_design: 2

00:00:162

00:00:222

2807.1372
0.000Z17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0332

2807.1372
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:032

00:00:012

2807.1372
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

2807.1372
0.000Z17-268h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote RouteStorage: 2

00:00:002
00:00:00.0322

2807.1372
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0272

2807.1372
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0052

2807.1372
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:032

00:00:022

2807.1372
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�C:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.runs/impl_1/A7BoardTop_physopt.dcpZ17-1381h px� 


End Record