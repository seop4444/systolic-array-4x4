# 4×4 Systolic Array (Verilog)

A simple 4×4 output-stationary systolic array implemented in Verilog.

This project is for practicing RTL design and understanding how data moves between processing elements in a systolic array.

## Design

- 4×4 array with 16 processing elements (PEs)
- Signed 8-bit inputs and 32-bit accumulators
- Each PE performs multiplication and accumulation
- Input A moves horizontally, and input B moves vertically
- Reset, enable, and accumulator clear signals


## Architecture

```mermaid
flowchart TB
    P00["PE 00"] --> P01["PE 01"]
    P01 --> P02["PE 02"]
    P02 --> P03["PE 03"]

    P10["PE 10"] --> P11["PE 11"]
    P11 --> P12["PE 12"]
    P12 --> P13["PE 13"]

    P20["PE 20"] --> P21["PE 21"]
    P21 --> P22["PE 22"]
    P22 --> P23["PE 23"]

    P30["PE 30"] --> P31["PE 31"]
    P31 --> P32["PE 32"]
    P32 --> P33["PE 33"]

    P00 --> P10
    P10 --> P20
    P20 --> P30

    P01 --> P11
    P11 --> P21
    P21 --> P31

    P02 --> P12
    P12 --> P22
    P22 --> P32

    P03 --> P13
    P13 --> P23
    P23 --> P33
```

- Horizontal: A data flow
- Vertical: B data flow


## Files

| File | Description |
|------|-------------|
| pe_os.v | Processing element |
| systolic_array_4x4.v | 4×4 array |
| tb_pe_os.v | PE testbench |
| tb_systolic_array_4x4.v | Array testbench |

## Verification

I used Vivado simulation to test the PE and the 4×4 array.

- PE: multiplication, accumulation, and accumulator reset
- Array: initial test using the output of PE(3,3)

The testbench currently checks only PE(3,3). Verification of all 16 outputs and complete matrix multiplication is still in progress.
