// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Aug 21 12:07:26 2024
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
+WpL6douNZwy3wlNfLySkps=
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
