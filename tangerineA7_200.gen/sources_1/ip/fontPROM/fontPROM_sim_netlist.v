// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Aug 21 12:07:26 2024
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
OniA0O/rnzQ1IA==
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
