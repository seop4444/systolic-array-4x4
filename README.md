# 4×4 Systolic Array (Verilog)

A simple 4×4 output-stationary systolic array implemented in Verilog.

This project is for practicing RTL design and understanding how data moves between processing elements in a systolic array.

## Design

- 4×4 array with 16 processing elements (PEs)
- Signed 8-bit inputs and 32-bit accumulators
- Each PE performs multiplication and accumulation
- Input A moves horizontally, and input B moves vertically
- Reset, enable, and accumulator clear signals

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


## Synthesis (Vivado 2025.1)

The 4×4 systolic array was successfully synthesized using Xilinx Vivado 2025.1.

**Target FPGA:** Xilinx Artix-7 (`xc7a35tcsg324-1`)

### Resource Utilization

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| Slice LUTs | 1,474 | 20,800 | 7.09% |
| Slice Registers (FFs) | 704 | 41,600 | 1.69% |
| DSP | 0 | 90 | 0.00% |
| Block RAM | 0 | 50 | 0.00% |
| Bonded IOB | 580 | 210 | 276.19% |

### Notes

- All 16 PEs were included in the synthesized design.
- Multiplication and accumulation logic was mapped to LUTs and carry chains (320 CARRY4 cells).
- No DSP blocks or Block RAM resources were used.
- The top-level array exposes 68 input bits and 512 output bits, exceeding the available I/O resources of the target device.
- Synthesis was completed successfully, but placement, routing, and timing verification have not yet been performed.

**Current status:** Synthesis completed. FPGA implementation requires redesigning the top-level I/O interface.
