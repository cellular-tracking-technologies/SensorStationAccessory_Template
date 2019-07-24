EESchema Schematic File Version 4
LIBS:SensorStation_Accessory_Template-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Female J1
U 1 1 5D04D3EA
P 2050 1950
F 0 "J1" H 2077 1926 50  0000 L CNN
F 1 "SensorStation Accessory Plug" H 2077 1835 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 2050 1950 50  0001 C CNN
F 3 "~" H 2050 1950 50  0001 C CNN
	1    2050 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5D04D4CF
P 1150 1950
F 0 "#PWR0101" H 1150 1700 50  0001 C CNN
F 1 "GND" V 1155 1822 50  0000 R CNN
F 2 "" H 1150 1950 50  0001 C CNN
F 3 "" H 1150 1950 50  0001 C CNN
	1    1150 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 1950 1850 1950
$Comp
L power:+5V #PWR0102
U 1 1 5D04D65E
P 1600 1550
F 0 "#PWR0102" H 1600 1400 50  0001 C CNN
F 1 "+5V" H 1615 1723 50  0000 C CNN
F 2 "" H 1600 1550 50  0001 C CNN
F 3 "" H 1600 1550 50  0001 C CNN
	1    1600 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1550 1600 1750
Wire Wire Line
	1600 1750 1850 1750
$Comp
L power:+3.3V #PWR0103
U 1 1 5D04D7CC
P 1200 1550
F 0 "#PWR0103" H 1200 1400 50  0001 C CNN
F 1 "+3.3V" H 1215 1723 50  0000 C CNN
F 2 "" H 1200 1550 50  0001 C CNN
F 3 "" H 1200 1550 50  0001 C CNN
	1    1200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1550 1200 1850
Wire Wire Line
	1200 1850 1850 1850
Text GLabel 1850 2150 0    50   Input ~ 0
SDA
Text GLabel 1850 2050 0    50   Input ~ 0
SCL
Text GLabel 1850 2250 0    50   Input ~ 0
CS
Text Notes 700  1100 0    118  ~ 0
Do not change\nSensorStation Accessory\nPort Pinout
Wire Notes Line
	550  2450 3400 2450
Text Notes 600  3450 0    59   ~ 0
Description: SCL and SDA are I2C serial lines. Pullups\nexists on the SensorStation board. The "CS" pin is a \ngeneric, dedicated GPIO from the Raspberry Pi that can \nbe used to enable the device, work as a chip select, or\nperform a function, such as PWM. Both 3.3V and 5V are\navailable to the accessory and are directly connected to\nthe main power bus. No current limiting, other than the \nmain SensorStation polyfuse, is implemented. For more\ndetails, please see the SensorStation Accessory\ndocumentation.
Wire Notes Line
	500  3500 3400 3500
Wire Notes Line
	3400 500  3400 3500
$EndSCHEMATC
