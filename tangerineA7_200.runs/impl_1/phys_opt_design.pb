
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
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
1.002
2.60Z4-1435h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0072

2746.2892
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
-3.2272
	-1141.936Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 1f20479e4
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2272
	-1141.936Z32-619h px� 
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
8Phase 2 DSP Register Optimization | Checksum: 1f20479e4
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
W

Phase %s%s
101*constraints2
3 2
Critical Path OptimizationZ18-101h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.2272
	-1141.936Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[19].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[19]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[19]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.1752
	-1141.224Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[29].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[29]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
112
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0622
	-1141.003Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[20].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[20]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[20]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0252
	-1140.405Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[16].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[16]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-3.0192
	-1140.058Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[24].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[24]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[24]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[24]_i_4_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
232
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_0.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9792
	-1140.018Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_0.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_comp	/tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.9012
	-1138.940Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_02V
(tangerineSOCInst/nekoRvInst/stImm[0]_i_1	(tangerineSOCInst/nekoRvInst/stImm[0]_i_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.8632
	-1138.482Z32-619h px� 
^
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
52
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.6682
	-1133.904Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_n_02f
0tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_comp_1	0tangerineSOCInst/nekoRvInst/rdVal[16]_i_2_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_0-tangerineSOCInst/nekoRvInst/jtImm[16]_i_1_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.6442
	-1133.894Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_24tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_22f
0tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_comp_2	0tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_comp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_24tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.6072
	-1133.857Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2n
4tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_24tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_28Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2n
4tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_24tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0_repN_22f
0tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_comp_3	0tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_comp_38Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_8_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_8_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.5992
	-1133.725Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[28].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[28]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[28]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.5822
	-1133.456Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[17].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[17]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.5712
	-1133.300Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_comp	.tangerineSOCInst/nekoRvInst/rdVal[29]_i_2_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.5082
	-1133.121Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[23].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[23]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
162
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[23]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[23]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4912
	-1133.104Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[23]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[23]_i_2_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[29]_i_4	)tangerineSOCInst/nekoRvInst/rdVal[29]_i_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_0-tangerineSOCInst/nekoRvInst/rdVal[29]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4862
	-1133.036Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/stImm[0]_i_1_comp	-tangerineSOCInst/nekoRvInst/stImm[0]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/stImm[0]_i_2_n_0,tangerineSOCInst/nekoRvInst/stImm[0]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4812
	-1132.257Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[14].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[14]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[14]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[14]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[14]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4802
	-1131.718Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4792
	-1130.949Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4792
	-1130.318Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4752
	-1129.872Z32-619h px� 
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
-2.4752
	-1129.598Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[23]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[23]2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[23]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[23]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[23]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[23]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4732
	-1129.418Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[0]_i_1_n_0*tangerineSOCInst/nekoRvInst/rs1[0]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[0]_i_3_n_0*tangerineSOCInst/nekoRvInst/rs1[0]_i_3_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]2�
}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]_INST_0	}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]_INST_08Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[15]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4692
	-1074.469Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[11]&tangerineSOCInst/nekoRvInst/rs2Val[11]2Z
*tangerineSOCInst/nekoRvInst/rs2Val_reg[11]	*tangerineSOCInst/nekoRvInst/rs2Val_reg[11]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2R
&tangerineSOCInst/nekoRvInst/rs2Val[11]&tangerineSOCInst/nekoRvInst/rs2Val[11]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4602
	-1074.006Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4582
	-1073.622Z32-619h px� 
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
,tangerineSOCInst/nekoRvInst/rdVal[9]_i_7_n_0,tangerineSOCInst/nekoRvInst/rdVal[9]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4522
	-1072.920Z32-619h px� 
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
-2.4462
	-1072.105Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4352
	-1071.752Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_16_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_16_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_16	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_168Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_16_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_16_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4352
	-1071.661Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4332
	-1071.236Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4332
	-1071.245Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4312
	-1070.745Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[3]_i_20	)tangerineSOCInst/nekoRvInst/rdVal[3]_i_208Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4312
	-1070.745Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[3]_i_17	)tangerineSOCInst/nekoRvInst/rdVal[3]_i_178Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4262
	-1070.718Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[11].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[11]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[11]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[11]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[11]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[11]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[11]_i_6_n_0-tangerineSOCInst/nekoRvInst/rdVal[11]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4212
	-1070.143Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[10]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4182
	-1069.666Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_0-tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_n_02f
0tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_comp_1	0tangerineSOCInst/nekoRvInst/rdVal[17]_i_2_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2Z
*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_0*tangerineSOCInst/nekoRvInst/rs1[2]_i_1_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4162
	-1069.507Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n_12h
1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_1	1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4092
	-1068.258Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[13]'tangerineSOCInst/nekoRvInst/csrDOut[13]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_0/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_02\
+tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3	+tangerineSOCInst/nekoRvInst/csrDOut[31]_i_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_0/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4052
	-1068.404Z32-619h px� 
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
-2.4042
	-1067.678Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_comp	-tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_17_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4032
	-1067.655Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2f
0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN2^
,tangerineSOCInst/nekoRvInst/csrA[3]_i_1_comp	,tangerineSOCInst/nekoRvInst/csrA[3]_i_1_comp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2f
0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4022
	-1067.427Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_0/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3972
	-1064.439Z32-619h px� 
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
-2.3942
	-1064.286Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3922
	-1064.074Z32-619h px� 
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
-tangerineSOCInst/nekoRvInst/rdVal[18]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[18]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3872
	-1063.295Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2f
0tangerineSOCInst/nekoRvInst/rdVal_reg[5]_i_4_n_00tangerineSOCInst/nekoRvInst/rdVal_reg[5]_i_4_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
182
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3812
	-1063.249Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_18_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_18_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[3]_i_18	)tangerineSOCInst/nekoRvInst/rdVal[3]_i_188Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_18_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_18_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3782
	-1063.198Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[3]_i_2_n_0+tangerineSOCInst/nekoRvInst/csrA[3]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
122
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3752
	-1062.126Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_22h
1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_2	1tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[7]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3742
	-1061.669Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[25]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3662
	-1061.332Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3622
	-1060.804Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[8]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[8]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[8]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[8]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[8]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[8]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[8]_i_6_n_0,tangerineSOCInst/nekoRvInst/rdVal[8]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3612
	-1060.235Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[10]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[10]_i_1_n_0-tangerineSOCInst/nekoRvInst/rdVal[10]_i_1_n_02b
.tangerineSOCInst/nekoRvInst/rdVal[10]_i_1_comp	.tangerineSOCInst/nekoRvInst/rdVal[10]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[10]_i_6_n_0-tangerineSOCInst/nekoRvInst/rdVal[10]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3602
	-1059.370Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n_22h
1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_2	1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3542
	-1058.920Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[29]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3482
	-1057.804Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_33tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_32h
1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_3	1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_33tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3482
	-1057.379Z32-619h px� 
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
-2.3472
	-1056.752Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3452
	-1056.173Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[4]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[4]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[4]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[4]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[4]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[4]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[4]_i_6_n_0,tangerineSOCInst/nekoRvInst/rdVal[4]_i_6_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3442
	-1055.644Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_comp	-tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_15_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_15_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422
	-1055.582Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3412
	-1055.273Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_47_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_47_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[5]_i_47	)tangerineSOCInst/nekoRvInst/rdVal[5]_i_478Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_47_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_47_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3402
	-1055.147Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_22h
1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_2	1tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_23tangerineSOCInst/nekoRvInst/rs2Val[8]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3362
	-1054.733Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[6]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3352
	-1054.578Z32-619h px� 
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
-2.3332
	-1054.151Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[24].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[24]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[24]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[24]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_0.tangerineSOCInst/nekoRvInst/rdVal[24]_i_12_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_0.tangerineSOCInst/nekoRvInst/rdVal[31]_i_32_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[3]_i_2_n_0+tangerineSOCInst/nekoRvInst/csrA[3]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_3_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_9_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_9_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_22_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_22_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3302
	-1052.866Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
122
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3212
	-1052.810Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[30]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3212
	-1052.412Z32-619h px� 
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
-2.3142
	-1051.656Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n_12h
1tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_1	1tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3082
	-1051.245Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_38Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[16]_i_1_psdsp_n_38Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3072
	-1051.176Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_0,tangerineSOCInst/nekoRvInst/rdVal[1]_i_4_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_10_n_0-tangerineSOCInst/nekoRvInst/rdVal[1]_i_10_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[1]_i_10	)tangerineSOCInst/nekoRvInst/rdVal[1]_i_108Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_10_n_0-tangerineSOCInst/nekoRvInst/rdVal[1]_i_10_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2962
	-1051.131Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[1]%tangerineSOCInst/nekoRvInst/rs2Val[1]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[1]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[1]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[1]%tangerineSOCInst/nekoRvInst/rs2Val[1]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2952
	-1050.704Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[21]'tangerineSOCInst/nekoRvInst/csrDOut[21]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[21]_i_2_n_0/tangerineSOCInst/nekoRvInst/csrDOut[21]_i_2_n_02\
+tangerineSOCInst/nekoRvInst/csrDOut[21]_i_2	+tangerineSOCInst/nekoRvInst/csrDOut[21]_i_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[21]_i_2_n_0/tangerineSOCInst/nekoRvInst/csrDOut[21]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2952
	-1050.655Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[28]'tangerineSOCInst/nekoRvInst/csrDOut[28]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
172
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[28]_i_2_n_0/tangerineSOCInst/nekoRvInst/csrDOut[28]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2942
	-1050.549Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n_42j
2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_4	2tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_48Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n_44tangerineSOCInst/nekoRvInst/rs2Val[31]_i_1_psdsp_n_48Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2902
	-1049.986Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[13]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2822
	-1049.720Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_15_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_15_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_24_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_24_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[2]_i_24	)tangerineSOCInst/nekoRvInst/rdVal[2]_i_248Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_24_n_0-tangerineSOCInst/nekoRvInst/rdVal[2]_i_24_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2822
	-1049.683Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[14]_i_1_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2802
	-1049.537Z32-619h px� 
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
-2.2752
	-1049.181Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2f
0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN0tangerineSOCInst/nekoRvInst/csrA[3]_i_1_n_0_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/csrA[11]_i_2_n_0,tangerineSOCInst/nekoRvInst/csrA[11]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/csrA[11]_i_3_n_0,tangerineSOCInst/nekoRvInst/csrA[11]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_3_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_10_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_10_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_23_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[31]_INST_0_i_23_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2742
	-1049.064Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
152
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2742
	-1049.037Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[8]%tangerineSOCInst/nekoRvInst/rs2Val[8]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_2_n_01tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_3_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_3_n_08Z32-702h px� 
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
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
182
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
)tangerineSOCInst/nekoRvInst/regs[0]_32[8])tangerineSOCInst/nekoRvInst/regs[0]_32[8]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2652
	-1048.890Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[1]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2642
	-1048.478Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[5]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2622
	-1047.956Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_0-tangerineSOCInst/nekoRvInst/rdVal[1]_i_11_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2622
	-1047.795Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_21_n_0�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[23]_INST_0_i_21_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2582
	-1047.087Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n2f
0tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp	0tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n2tangerineSOCInst/nekoRvInst/rs2Val[12]_i_1_psdsp_n8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2532
	-1046.694Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_12j
2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_1	2tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_14tangerineSOCInst/nekoRvInst/rs2Val[23]_i_1_psdsp_n_18Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2532
	-1046.230Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_4_n_01tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rs2Val[8]_i_10_n_0.tangerineSOCInst/nekoRvInst/rs2Val[8]_i_10_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_14_n_0/tangerineSOCInst/nekoRvInst/rs2Val[16]_i_14_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/itImm[0]_i_2_n_0,tangerineSOCInst/nekoRvInst/itImm[0]_i_2_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[20]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[20]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2522
	-1036.183Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[22].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[22]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
232
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[22]_i_7_n_0-tangerineSOCInst/nekoRvInst/rdVal[22]_i_7_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2512
	-1036.027Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_n_22t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_2	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_9_psdsp_n_28Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2492
	-1035.631Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
)tangerineSOCInst/nekoRvInst/regs[0]_32[8])tangerineSOCInst/nekoRvInst/regs[0]_32[8]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[132].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0[6]�tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[132].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0[6]8Z32-702h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2492
	-1035.631Z32-619h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:012
00:00:00.0362

2746.2892
0.000Z17-268h px� 
T
%s*common2;
9Phase 3 Critical Path Optimization | Checksum: 15c7d75e7
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:13 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
W

Phase %s%s
101*constraints2
4 2
Critical Path OptimizationZ18-101h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2492
	-1035.631Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[8]%tangerineSOCInst/nekoRvInst/rs2Val[8]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_4_n_01tangerineSOCInst/nekoRvInst/rs2Val_reg[8]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_1_n_02^
,tangerineSOCInst/nekoRvInst/csrA[2]_i_1_comp	,tangerineSOCInst/nekoRvInst/csrA[2]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2\
+tangerineSOCInst/nekoRvInst/csrA[2]_i_3_n_0+tangerineSOCInst/nekoRvInst/csrA[2]_i_3_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2472
	-1026.992Z32-619h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Physopt 32-6192
100Z17-14h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[3]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[3]_i_5_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_02X
)tangerineSOCInst/nekoRvInst/rdVal[3]_i_20	)tangerineSOCInst/nekoRvInst/rdVal[3]_i_208Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_0-tangerineSOCInst/nekoRvInst/rdVal[3]_i_20_n_08Z32-735h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[2]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_n_02`
-tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp	-tangerineSOCInst/nekoRvInst/rdVal[2]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_0,tangerineSOCInst/nekoRvInst/rdVal[2]_i_5_n_08Z32-735h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_n_22t
7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_2	7tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_28Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2x
9tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_n_29tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_8_psdsp_n_28Z32-735h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[6]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_0,tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_n_02d
/tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp_1	/tangerineSOCInst/nekoRvInst/rdVal[6]_i_1_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_0-tangerineSOCInst/nekoRvInst/rdVal[6]_i_21_n_08Z32-735h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[9].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[9]2X
)tangerineSOCInst/nekoRvInst/rs1Val_reg[9]	)tangerineSOCInst/nekoRvInst/rs1Val_reg[9]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
.tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[9].tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[9]8Z32-735h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Physopt 32-7352
100Z17-14h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2R
&tangerineSOCInst/nekoRvInst/csrDOut[5]&tangerineSOCInst/nekoRvInst/csrDOut[5]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2b
.tangerineSOCInst/nekoRvInst/csrDOut[5]_i_2_n_0.tangerineSOCInst/nekoRvInst/csrDOut[5]_i_2_n_02Z
*tangerineSOCInst/nekoRvInst/csrDOut[5]_i_2	*tangerineSOCInst/nekoRvInst/csrDOut[5]_i_28Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[13].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[13]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2h
1tangerineSOCInst/nekoRvInst/rdVal_reg[13]_i_4_n_01tangerineSOCInst/nekoRvInst/rdVal_reg[13]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal[13]_i_15_n_0.tangerineSOCInst/nekoRvInst/rdVal[13]_i_15_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
212
pinsZ32-608h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[14]'tangerineSOCInst/nekoRvInst/csrDOut[14]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[14]_i_2_n_0/tangerineSOCInst/nekoRvInst/csrDOut[14]_i_2_n_02\
+tangerineSOCInst/nekoRvInst/csrDOut[14]_i_2	+tangerineSOCInst/nekoRvInst/csrDOut[14]_i_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2d
/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[10]/tangerineSOCInst/nekoRvInst/rs1Val_reg_n_0_[10]2Z
*tangerineSOCInst/nekoRvInst/rs1Val_reg[10]	*tangerineSOCInst/nekoRvInst/rs1Val_reg[10]8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[13]'tangerineSOCInst/nekoRvInst/csrDOut[13]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#clk_wiz_0Inst/inst/clk100_clk_wiz_0#clk_wiz_0Inst/inst/clk100_clk_wiz_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_0/tangerineSOCInst/nekoRvInst/csrDOut[31]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/csrA[10]_i_1_n_0,tangerineSOCInst/nekoRvInst/csrA[10]_i_1_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
,tangerineSOCInst/nekoRvInst/csrA[10]_i_3_n_0,tangerineSOCInst/nekoRvInst/csrA[10]_i_3_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[30]vtangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[30]2�
}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[30]_INST_0	}tangerineSOCInst/fastRamInst/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/douta[30]_INST_08Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_34tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_n_32j
2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_3	2tangerineSOCInst/nekoRvInst/rs2Val[15]_i_1_psdsp_38Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2b
.tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[21].tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[21]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
162
pinsZ32-608h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2h
1tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n1tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp_n2d
/tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp	/tangerineSOCInst/nekoRvInst/rs2Val[4]_i_1_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2v
8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_12_psdsp_n8tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_12_psdsp_n2r
6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_12_psdsp	6tangerineSOCInst/nekoRvInst/resultMuluu0__1_i_12_psdsp8Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[11]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[11]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[11]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[11]_i_1_psdsp_28Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2n
4tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n_24tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_n_22j
2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_2	2tangerineSOCInst/nekoRvInst/rs2Val[19]_i_1_psdsp_28Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]-tangerineSOCInst/nekoRvInst/rdVal_reg_n_0_[5]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2f
0tangerineSOCInst/nekoRvInst/rdVal_reg[5]_i_4_n_00tangerineSOCInst/nekoRvInst/rdVal_reg[5]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2`
-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_0-tangerineSOCInst/nekoRvInst/rdVal[5]_i_15_n_08Z32-702h px� 
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
(Processed net %s.  Re-placed instance %s337*physynth2l
3tangerineSOCInst/nekoRvInst/rs2Val[2]_i_1_psdsp_n_13tangerineSOCInst/nekoRvInst/rs2Val[2]_i_1_psdsp_n_12h
1tangerineSOCInst/nekoRvInst/rs2Val[2]_i_1_psdsp_1	1tangerineSOCInst/nekoRvInst/rs2Val[2]_i_1_psdsp_18Z32-663h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2P
%tangerineSOCInst/nekoRvInst/rs2Val[6]%tangerineSOCInst/nekoRvInst/rs2Val[6]2X
)tangerineSOCInst/nekoRvInst/rs2Val_reg[6]	)tangerineSOCInst/nekoRvInst/rs2Val_reg[6]8Z32-663h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
'tangerineSOCInst/nekoRvInst/csrDOut[22]'tangerineSOCInst/nekoRvInst/csrDOut[22]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
112
pinsZ32-608h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0342

2746.2892
0.000Z17-268h px� 
T
%s*common2;
9Phase 4 Critical Path Optimization | Checksum: 248dab311
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0072

2746.2892
0.000Z17-268h px� 
y
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-2.2122
	-1020.588Z32-603h px� 
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
|  Critical Path  |          1.015  |        121.347  |            0  |              0  |                   115  |           0  |           2  |  00:00:13  |
|  Total          |          1.015  |        121.347  |            0  |              0  |                   115  |           0  |           3  |  00:00:13  |
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

00:00:002
00:00:00.0072

2746.2892
0.000Z17-268h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 23692be7a
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:15 . Memory (MB): peak = 2746.289 ; gain = 0.000h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
5492
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

00:00:132

00:00:182

2746.2892
0.000Z17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0252

2746.2892
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:022

00:00:012

2746.2892
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

2746.2892
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
00:00:00.0262

2746.2892
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0222

2746.2892
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0062

2746.2892
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:022

00:00:012

2746.2892
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�C:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.runs/impl_1/A7BoardTop_physopt.dcpZ17-1381h px� 


End Record