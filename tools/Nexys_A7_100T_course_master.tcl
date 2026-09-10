###############################################################################
# Nexys A7-100T reusable master constraints
#
# Purpose:
#   Shared XDC for digital-logic labs.
#
# Main naming convention:
#   CLK100MHZ
#   SW[15:0]
#   LED[15:0]
#   AN[7:0]
#   HEX[7:0]
#   BTNC / BTNU / BTNL / BTNR / BTND
#   CPU_RESETN
#
# HEX bit mapping used by our course:
#   HEX[7] -> CA
#   HEX[6] -> CF
#   HEX[5] -> CE
#   HEX[4] -> CD
#   HEX[3] -> CC
#   HEX[2] -> CB
#   HEX[1] -> CG
#   HEX[0] -> DP
#
# The helper procedure only applies a constraint when the corresponding
# top-level port actually exists. Therefore this single XDC can safely
# be reused by different lab top modules.
###############################################################################


###############################################################################
# Helper
###############################################################################

proc constrain_port {port pin iostd} {
    set obj [get_ports -quiet $port]

    if {[llength $obj] > 0} {
        set_property PACKAGE_PIN $pin $obj
        set_property IOSTANDARD $iostd $obj
    }
}


###############################################################################
# FPGA configuration
#
# Nexys A7 configuration bank is tied to the 3.3 V rail.
# These two properties also remove Vivado CFGBVS-1 warnings.
###############################################################################

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]


###############################################################################
# 100 MHz system clock
###############################################################################

constrain_port {CLK100MHZ} E3 LVCMOS33

set clk_port [get_ports -quiet {CLK100MHZ}]
if {[llength $clk_port] > 0} {
    create_clock -add \
        -name sys_clk_pin \
        -period 10.000 \
        -waveform {0.000 5.000} \
        $clk_port
}


###############################################################################
# Switches
###############################################################################

constrain_port {SW[0]}  J15 LVCMOS33
constrain_port {SW[1]}  L16 LVCMOS33
constrain_port {SW[2]}  M13 LVCMOS33
constrain_port {SW[3]}  R15 LVCMOS33
constrain_port {SW[4]}  R17 LVCMOS33
constrain_port {SW[5]}  T18 LVCMOS33
constrain_port {SW[6]}  U18 LVCMOS33
constrain_port {SW[7]}  R13 LVCMOS33

# These two switches are in the 1.8 V I/O bank.
constrain_port {SW[8]}  T8  LVCMOS18
constrain_port {SW[9]}  U8  LVCMOS18

constrain_port {SW[10]} R16 LVCMOS33
constrain_port {SW[11]} T13 LVCMOS33
constrain_port {SW[12]} H6  LVCMOS33
constrain_port {SW[13]} U12 LVCMOS33
constrain_port {SW[14]} U11 LVCMOS33
constrain_port {SW[15]} V10 LVCMOS33


###############################################################################
# User LEDs
###############################################################################

constrain_port {LED[0]}  H17 LVCMOS33
constrain_port {LED[1]}  K15 LVCMOS33
constrain_port {LED[2]}  J13 LVCMOS33
constrain_port {LED[3]}  N14 LVCMOS33
constrain_port {LED[4]}  R18 LVCMOS33
constrain_port {LED[5]}  V17 LVCMOS33
constrain_port {LED[6]}  U17 LVCMOS33
constrain_port {LED[7]}  U16 LVCMOS33
constrain_port {LED[8]}  V16 LVCMOS33
constrain_port {LED[9]}  T15 LVCMOS33
constrain_port {LED[10]} U14 LVCMOS33
constrain_port {LED[11]} T16 LVCMOS33
constrain_port {LED[12]} V15 LVCMOS33
constrain_port {LED[13]} V14 LVCMOS33
constrain_port {LED[14]} V12 LVCMOS33
constrain_port {LED[15]} V11 LVCMOS33


###############################################################################
# RGB LEDs
###############################################################################

constrain_port {LED16_R} N15 LVCMOS33
constrain_port {LED16_G} M16 LVCMOS33
constrain_port {LED16_B} R12 LVCMOS33

constrain_port {LED17_R} N16 LVCMOS33
constrain_port {LED17_G} R11 LVCMOS33
constrain_port {LED17_B} G14 LVCMOS33


###############################################################################
# Seven-segment display
#
# Physical segment pins from Digilent:
#
# CA = T10
# CB = R10
# CC = K16
# CD = K13
# CE = P15
# CF = T11
# CG = L18
# DP = H15
#
# Course HEX ordering:
#
# HEX[7:0] = {CA, CF, CE, CD, CC, CB, CG, DP}
#
# This is the ordering compatible with the already verified Lab01 segment
# codes, e.g. HEX = 8'b01100001 displays decimal 3.
###############################################################################

constrain_port {HEX[7]} T10 LVCMOS33
constrain_port {HEX[6]} T11 LVCMOS33
constrain_port {HEX[5]} P15 LVCMOS33
constrain_port {HEX[4]} K13 LVCMOS33
constrain_port {HEX[3]} K16 LVCMOS33
constrain_port {HEX[2]} R10 LVCMOS33
constrain_port {HEX[1]} L18 LVCMOS33
constrain_port {HEX[0]} H15 LVCMOS33


###############################################################################
# Seven-segment digit enables
###############################################################################

constrain_port {AN[0]} J17 LVCMOS33
constrain_port {AN[1]} J18 LVCMOS33
constrain_port {AN[2]} T9  LVCMOS33
constrain_port {AN[3]} J14 LVCMOS33
constrain_port {AN[4]} P14 LVCMOS33
constrain_port {AN[5]} T14 LVCMOS33
constrain_port {AN[6]} K2  LVCMOS33
constrain_port {AN[7]} U13 LVCMOS33


###############################################################################
# CPU reset button
###############################################################################

constrain_port {CPU_RESETN} C12 LVCMOS33


###############################################################################
# Direction buttons
###############################################################################

constrain_port {BTNC} N17 LVCMOS33
constrain_port {BTNU} M18 LVCMOS33
constrain_port {BTNL} P17 LVCMOS33
constrain_port {BTNR} M17 LVCMOS33
constrain_port {BTND} P18 LVCMOS33


###############################################################################
# Pmod JA
###############################################################################

constrain_port {JA[1]}  C17 LVCMOS33
constrain_port {JA[2]}  D18 LVCMOS33
constrain_port {JA[3]}  E18 LVCMOS33
constrain_port {JA[4]}  G17 LVCMOS33
constrain_port {JA[7]}  D17 LVCMOS33
constrain_port {JA[8]}  E17 LVCMOS33
constrain_port {JA[9]}  F18 LVCMOS33
constrain_port {JA[10]} G18 LVCMOS33


###############################################################################
# Pmod JB
###############################################################################

constrain_port {JB[1]}  D14 LVCMOS33
constrain_port {JB[2]}  F16 LVCMOS33
constrain_port {JB[3]}  G16 LVCMOS33
constrain_port {JB[4]}  H14 LVCMOS33
constrain_port {JB[7]}  E16 LVCMOS33
constrain_port {JB[8]}  F13 LVCMOS33
constrain_port {JB[9]}  G13 LVCMOS33
constrain_port {JB[10]} H16 LVCMOS33


###############################################################################
# Pmod JC
###############################################################################

constrain_port {JC[1]}  K1 LVCMOS33
constrain_port {JC[2]}  F6 LVCMOS33
constrain_port {JC[3]}  J2 LVCMOS33
constrain_port {JC[4]}  G6 LVCMOS33
constrain_port {JC[7]}  E7 LVCMOS33
constrain_port {JC[8]}  J3 LVCMOS33
constrain_port {JC[9]}  J4 LVCMOS33
constrain_port {JC[10]} E6 LVCMOS33


###############################################################################
# Pmod JD
###############################################################################

constrain_port {JD[1]}  H4 LVCMOS33
constrain_port {JD[2]}  H1 LVCMOS33
constrain_port {JD[3]}  G1 LVCMOS33
constrain_port {JD[4]}  G3 LVCMOS33
constrain_port {JD[7]}  H2 LVCMOS33
constrain_port {JD[8]}  G4 LVCMOS33
constrain_port {JD[9]}  G2 LVCMOS33
constrain_port {JD[10]} F3 LVCMOS33


###############################################################################
# JXADC header
###############################################################################

constrain_port {XA_N[1]} A14 LVCMOS33
constrain_port {XA_P[1]} A13 LVCMOS33
constrain_port {XA_N[2]} A16 LVCMOS33
constrain_port {XA_P[2]} A15 LVCMOS33
constrain_port {XA_N[3]} B17 LVCMOS33
constrain_port {XA_P[3]} B16 LVCMOS33
constrain_port {XA_N[4]} A18 LVCMOS33
constrain_port {XA_P[4]} B18 LVCMOS33


###############################################################################
# VGA
###############################################################################

constrain_port {VGA_R[0]} A3 LVCMOS33
constrain_port {VGA_R[1]} B4 LVCMOS33
constrain_port {VGA_R[2]} C5 LVCMOS33
constrain_port {VGA_R[3]} A4 LVCMOS33

constrain_port {VGA_G[0]} C6 LVCMOS33
constrain_port {VGA_G[1]} A5 LVCMOS33
constrain_port {VGA_G[2]} B6 LVCMOS33
constrain_port {VGA_G[3]} A6 LVCMOS33

constrain_port {VGA_B[0]} B7 LVCMOS33
constrain_port {VGA_B[1]} C7 LVCMOS33
constrain_port {VGA_B[2]} D7 LVCMOS33
constrain_port {VGA_B[3]} D8 LVCMOS33

constrain_port {VGA_HS} B11 LVCMOS33
constrain_port {VGA_VS} B12 LVCMOS33


###############################################################################
# MicroSD
###############################################################################

constrain_port {SD_RESET}  E2 LVCMOS33
constrain_port {SD_CD}     A1 LVCMOS33
constrain_port {SD_SCK}    B1 LVCMOS33
constrain_port {SD_CMD}    C1 LVCMOS33
constrain_port {SD_DAT[0]} C2 LVCMOS33
constrain_port {SD_DAT[1]} E1 LVCMOS33
constrain_port {SD_DAT[2]} F1 LVCMOS33
constrain_port {SD_DAT[3]} D2 LVCMOS33


###############################################################################
# Accelerometer
###############################################################################

constrain_port {ACL_MISO}   E15 LVCMOS33
constrain_port {ACL_MOSI}   F14 LVCMOS33
constrain_port {ACL_SCLK}   F15 LVCMOS33
constrain_port {ACL_CSN}    D15 LVCMOS33
constrain_port {ACL_INT[1]} B13 LVCMOS33
constrain_port {ACL_INT[2]} C16 LVCMOS33


###############################################################################
# Temperature sensor
###############################################################################

constrain_port {TMP_SCL} C14 LVCMOS33
constrain_port {TMP_SDA} C15 LVCMOS33
constrain_port {TMP_INT} D13 LVCMOS33
constrain_port {TMP_CT}  B14 LVCMOS33


###############################################################################
# Microphone
###############################################################################

constrain_port {M_CLK}   J5 LVCMOS33
constrain_port {M_DATA}  H5 LVCMOS33
constrain_port {M_LRSEL} F5 LVCMOS33


###############################################################################
# Audio amplifier
###############################################################################

constrain_port {AUD_PWM} A11 LVCMOS33
constrain_port {AUD_SD}  D12 LVCMOS33


###############################################################################
# USB-UART
###############################################################################

constrain_port {UART_TXD_IN}  C4 LVCMOS33
constrain_port {UART_RXD_OUT} D4 LVCMOS33
constrain_port {UART_CTS}     D3 LVCMOS33
constrain_port {UART_RTS}     E5 LVCMOS33


###############################################################################
# USB HID / PS2
###############################################################################

constrain_port {PS2_CLK}  F4 LVCMOS33
constrain_port {PS2_DATA} B2 LVCMOS33


###############################################################################
# Ethernet PHY
###############################################################################

constrain_port {ETH_MDC}    C9  LVCMOS33
constrain_port {ETH_MDIO}   A9  LVCMOS33
constrain_port {ETH_RSTN}   B3  LVCMOS33
constrain_port {ETH_CRSDV}  D9  LVCMOS33
constrain_port {ETH_RXERR}  C10 LVCMOS33
constrain_port {ETH_RXD[0]} C11 LVCMOS33
constrain_port {ETH_RXD[1]} D10 LVCMOS33
constrain_port {ETH_TXEN}   B9  LVCMOS33
constrain_port {ETH_TXD[0]} A10 LVCMOS33
constrain_port {ETH_TXD[1]} A8  LVCMOS33
constrain_port {ETH_REFCLK} D5  LVCMOS33
constrain_port {ETH_INTN}   B8  LVCMOS33


###############################################################################
# Quad SPI flash
###############################################################################

constrain_port {QSPI_DQ[0]} K17 LVCMOS33
constrain_port {QSPI_DQ[1]} K18 LVCMOS33
constrain_port {QSPI_DQ[2]} L14 LVCMOS33
constrain_port {QSPI_DQ[3]} M14 LVCMOS33
constrain_port {QSPI_CSN}   L13 LVCMOS33