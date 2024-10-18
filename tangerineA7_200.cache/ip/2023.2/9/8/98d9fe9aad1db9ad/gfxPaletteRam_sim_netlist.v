// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct  8 07:46:34 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gfxPaletteRam_sim_netlist.v
// Design      : gfxPaletteRam
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gfxPaletteRam,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30368)
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
