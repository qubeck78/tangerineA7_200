// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct  8 07:46:34 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubec/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/gfxPaletteRam/gfxPaletteRam_sim_netlist.v
// Design      : gfxPaletteRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gfxPaletteRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module gfxPaletteRam
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [23:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [23:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [23:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [23:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [23:0]dina;
  wire [23:0]dinb;
  wire [23:0]douta;
  wire [23:0]doutb;
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
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [23:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.6227 mW" *) 
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
  (* C_INIT_FILE = "gfxPaletteRam.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "24" *) 
  (* C_READ_WIDTH_B = "24" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "24" *) 
  (* C_WRITE_WIDTH_B = "24" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  gfxPaletteRam_blk_mem_gen_v8_4_7 U0
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[23:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30336)
`pragma protect data_block
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
YnOuzh9XRGjnqYQt
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
