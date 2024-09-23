// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Sep 22 13:23:20 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ spriteDPRam_sim_netlist.v
// Design      : spriteDPRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "spriteDPRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28608)
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
