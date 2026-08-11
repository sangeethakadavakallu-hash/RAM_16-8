# 16×8 RAM Design and Verification using Verilog HDL

## Overview

This project implements a **16×8 synchronous single-port RAM** using Verilog HDL.

The purpose of this project is to demonstrate the design, implementation, and verification of a basic RAM module. The project includes the RTL design, a Verilog testbench, simulation results, and waveform analysis.

## Features

* 16 memory locations
* 8-bit data width
* 4-bit address bus
* Synchronous operation
* Single-port RAM
* Write enable control
* Verilog HDL implementation
* Automated testbench
* VCD waveform generation
* Simulation using Icarus Verilog
* Waveform viewing using GTKWave

## RAM Specifications

| Parameter     | Value                   |
| ------------- | ----------------------- |
| Memory depth  | 16                      |
| Data width    | 8 bits                  |
| Address width | 4 bits                  |
| Total storage | 128 bits                |
| RAM type      | Single-port             |
| Clock         | Positive edge triggered |
| HDL           | Verilog                 |

## Block Diagram

```text
                 +----------------------+
                 |                      |
       clk ----->|                      |
        we ----->|                      |
      addr ----->|      16 × 8 RAM      |-----> dout
                 |                      |
       din ----->|                      |
                 |                      |
                 +----------------------+
```

## Ports

| Port   | Direction | Width | Description    |
| ------ | --------- | ----: | -------------- |
| `clk`  | Input     |     1 | Clock signal   |
| `we`   | Input     |     1 | Write enable   |
| `addr` | Input     |     4 | Memory address |
| `din`  | Input     |     8 | Data input     |
| `dout` | Output    |     8 | Data output    |

## Working Principle

The RAM contains 16 memory locations, with each location capable of storing 8 bits.

When `we` is high at the rising edge of `clk`, the value on `din` is stored at the memory location selected by `addr`.

When `we` is low, the selected memory location is read and its contents are presented at `dout` on the clock edge.

### Write operation

```text
WE   = 1
ADDR = 3
DIN  = A5

After the clock edge:

Memory[3] = A5
```

### Read operation

```text
WE   = 0
ADDR = 3

After the clock edge:

DOUT = A5
```

## Project Structure

```text
ram-verilog-project/
│
├── rtl/
│   └── ram_16x8.v
│
├── tb/
│   └── ram_16x8_tb.v
│
├── simulation/
│   └── README.md
│
├── waveform/
│   └── waveform.png
│
├── README.md
└── .gitignore
```

## Simulation

This project can be simulated using Icarus Verilog.

### Compile

```bash
iverilog -o ram_sim rtl/ram_16x8.v tb/ram_16x8_tb.v
```

### Run

```bash
vvp ram_sim
```

Expected output:

```text
PASS: Address 3 contains A5
PASS: Address 7 contains 5A
Simulation completed.
```

## Waveform

The testbench generates a VCD waveform file:

```text
ram_16x8.vcd
```

The waveform can be opened using GTKWave:

```bash
gtkwave ram_16x8.vcd
```

The important signals to observe are:

* `clk`
* `we`
* `addr`
* `din`
* `dout`

The waveform demonstrates both write and read operations.

## Verification

The testbench verifies the following:

1. Data `A5` is written to address `3`.
2. Data `5A` is written to address `7`.
3. Data at address `3` is read and compared with `A5`.
4. Data at address `7` is read and compared with `5A`.
5. The simulation reports PASS or FAIL for the read operations.

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## Learning Outcomes

This project demonstrates:

* RAM modeling in Verilog
* Use of Verilog arrays for memory
* Synchronous sequential logic
* Clock-driven read/write operations
* Testbench development
* Automated verification
* VCD waveform generation
* Simulation using open-source HDL tools
* GitHub project organization

## Future Improvements

The design can be extended by adding:

* Larger RAM capacity
* Reset functionality
* Separate read and write enables
* Dual-port RAM
* Byte enable
* Parameterized memory depth and data width
* More comprehensive test cases
* Randomized verification

## Author

**Your Name**

Verilog HDL RAM Design and Verification Project
