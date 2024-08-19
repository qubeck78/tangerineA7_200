// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Aug 16 18:18:54 2024
// Host        : Desktop-qUBECk running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fontPROM -prefix
//               fontPROM_ fontPROM_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17392)
`pragma protect data_block
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
8ZTpQHfFhw==
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
