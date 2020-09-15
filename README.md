# fpga-iic-hygro-tester-2

FPGA IIC HYGRO Tester Version 2
by Timothy Stotts


## Description
A small FPGA project of different implementations for testing Temperature and Relative Humidity
readings of a I2C sensor.
The design targets the Digilent Inc. Zybo-Z7-20 FPGA development board containing a Xilinx Zynq-7000 APSoC (all programmable system on chip).
Three peripherals are used: Digilent Inc. Pmod HYGRO, Digilent Inc. Pmod CLS., Digilent Inc. Pmod SSD.

The design is contained in the folder older HYGRO-Tester-Design-Zynq.

The folder HYGRO-Tester-Design-Zynq contains a Xilinx Vivado IP Integrator plus
Xilinx SDK design. The first ARM A9 CPU is used to talk with board components,
a temperature and relative humidity sensor,
a 16x2 character LCD peripheral,
and a two-digit Seven Segment Display.
The FPGA peripherals are communicated with by an AXI subsystem design consisting of
interconnects and memory mappings using the Xilinx Vivado IP Integrator Block Design.

A Xilinx SDK project contains the hand-off from Xilinx Vivado of the hardware design,
and implements a very small Standalone program in C. From the Vivado hand-off, drivers
for the peripherals and board components such as switches, buttons, LEDs, and compiled
together with a Standalone C program in a total of 3 Xilinx SDK projects within a
single workspace. (SDK must be run with the Vivado hand-off specified, and then the other
two version-controlled projects imported into a workspace that is not version controlled.)

### Project information document:
```
./HYGRO Sensor Readings Tester - Zynq.pdf
```

[HYGRO Sensor Readings Tester - Zynq - info](https://github.com/timothystotts/fpga-iic-hygro-tester-2/blob/master/HYGRO%20Sensor%20Readings%20Tester%20-%20Zynq.pdf)
