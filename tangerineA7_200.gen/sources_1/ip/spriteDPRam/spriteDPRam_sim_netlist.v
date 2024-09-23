// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Sep 22 13:23:21 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/spriteDPRam/spriteDPRam_sim_netlist.v
// Design      : spriteDPRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "spriteDPRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module spriteDPRam
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [1:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [31:0]dinb;
  wire [15:0]douta;
  wire [31:0]doutb;
  wire [1:0]wea;
  wire [3:0]web;
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
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.65225 mW" *) 
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
  (* C_INIT_FILE = "spriteDPRam.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "2" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  spriteDPRam_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28560)
`pragma protect data_block
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
Gugg
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
