// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Jan 12 18:27:00 2025
// Host        : DESKTOP-T3E75FC running 64-bit major release  (build 9200)
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
KcpTcY4h02xYri8sZfnRsDA=
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
