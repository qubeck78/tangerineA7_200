// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Aug 14 16:09:27 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gfxBufRam_sim_netlist.v
// Design      : gfxBufRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gfxBufRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28448)
`pragma protect data_block
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
SvilLZY=
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
