// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Aug 16 18:18:55 2024
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
Te5RbZKvQ0SmSw==
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
