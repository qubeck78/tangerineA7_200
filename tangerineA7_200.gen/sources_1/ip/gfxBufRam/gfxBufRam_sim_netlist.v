// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Aug 14 16:09:27 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/gfxBufRam/gfxBufRam_sim_netlist.v
// Design      : gfxBufRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gfxBufRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module gfxBufRam
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire [0:0]web;
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

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.9043 mW" *) 
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
  (* C_INIT_FILE = "gfxBufRam.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  gfxBufRam_blk_mem_gen_v8_4_7 U0
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
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28368)
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
