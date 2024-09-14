// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Sep 13 08:35:03 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/fontPROM/fontPROM_sim_netlist.v
// Design      : fontPROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fontPROM,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fontPROM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.2196 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "fontPROM.mem" *) 
  (* C_INIT_FILE_NAME = "fontPROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  fontPROM_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17680)
`pragma protect data_block
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
v8ZXc6hZgtbyxg==
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
