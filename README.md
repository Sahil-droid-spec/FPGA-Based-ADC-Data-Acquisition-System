# FPGA-Based ADC Data Acquisition System

A hardware-description Verilog implementation of a deterministic ADC data acquisition engine coupled with an onboard UART transmission module. Built and simulated using Icarus Verilog and GTKWave.

## Key Features
* **Finite State Machine (FSM):** Controls ADC sampling state sequence (`IDLE` -> `SAMPLE` -> `CONVERT` -> `HOLD` -> `OUTPUT`) for low-jitter, deterministic data capture.
* **Stream Communications:** Integrated custom UART Transmitter module to stream digitized 8-bit samples directly to a host interface.
* **Testbench Simulation:** Complete timing and functional verification using Icarus Verilog and GTKWave visual waveform analysis.
* **DSP Cross-Validation:** Captured simulated digital samples were cross-validated against an established MATLAB reference signal model.

## Tech Stack Used
* **Language:** Verilog HDL
* **Tools:** Icarus Verilog, GTKWave, MATLAB

A Verilog implementation of an ADC data acquisition engine with a UART transmitter. Built and simulated using Icarus Verilog.

## Files in this repository:
* **main.v**: The core Verilog design (FSM for ADC timing and UART serial transmitter).
* **test.v**: The testbench used to simulate a clock signal and verify the timing logic.

## Tech Stack
* **Language:** Verilog HDL
* **Tools:** Icarus Verilog, GTKWave
