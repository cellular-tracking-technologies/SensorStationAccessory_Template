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

## Power Considerations

The 3V and 5V pins are directly connected to their associated regulators. Care should be taken to not draw an unreasonable amount of current
with these pins. 

The main 5V system regulator can supply up to 3 amps. However, this main system regulator supplies power to the Raspberry Pi, USB ports, as well
as the 4V (GSM modem), 3.3V and 1.8V regulators downstream. 

If too much power is utilized, it may cause system instability, or worse case, activation of the polyfuse (F1).
