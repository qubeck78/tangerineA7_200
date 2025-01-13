// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Jan 12 18:27:01 2025
// Host        : DESKTOP-T3E75FC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qubeck/Documents/Development/ProjektyVHDL/A7BaseBoard/tangerineA7_200/tangerineA7_200.gen/sources_1/ip/fontPROM/fontPROM_sim_netlist.v
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
qn5xgUJf0tnuRQ==
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
