// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Aug 16 18:18:54 2024
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
2+dpQ0uT1nEY3nKCn/PAcZc=
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
