EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:PolyPot
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PolyPot Control module PCB"
Date "2017-11-09"
Rev "1"
Comp "Team 15"
Comment1 "Authors: Loïc Niederhauser, Michael Spieler "
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery BT1
U 1 1 59FEEA16
P 1100 1350
F 0 "BT1" H 1200 1450 50  0000 L CNN
F 1 "Battery" H 1200 1350 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" V 1100 1410 50  0001 C CNN
F 3 "" V 1100 1410 50  0001 C CNN
	1    1100 1350
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 59FEEB1A
P 1850 1300
F 0 "C2" H 1875 1400 50  0000 L CNN
F 1 "1uF" H 1875 1200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1888 1150 50  0001 C CNN
F 3 "" H 1850 1300 50  0001 C CNN
	1    1850 1300
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 59FEEB5A
P 7450 5700
F 0 "R4" V 7530 5700 50  0000 C CNN
F 1 "10k" V 7450 5700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7380 5700 50  0001 C CNN
F 3 "" H 7450 5700 50  0001 C CNN
	1    7450 5700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 59FEECAD
P 1700 3600
F 0 "#PWR01" H 1700 3450 50  0001 C CNN
F 1 "+3.3V" H 1700 3740 50  0000 C CNN
F 2 "" H 1700 3600 50  0001 C CNN
F 3 "" H 1700 3600 50  0001 C CNN
	1    1700 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59FEECEA
P 9850 4550
F 0 "#PWR02" H 9850 4300 50  0001 C CNN
F 1 "GND" H 9850 4400 50  0000 C CNN
F 2 "" H 9850 4550 50  0001 C CNN
F 3 "" H 9850 4550 50  0001 C CNN
	1    9850 4550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 59FF3AAD
P 2650 6400
F 0 "R1" V 2730 6400 50  0000 C CNN
F 1 "470" V 2650 6400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2580 6400 50  0001 C CNN
F 3 "" H 2650 6400 50  0001 C CNN
	1    2650 6400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 59FF3B77
P 1100 1550
F 0 "#PWR03" H 1100 1300 50  0001 C CNN
F 1 "GND" H 1100 1400 50  0000 C CNN
F 2 "" H 1100 1550 50  0001 C CNN
F 3 "" H 1100 1550 50  0001 C CNN
	1    1100 1550
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 59FF3CCC
P 2750 1300
F 0 "C3" H 2775 1400 50  0000 L CNN
F 1 "1uF" H 2775 1200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2788 1150 50  0001 C CNN
F 3 "" H 2750 1300 50  0001 C CNN
	1    2750 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 59FF3E98
P 2300 1550
F 0 "#PWR04" H 2300 1300 50  0001 C CNN
F 1 "GND" H 2300 1400 50  0000 C CNN
F 2 "" H 2300 1550 50  0001 C CNN
F 3 "" H 2300 1550 50  0001 C CNN
	1    2300 1550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 59FF3FD2
P 2950 1150
F 0 "#PWR05" H 2950 1000 50  0001 C CNN
F 1 "+3.3V" H 2950 1290 50  0000 C CNN
F 2 "" H 2950 1150 50  0001 C CNN
F 3 "" H 2950 1150 50  0001 C CNN
	1    2950 1150
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 59FF435E
P 1700 3750
F 0 "C1" H 1725 3850 50  0000 L CNN
F 1 "100nF" H 1725 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1738 3600 50  0001 C CNN
F 3 "" H 1700 3750 50  0001 C CNN
	1    1700 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 59FF43B4
P 1700 3900
F 0 "#PWR06" H 1700 3650 50  0001 C CNN
F 1 "GND" H 1700 3750 50  0000 C CNN
F 2 "" H 1700 3900 50  0001 C CNN
F 3 "" H 1700 3900 50  0001 C CNN
	1    1700 3900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 59FF4D69
P 2700 3700
F 0 "#PWR07" H 2700 3550 50  0001 C CNN
F 1 "+3.3V" H 2700 3840 50  0000 C CNN
F 2 "" H 2700 3700 50  0001 C CNN
F 3 "" H 2700 3700 50  0001 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NC_Small JP1
U 1 1 59FF5D46
P 1550 1150
F 0 "JP1" H 1550 1230 50  0000 C CNN
F 1 "I_SENSE" H 1560 1090 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch1.27mm" H 1550 1150 50  0001 C CNN
F 3 "" H 1550 1150 50  0001 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 59FF6E35
P 1750 6600
F 0 "#PWR08" H 1750 6350 50  0001 C CNN
F 1 "GND" H 1750 6450 50  0000 C CNN
F 2 "" H 1750 6600 50  0001 C CNN
F 3 "" H 1750 6600 50  0001 C CNN
	1    1750 6600
	1    0    0    -1  
$EndComp
Text Label 9650 4150 0    60   ~ 0
UART_RX
Text Label 9650 4250 0    60   ~ 0
UART_TX
$Comp
L +3.3V #PWR09
U 1 1 59FF7868
P 7450 5550
F 0 "#PWR09" H 7450 5400 50  0001 C CNN
F 1 "+3.3V" H 7450 5690 50  0000 C CNN
F 2 "" H 7450 5550 50  0001 C CNN
F 3 "" H 7450 5550 50  0001 C CNN
	1    7450 5550
	1    0    0    -1  
$EndComp
Text Label 8150 5950 2    60   ~ 0
EN
$Comp
L +3.3V #PWR010
U 1 1 59FF8111
P 9850 4050
F 0 "#PWR010" H 9850 3900 50  0001 C CNN
F 1 "+3.3V" H 9850 4190 50  0000 C CNN
F 2 "" H 9850 4050 50  0001 C CNN
F 3 "" H 9850 4050 50  0001 C CNN
	1    9850 4050
	1    0    0    -1  
$EndComp
Text Label 9400 2050 0    60   ~ 0
3V3_SENSORS
$Comp
L GND #PWR011
U 1 1 59FF8991
P 9800 2250
F 0 "#PWR011" H 9800 2000 50  0001 C CNN
F 1 "GND" H 9800 2100 50  0000 C CNN
F 2 "" H 9800 2250 50  0001 C CNN
F 3 "" H 9800 2250 50  0001 C CNN
	1    9800 2250
	1    0    0    -1  
$EndComp
Text Label 9400 2150 0    60   ~ 0
SENS_HUMIDITY
Text Label 8300 2650 2    60   ~ 0
3V3_SENSORS
$Comp
L R R5
U 1 1 59FF9263
P 7600 3000
F 0 "R5" V 7680 3000 50  0000 C CNN
F 1 "4.7k" V 7600 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7530 3000 50  0001 C CNN
F 3 "" H 7600 3000 50  0001 C CNN
	1    7600 3000
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 59FF9309
P 7800 3000
F 0 "R6" V 7880 3000 50  0000 C CNN
F 1 "4.7k" V 7800 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7730 3000 50  0001 C CNN
F 3 "" H 7800 3000 50  0001 C CNN
	1    7800 3000
	1    0    0    -1  
$EndComp
Text Label 8250 3350 2    60   ~ 0
I2C_SDA
Text Label 8250 3200 2    60   ~ 0
I2C_SCL
$Comp
L Q_PMOS_GSD Q2
U 1 1 59FF9CBF
P 7750 1400
F 0 "Q2" H 7950 1450 50  0000 L CNN
F 1 "PMV250EPEAR" H 7950 1350 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 7950 1500 50  0001 C CNN
F 3 "" H 7750 1400 50  0001 C CNN
	1    7750 1400
	0    1    -1   0   
$EndComp
$Comp
L R R2
U 1 1 59FF9E0A
P 7400 1450
F 0 "R2" V 7480 1450 50  0000 C CNN
F 1 "18k7" V 7400 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7330 1450 50  0001 C CNN
F 3 "" H 7400 1450 50  0001 C CNN
	1    7400 1450
	1    0    0    -1  
$EndComp
Text Label 7100 1800 0    60   ~ 0
SENSORS_ENn
Text Label 9050 1300 2    60   ~ 0
3V3_SENSORS
$Comp
L +3.3V #PWR012
U 1 1 59FF9EDE
P 7400 1200
F 0 "#PWR012" H 7400 1050 50  0001 C CNN
F 1 "+3.3V" H 7400 1340 50  0000 C CNN
F 2 "" H 7400 1200 50  0001 C CNN
F 3 "" H 7400 1200 50  0001 C CNN
	1    7400 1200
	1    0    0    -1  
$EndComp
$Comp
L TEST TP2
U 1 1 59FFB685
P 7250 3200
F 0 "TP2" H 7250 3500 50  0000 C BNN
F 1 "TEST" H 7250 3450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch1.27mm" H 7250 3200 50  0001 C CNN
F 3 "" H 7250 3200 50  0001 C CNN
	1    7250 3200
	1    0    0    -1  
$EndComp
$Comp
L TEST TP1
U 1 1 59FFB782
P 7050 3350
F 0 "TP1" H 7050 3650 50  0000 C BNN
F 1 "TEST" H 7050 3600 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch1.27mm" H 7050 3350 50  0001 C CNN
F 3 "" H 7050 3350 50  0001 C CNN
	1    7050 3350
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NC_Small JP2
U 1 1 59FFBC93
P 8200 1300
F 0 "JP2" H 8200 1380 50  0000 C CNN
F 1 "I_SENSE" H 8210 1240 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch1.27mm" H 8200 1300 50  0001 C CNN
F 3 "" H 8200 1300 50  0001 C CNN
	1    8200 1300
	1    0    0    -1  
$EndComp
Text Label 9450 2950 0    60   ~ 0
I2C_SCL
Text Label 9450 3050 0    60   ~ 0
I2C_SDA
Text Label 9450 2850 0    60   ~ 0
3V3_SENSORS
$Comp
L GND #PWR013
U 1 1 59FFCB11
P 9750 3250
F 0 "#PWR013" H 9750 3000 50  0001 C CNN
F 1 "GND" H 9750 3100 50  0000 C CNN
F 2 "" H 9750 3250 50  0001 C CNN
F 3 "" H 9750 3250 50  0001 C CNN
	1    9750 3250
	1    0    0    -1  
$EndComp
Text Label 9450 3150 0    60   ~ 0
TOF_GPIO0
$Comp
L Conn_01x05 J4
U 1 1 59FFCFC3
P 10300 3050
F 0 "J4" H 10300 3350 50  0000 C CNN
F 1 "TOF_DIST_SENS" H 10300 2750 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x05_Pitch2.00mm" H 10300 3050 50  0001 C CNN
F 3 "" H 10300 3050 50  0001 C CNN
	1    10300 3050
	1    0    0    -1  
$EndComp
Text Notes 9750 3700 0    60   ~ 0
address:\n0x29 (7bit)
$Comp
L Motor_DC M1
U 1 1 59FFE87B
P 6100 1500
F 0 "M1" H 6200 1600 50  0000 L CNN
F 1 "DC_WATER_PUMP" H 6200 1300 50  0000 L TNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 6100 1410 50  0001 C CNN
F 3 "" H 6100 1410 50  0001 C CNN
	1    6100 1500
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW2
U 1 1 59FFEBE6
P 7050 5950
F 0 "SW2" H 7100 6050 50  0000 L CNN
F 1 "RESET" H 7050 5890 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVQPE1" H 7050 6150 50  0001 C CNN
F 3 "" H 7050 6150 50  0001 C CNN
	1    7050 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 59FFEDAC
P 6700 5950
F 0 "#PWR014" H 6700 5700 50  0001 C CNN
F 1 "GND" H 6700 5800 50  0000 C CNN
F 2 "" H 6700 5950 50  0001 C CNN
F 3 "" H 6700 5950 50  0001 C CNN
	1    6700 5950
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 59FFF00E
P 7000 5050
F 0 "SW1" H 7050 5150 50  0000 L CNN
F 1 "PROG" H 7000 4990 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVQPE1" H 7000 5250 50  0001 C CNN
F 3 "" H 7000 5250 50  0001 C CNN
	1    7000 5050
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 59FFF271
P 7450 4900
F 0 "R3" V 7530 4900 50  0000 C CNN
F 1 "10k" V 7450 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7380 4900 50  0001 C CNN
F 3 "" H 7450 4900 50  0001 C CNN
	1    7450 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 59FFF2F8
P 7450 4750
F 0 "#PWR015" H 7450 4600 50  0001 C CNN
F 1 "+3.3V" H 7450 4890 50  0000 C CNN
F 2 "" H 7450 4750 50  0001 C CNN
F 3 "" H 7450 4750 50  0001 C CNN
	1    7450 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 59FFF399
P 6700 5050
F 0 "#PWR016" H 6700 4800 50  0001 C CNN
F 1 "GND" H 6700 4900 50  0000 C CNN
F 2 "" H 6700 5050 50  0001 C CNN
F 3 "" H 6700 5050 50  0001 C CNN
	1    6700 5050
	1    0    0    -1  
$EndComp
Text Label 8150 5050 2    60   ~ 0
GPIO0
$Comp
L Conn_01x03 J3
U 1 1 5A044983
P 10300 2150
F 0 "J3" H 10300 2350 50  0000 C CNN
F 1 "HUMIDITY_CONN" H 10300 1950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x03_Pitch2.00mm" H 10300 2150 50  0001 C CNN
F 3 "" H 10300 2150 50  0001 C CNN
	1    10300 2150
	1    0    0    -1  
$EndComp
$Comp
L TEST TP3
U 1 1 5A0459F4
P 7700 5050
F 0 "TP3" H 7700 5350 50  0000 C BNN
F 1 "TEST" H 7700 5300 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch1.27mm" H 7700 5050 50  0001 C CNN
F 3 "" H 7700 5050 50  0001 C CNN
	1    7700 5050
	1    0    0    -1  
$EndComp
$Comp
L TEST TP4
U 1 1 5A045AFD
P 7700 5950
F 0 "TP4" H 7700 6250 50  0000 C BNN
F 1 "TEST" H 7700 6200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch1.27mm" H 7700 5950 50  0001 C CNN
F 3 "" H 7700 5950 50  0001 C CNN
	1    7700 5950
	1    0    0    -1  
$EndComp
$Comp
L S-5851A_SOT-23-6 U3
U 1 1 5A04710D
P 9750 5700
F 0 "U3" H 9450 6150 60  0000 C CNN
F 1 "S-5851A_SOT-23-6" H 9750 6050 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 9350 5950 60  0001 C CNN
F 3 "" H 9450 6050 60  0001 C CNN
	1    9750 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5A047373
P 9750 6200
F 0 "#PWR017" H 9750 5950 50  0001 C CNN
F 1 "GND" H 9750 6050 50  0000 C CNN
F 2 "" H 9750 6200 50  0001 C CNN
F 3 "" H 9750 6200 50  0001 C CNN
	1    9750 6200
	1    0    0    -1  
$EndComp
Text Label 9100 5150 0    60   ~ 0
3V3_SENSORS
Text Label 8650 5500 0    60   ~ 0
I2C_SCL
Text Label 8650 5600 0    60   ~ 0
I2C_SDA
$Comp
L GND #PWR018
U 1 1 5A047BEF
P 9200 5950
F 0 "#PWR018" H 9200 5700 50  0001 C CNN
F 1 "GND" H 9200 5800 50  0000 C CNN
F 2 "" H 9200 5950 50  0001 C CNN
F 3 "" H 9200 5950 50  0001 C CNN
	1    9200 5950
	1    0    0    -1  
$EndComp
Text Notes 10200 6350 0    60   ~ 0
Temperature sensor\naddress:\n0x48 (7bit)
Text Label 650  2050 0    60   ~ 0
V_BAT_SENSE
$Comp
L Conn_01x06 J2
U 1 1 5A0498AC
P 10300 4250
F 0 "J2" H 10300 4550 50  0000 C CNN
F 1 "PROG/DEBUG" H 10300 3850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06_Pitch2.00mm" H 10300 4250 50  0001 C CNN
F 3 "" H 10300 4250 50  0001 C CNN
	1    10300 4250
	1    0    0    -1  
$EndComp
Text Label 9650 4350 0    60   ~ 0
EN
Text Label 9650 4450 0    60   ~ 0
GPIO0
$Comp
L C C4
U 1 1 5A04A99A
P 10450 5300
F 0 "C4" H 10475 5400 50  0000 L CNN
F 1 "100nF" H 10475 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10488 5150 50  0001 C CNN
F 3 "" H 10450 5300 50  0001 C CNN
	1    10450 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5A04A9A0
P 10450 5450
F 0 "#PWR019" H 10450 5200 50  0001 C CNN
F 1 "GND" H 10450 5300 50  0000 C CNN
F 2 "" H 10450 5450 50  0001 C CNN
F 3 "" H 10450 5450 50  0001 C CNN
	1    10450 5450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x01 J7
U 1 1 5A046ABF
P 6000 7350
F 0 "J7" H 6000 7450 50  0000 C CNN
F 1 "M3" H 6000 7250 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 6000 7350 50  0001 C CNN
F 3 "" H 6000 7350 50  0001 C CNN
	1    6000 7350
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x01 J6
U 1 1 5A046B30
P 6300 7350
F 0 "J6" H 6300 7450 50  0000 C CNN
F 1 "M3" H 6300 7250 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 6300 7350 50  0001 C CNN
F 3 "" H 6300 7350 50  0001 C CNN
	1    6300 7350
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x01 J5
U 1 1 5A046BA2
P 6600 7350
F 0 "J5" H 6600 7450 50  0000 C CNN
F 1 "M3" H 6600 7250 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 6600 7350 50  0001 C CNN
F 3 "" H 6600 7350 50  0001 C CNN
	1    6600 7350
	0    -1   -1   0   
$EndComp
Text Notes 5600 7200 0    60   ~ 0
Mounting holes
$Comp
L Conn_01x01 J8
U 1 1 5A0469DA
P 5700 7350
F 0 "J8" H 5700 7450 50  0000 C CNN
F 1 "M3" H 5700 7250 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 5700 7350 50  0001 C CNN
F 3 "" H 5700 7350 50  0001 C CNN
	1    5700 7350
	0    -1   -1   0   
$EndComp
NoConn ~ 6600 7550
NoConn ~ 6300 7550
NoConn ~ 6000 7550
NoConn ~ 5700 7550
$Comp
L Conn_01x01 J1
U 1 1 5A049A8A
P 1450 2050
F 0 "J1" H 1450 2150 50  0000 C CNN
F 1 "V_BAT_1S" H 1450 1950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch2.54mm" H 1450 2050 50  0001 C CNN
F 3 "" H 1450 2050 50  0001 C CNN
	1    1450 2050
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A0B2274
P 4400 5850
F 0 "R7" V 4480 5850 50  0000 C CNN
F 1 "10k" V 4400 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4330 5850 50  0001 C CNN
F 3 "" H 4400 5850 50  0001 C CNN
	1    4400 5850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 5A0B237C
P 4400 6000
F 0 "#PWR020" H 4400 5750 50  0001 C CNN
F 1 "GND" H 4400 5850 50  0000 C CNN
F 2 "" H 4400 6000 50  0001 C CNN
F 3 "" H 4400 6000 50  0001 C CNN
	1    4400 6000
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5A0B332E
P 5100 4150
F 0 "R8" V 5180 4150 50  0000 C CNN
F 1 "470" V 5100 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5030 4150 50  0001 C CNN
F 3 "" H 5100 4150 50  0001 C CNN
	1    5100 4150
	0    -1   -1   0   
$EndComp
Text Notes 1550 4500 0    60   ~ 0
(ADC1_CH4)
Text Notes 1550 4600 0    60   ~ 0
(ADC1_CH5)
Text Notes 1550 4400 0    60   ~ 0
(ADC1_CH7)
Text Label 8350 4250 2    60   ~ 0
USER_BTN
$Comp
L SW_Push SW3
U 1 1 5A0B61BC
P 7000 4250
F 0 "SW3" H 7050 4350 50  0000 L CNN
F 1 "USR_BTN" H 7000 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 7000 4450 50  0001 C CNN
F 3 "" H 7000 4450 50  0001 C CNN
	1    7000 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 5A0B6247
P 6700 4250
F 0 "#PWR021" H 6700 4000 50  0001 C CNN
F 1 "GND" H 6700 4100 50  0000 C CNN
F 2 "" H 6700 4250 50  0001 C CNN
F 3 "" H 6700 4250 50  0001 C CNN
	1    6700 4250
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5A0B64BA
P 7400 4100
F 0 "R9" V 7480 4100 50  0000 C CNN
F 1 "10k" V 7400 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7330 4100 50  0001 C CNN
F 3 "" H 7400 4100 50  0001 C CNN
	1    7400 4100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR022
U 1 1 5A0B64C0
P 7400 3950
F 0 "#PWR022" H 7400 3800 50  0001 C CNN
F 1 "+3.3V" H 7400 4090 50  0000 C CNN
F 2 "" H 7400 3950 50  0001 C CNN
F 3 "" H 7400 3950 50  0001 C CNN
	1    7400 3950
	1    0    0    -1  
$EndComp
$Comp
L TEST TP5
U 1 1 5A0B64C6
P 7650 4250
F 0 "TP5" H 7650 4550 50  0000 C BNN
F 1 "TEST" H 7650 4500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x01_Pitch1.27mm" H 7650 4250 50  0001 C CNN
F 3 "" H 7650 4250 50  0001 C CNN
	1    7650 4250
	1    0    0    -1  
$EndComp
Text Label 9300 1200 0    60   ~ 0
3V3_SENSORS
$Comp
L GND #PWR023
U 1 1 5A0B9292
P 9800 1400
F 0 "#PWR023" H 9800 1150 50  0001 C CNN
F 1 "GND" H 9800 1250 50  0000 C CNN
F 2 "" H 9800 1400 50  0001 C CNN
F 3 "" H 9800 1400 50  0001 C CNN
	1    9800 1400
	1    0    0    -1  
$EndComp
Text Label 9300 1300 0    60   ~ 0
SENS_LUMINOSITY
$Comp
L Conn_01x03 J9
U 1 1 5A0B929C
P 10300 1300
F 0 "J9" H 10300 1500 50  0000 C CNN
F 1 "LUMINOSITY_CONN" H 10300 1100 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x03_Pitch2.00mm" H 10300 1300 50  0001 C CNN
F 3 "" H 10300 1300 50  0001 C CNN
	1    10300 1300
	1    0    0    -1  
$EndComp
$Comp
L AP7365-XXEG_SOT223 U1
U 1 1 5A0DAEAA
P 2300 1150
F 0 "U1" H 2150 1450 60  0000 C CNN
F 1 "AP7365-XXEG_SOT223" H 2300 1350 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 2300 1150 60  0001 C CNN
F 3 "" H 2300 1150 60  0001 C CNN
	1    2300 1150
	1    0    0    -1  
$EndComp
$Comp
L ESP-32S U2
U 1 1 5A131A94
P 3950 4500
F 0 "U2" H 3250 5750 60  0000 C CNN
F 1 "ESP-32S" H 4450 5750 60  0000 C CNN
F 2 "ESP32-footprints-Lib:ESP-32S" H 4300 5850 60  0001 C CNN
F 3 "" H 3500 4950 60  0001 C CNN
	1    3950 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 5A13452E
P 2900 3700
F 0 "#PWR024" H 2900 3450 50  0001 C CNN
F 1 "GND" H 2900 3550 50  0000 C CNN
F 2 "" H 2900 3700 50  0001 C CNN
F 3 "" H 2900 3700 50  0001 C CNN
	1    2900 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 5A1349E5
P 5000 3750
F 0 "#PWR025" H 5000 3500 50  0001 C CNN
F 1 "GND" H 5000 3600 50  0000 C CNN
F 2 "" H 5000 3750 50  0001 C CNN
F 3 "" H 5000 3750 50  0001 C CNN
	1    5000 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 5A134A6B
P 3500 5700
F 0 "#PWR026" H 3500 5450 50  0001 C CNN
F 1 "GND" H 3500 5550 50  0000 C CNN
F 2 "" H 3500 5700 50  0001 C CNN
F 3 "" H 3500 5700 50  0001 C CNN
	1    3500 5700
	1    0    0    -1  
$EndComp
Text Label 5700 4150 2    60   ~ 0
UART_TX
Text Label 5700 4250 2    60   ~ 0
UART_RX
Text Label 5700 4550 2    60   ~ 0
I2C_SCL
Text Label 5700 4650 2    60   ~ 0
I2C_SDA
Text Label 5700 5150 2    60   ~ 0
GPIO0
Text Label 2150 4000 0    60   ~ 0
EN
Text Label 2150 4400 0    60   ~ 0
V_BAT_SENSE
Text Label 2150 4500 0    60   ~ 0
SENS_HUMIDITY
Text Label 2150 4600 0    60   ~ 0
SENS_LUMINOSITY
Text Label 2150 4700 0    60   ~ 0
USER_BTN
Text Label 2150 5100 0    60   ~ 0
SENSOR_ENn
$Comp
L GND #PWR027
U 1 1 5A1466C8
P 5300 1850
F 0 "#PWR027" H 5300 1600 50  0001 C CNN
F 1 "GND" H 5300 1700 50  0000 C CNN
F 2 "" H 5300 1850 50  0001 C CNN
F 3 "" H 5300 1850 50  0001 C CNN
	1    5300 1850
	1    0    0    -1  
$EndComp
Text Label 3900 1400 0    60   ~ 0
PUMP_PWM
$Comp
L BD6211F-E2 U4
U 1 1 5A1427AC
P 5300 1400
F 0 "U4" H 4950 1650 60  0000 C CNN
F 1 "BD6211F-E2" H 5650 1650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5300 1400 60  0001 C CNN
F 3 "" H 5300 1400 60  0001 C CNN
	1    5300 1400
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5A149BA4
P 4250 900
F 0 "C5" H 4275 1000 50  0000 L CNN
F 1 "10uF" H 4275 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4288 750 50  0001 C CNN
F 3 "" H 4250 900 50  0001 C CNN
	1    4250 900 
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A15241F
P 4450 1550
F 0 "R10" V 4530 1550 50  0000 C CNN
F 1 "10k" V 4450 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4380 1550 50  0001 C CNN
F 3 "" H 4450 1550 50  0001 C CNN
	1    4450 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 5A152985
P 4450 1700
F 0 "#PWR028" H 4450 1450 50  0001 C CNN
F 1 "GND" H 4450 1550 50  0000 C CNN
F 2 "" H 4450 1700 50  0001 C CNN
F 3 "" H 4450 1700 50  0001 C CNN
	1    4450 1700
	1    0    0    -1  
$EndComp
Text Label 2150 4900 0    60   ~ 0
PUMP_PWM
$Comp
L +BATT #PWR029
U 1 1 5A16E00E
P 1100 1150
F 0 "#PWR029" H 1100 1000 50  0001 C CNN
F 1 "+BATT" H 1100 1290 50  0000 C CNN
F 2 "" H 1100 1150 50  0001 C CNN
F 3 "" H 1100 1150 50  0001 C CNN
	1    1100 1150
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR030
U 1 1 5A16E170
P 4700 1300
F 0 "#PWR030" H 4700 1150 50  0001 C CNN
F 1 "+BATT" H 4700 1440 50  0000 C CNN
F 2 "" H 4700 1300 50  0001 C CNN
F 3 "" H 4700 1300 50  0001 C CNN
	1    4700 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 5A170467
P 4700 1500
F 0 "#PWR031" H 4700 1250 50  0001 C CNN
F 1 "GND" H 4700 1350 50  0000 C CNN
F 2 "" H 4700 1500 50  0001 C CNN
F 3 "" H 4700 1500 50  0001 C CNN
	1    4700 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 5A170881
P 4250 1050
F 0 "#PWR032" H 4250 800 50  0001 C CNN
F 1 "GND" H 4250 900 50  0000 C CNN
F 2 "" H 4250 1050 50  0001 C CNN
F 3 "" H 4250 1050 50  0001 C CNN
	1    4250 1050
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR033
U 1 1 5A171B63
P 4250 750
F 0 "#PWR033" H 4250 600 50  0001 C CNN
F 1 "+BATT" H 4250 890 50  0000 C CNN
F 2 "" H 4250 750 50  0001 C CNN
F 3 "" H 4250 750 50  0001 C CNN
	1    4250 750 
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR034
U 1 1 5A1726A8
P 5300 900
F 0 "#PWR034" H 5300 750 50  0001 C CNN
F 1 "+BATT" H 5300 1040 50  0000 C CNN
F 2 "" H 5300 900 50  0001 C CNN
F 3 "" H 5300 900 50  0001 C CNN
	1    5300 900 
	1    0    0    -1  
$EndComp
$Comp
L LED_Dual_ACA D1
U 1 1 5A17423B
P 2200 6500
F 0 "D1" H 2200 6725 50  0000 C CNN
F 1 "LED_Dual_ACA" H 2200 6250 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm-3" H 2200 6500 50  0001 C CNN
F 3 "" H 2200 6500 50  0001 C CNN
	1    2200 6500
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5A17451E
P 2650 6600
F 0 "R11" V 2730 6600 50  0000 C CNN
F 1 "470" V 2650 6600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2580 6600 50  0001 C CNN
F 3 "" H 2650 6600 50  0001 C CNN
	1    2650 6600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1100 1150 1450 1150
Wire Wire Line
	1650 1150 2000 1150
Connection ~ 1850 1150
Connection ~ 2750 1150
Connection ~ 2300 1450
Wire Wire Line
	1850 1450 2750 1450
Wire Wire Line
	2300 1550 2300 1450
Wire Wire Line
	2600 1150 2950 1150
Wire Wire Line
	7450 5850 7450 5950
Wire Wire Line
	7250 5950 8150 5950
Wire Wire Line
	9650 4150 10100 4150
Wire Wire Line
	9650 4250 10100 4250
Wire Wire Line
	9850 4550 10100 4550
Wire Wire Line
	9850 4050 10100 4050
Wire Wire Line
	9400 2050 10100 2050
Wire Wire Line
	9800 2250 10100 2250
Wire Wire Line
	9400 2150 10100 2150
Wire Wire Line
	7600 2850 7800 2850
Wire Wire Line
	7700 2850 7700 2650
Wire Wire Line
	7700 2650 8300 2650
Connection ~ 7700 2850
Wire Wire Line
	7600 3150 7600 3350
Wire Wire Line
	7050 3350 8250 3350
Wire Wire Line
	7800 3150 7800 3200
Wire Wire Line
	7250 3200 8250 3200
Wire Wire Line
	7400 1200 7400 1300
Wire Wire Line
	7400 1300 7550 1300
Connection ~ 7400 1300
Wire Wire Line
	7400 1600 7750 1600
Wire Wire Line
	7750 1600 7750 1800
Connection ~ 7750 1600
Wire Wire Line
	7750 1800 7100 1800
Connection ~ 7800 3200
Connection ~ 7600 3350
Wire Wire Line
	9050 1300 8300 1300
Wire Wire Line
	8100 1300 7950 1300
Wire Wire Line
	9750 3250 10100 3250
Wire Wire Line
	10100 2850 9450 2850
Wire Wire Line
	9450 2950 10100 2950
Wire Wire Line
	10100 3050 9450 3050
Wire Wire Line
	10100 3150 9450 3150
Wire Wire Line
	6700 5950 6850 5950
Connection ~ 7450 5950
Wire Wire Line
	7200 5050 8150 5050
Wire Wire Line
	6700 5050 6800 5050
Connection ~ 7450 5050
Connection ~ 7700 5950
Connection ~ 7700 5050
Wire Wire Line
	9100 5150 10450 5150
Wire Wire Line
	9750 5150 9750 5200
Wire Wire Line
	8650 5500 9200 5500
Wire Wire Line
	9200 5600 8650 5600
Wire Wire Line
	9200 5800 9200 5950
Connection ~ 9200 5900
Wire Wire Line
	650  2050 1250 2050
Wire Wire Line
	9650 4350 10100 4350
Wire Wire Line
	9650 4450 10100 4450
Connection ~ 9750 5150
Wire Wire Line
	4400 5550 4400 5700
Wire Wire Line
	6700 4250 6800 4250
Wire Wire Line
	7200 4250 8350 4250
Connection ~ 7400 4250
Connection ~ 7650 4250
Wire Wire Line
	9300 1200 10100 1200
Wire Wire Line
	9800 1400 10100 1400
Wire Wire Line
	9300 1300 10100 1300
Wire Wire Line
	2700 3900 3000 3900
Wire Wire Line
	2150 4000 3000 4000
Wire Wire Line
	2150 4400 3000 4400
Wire Wire Line
	2150 4500 3000 4500
Wire Wire Line
	2150 4600 3000 4600
Wire Wire Line
	2150 4700 3000 4700
Wire Wire Line
	2150 4900 3000 4900
Wire Wire Line
	4850 4050 5700 4050
Wire Wire Line
	2150 5100 3000 5100
Wire Wire Line
	3500 5550 3500 5700
Wire Wire Line
	4850 3750 4850 3850
Wire Wire Line
	5000 3750 4850 3750
Wire Wire Line
	4850 5150 5700 5150
Wire Wire Line
	4850 4650 5700 4650
Wire Wire Line
	4850 4550 5700 4550
Wire Wire Line
	4850 4250 5700 4250
Wire Wire Line
	2700 3900 2700 3700
Wire Wire Line
	3000 3700 3000 3800
Wire Wire Line
	4850 4150 4950 4150
Wire Wire Line
	5250 4150 5700 4150
Connection ~ 4850 3750
Wire Wire Line
	3900 1400 4700 1400
Connection ~ 4450 1400
Wire Wire Line
	5900 1300 6100 1300
Wire Wire Line
	5900 1400 5900 1800
Wire Wire Line
	5900 1800 6100 1800
Wire Wire Line
	5200 1000 5300 1000
Wire Wire Line
	5300 1000 5300 900 
Wire Wire Line
	1750 6600 1750 6500
Wire Wire Line
	1750 6500 1900 6500
Text Label 3400 6400 2    60   ~ 0
LED_RED
Text Label 3400 6600 2    60   ~ 0
LED_GREEN
Wire Wire Line
	2800 6400 3400 6400
Wire Wire Line
	2800 6600 3400 6600
Text Label 5700 3950 2    60   ~ 0
LED_RED
Text Label 5700 4050 2    60   ~ 0
LED_GREEN
Wire Wire Line
	4850 3950 5700 3950
NoConn ~ 4850 4350
NoConn ~ 4850 4750
NoConn ~ 4850 4850
NoConn ~ 4850 4950
NoConn ~ 4850 5050
NoConn ~ 4300 5550
NoConn ~ 4200 5550
NoConn ~ 4100 5550
NoConn ~ 4000 5550
NoConn ~ 3900 5550
NoConn ~ 3800 5550
NoConn ~ 3700 5550
NoConn ~ 3600 5550
NoConn ~ 3000 4300
NoConn ~ 3000 4200
NoConn ~ 3000 4100
NoConn ~ 3000 4800
NoConn ~ 3000 5000
Wire Wire Line
	2900 3700 3000 3700
$EndSCHEMATC
