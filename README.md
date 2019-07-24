# SensorStation Accessory Development Guide

## Overview

The SensorStation has 3 I2C expansion ports with keyed headers. This allows the user to connect a variety of accessories
to the SensorStation and expand its functionality by simply plugging it in. If a female keyed header is used, it will
be difficult to plug in backwards, potentially damaging the SensorStation or the accessory.

## Technical Details

Each I2C Expansion Port is connected to I2C bus 0 on the Raspberry Pi. This bus is typically hidden from the user on Raspberry Pi,
and is specifically enabled on the CTT release of SensorStation software. Because of this, some I2C software will have to be
adjusted to make use of smbus 0. The Raspberry Pi Hat EEPROM, which typically resides on bus 0, it not used.

There are 2K pullups to 3.3V on the I2C bus 0, installed on the SensorStation. These pullups are R20 and R25.

Each I2C Expansion Port has a dedicated Raspberry Pi GPIO, allowing for a chip select, interrupt or general GPIO function in addition to 
I2C, power and ground. It does not have to be used.



### Pinouts

| Pin | Purpose |
|-----|---------|
|  1  | 5V      |
|  2  | 3.3V    |
|  3  | GND     |
|  4  | SCL     |
|  5  | SDA     |
|  6  | GPIO/CS |
 
### GPIO Assignments

| I2C Port | GPIO (BCM) |
|----------|------------|
| J14      | GPIO41    |
| J15      | GPIO42    |
| J18      | GPIO43    |

## Suggested Design and Operation

Each accessory should make use of a keyed connector. Alternatively, it can be a standard female header. Note that orientation should be placed on the silkscreen if the non-keyed female header is used. If the GPIO/CS pin is used on a design that may possibly be plugged in backwards, the design should accept 5V on its GPIO/CS pin (the inverse). All other pins will be within specification, but will likely cause lockup of the I2C bus.

One challenge is also identifying which port an accessory is plugged into, in order to identify which GPIO/CS pin to use for the accessory. At this point in time, it must be configured manually by the user, or require connection to a specific slot, until a discovery circuit and technique can be implemented.

## BANK 1 GPIO Reference 

Some of the utilized GPIO pins have additional functions that can be assigned. The only extra function of interest will be PWM1, GPCLK1, and GPCLK2.

| I2C Port | GPIO Port | Available Functions |
|----------|-----------|---------------------|
| J14      | GPIO41    | GPIO / PWM1 / SPI2 MOSI / UART1 RX |
| J15      | GPIO42    | GPIO / GPCLK1 / SPI2 SCLK / UART1 RTS |
| J18      | GPIO43    | GPIO / GPCLK2 / SPI2 CE0 / UART1 CTS |

## Fun with PWM

You can utilize J14's PWM functionality to generate a wide variety of duty cycles and frequencies. In conjunction with a piezo speaker, you can use this to generate sound, for example.

## Fun with GPCLK

The GPCLK line stands for General Purpose Clock. You can use these two lines to generate a variety of clock signals. This may be useful when experimenting with software defined radio.

The following clock sources are available:

| Source | Frequency | Description |
|--------|-----------|-------------|
| 0 | 0 Hz | ground |
| 1 | 19.2MHz | oscillator |
| 2 | 0Hz | testdebug0 |
| 3 | 0Hz | testdebug1 |
| 4 | 0Hz | PLLA |
| 5 | 1000MHz | PLLC |
| 6 | 500MHz | PLLD |
| 7 | 216MHz | HDMI auxiliary |
| 8-15 | 0Hz | Ground |

You can use a clock divider to generate other frequencies. You can do this by SOURCE_FREQUENCY / (DIV_I + DIV_F / 4096). 

## Power Considerations

The 3V and 5V pins are directly connected to their associated regulators. Care should be taken to not draw an unreasonable amount of current
with these pins. 

The main 5V system regulator can supply up to 3 amps. However, this main system regulator supplies power to the Raspberry Pi, USB ports, as well
as the 4V (GSM modem), 3.3V and 1.8V regulators downstream. 

If too much power is utilized, it may cause system instability, or worse case, activation of the polyfuse (F1).

![Board View]{https://github.com/cellular-tracking-technologies/SensorStationAccessory_Template/blob/master/SensorStation_Accessory_PCB.png?raw=true}
