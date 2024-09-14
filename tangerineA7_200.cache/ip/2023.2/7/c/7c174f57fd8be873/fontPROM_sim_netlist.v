// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Sep 13 08:35:03 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fontPROM_sim_netlist.v
// Design      : fontPROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fontPROM,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17744)
`pragma protect data_block
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
B9etOSIFSPWW8YGfB/sBSmc=
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
