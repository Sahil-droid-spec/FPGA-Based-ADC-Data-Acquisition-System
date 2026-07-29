# FPGA-Based ADC Data Acquisition System

A hardware-description verilog implementation of a deterministic ADC data acquisition engine coupled with an onboard UART transmission module. Built and simulated using Icarus Verilog and GTKWave, with data cross-validation against MATLAB reference models.

## 🚀 Key Features

* **Finite State Machine (FSM):** Controls ADC sampling state sequence (`IDLE` -> `SAMPLE` -> `CONVERT` -> `HOLD` -> `OUTPUT`) for low-jitter, deterministic data capture.
* **Stream Communications:** Integrated custom 8-bit UART Transmitter module (8-N-1 format) to stream digitized 8-bit samples directly to a host interface.
* **Testbench Simulation:** Complete timing and functional verification using Icarus Verilog and GTKWave visual waveform analysis.
* **DSP Cross-Validation:** Captured simulated digital samples were exported and cross-validated against an established MATLAB reference signal model.

## 🏗️ RTL System Architecture
