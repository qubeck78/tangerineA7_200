// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Aug  6 12:02:09 2024
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
2/NYoUbW0TAY7Q==
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
