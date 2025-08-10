# Hardware-Assisted Verification – UART with UVM

**HAV UART UVM** is a hardware-assisted verification environment for a UART (Universal Asynchronous Receiver/Transmitter) using the **UVM (Universal Verification Methodology)** framework.  
The project demonstrates how FPGA acceleration can be leveraged to speed up simulation and enable large-scale regression testing.

---

##  Overview

This project showcases:

- A synthesizable UART DUT (Device Under Test)
- UVM-based testbench architecture for modular and reusable verification components
- Integration with a hardware acceleration backend for faster simulation (conceptual/emulated in this version)
- Example constrained-random stimulus and functional coverage collection
- Self-checking testbench with scoreboarding
- Basic FPGA mapping flow (for demonstration purposes)

---

## 🛠 Project Structure

```

uart-uvm-hwassist/
├── rtl/                 # UART synthesizable RTL
├── tb/                  # UVM Testbench
│   ├── agents/          # UART TX/RX agents
│   ├── env/             # UVM environment
│   ├── sequences/       # Stimulus generation
│   ├── scoreboard/      # Data checking and analysis
│   └── top\_tb.sv        # Testbench top-level
├── scripts/             # Build/run scripts
├── docs/                # Documentation and diagrams
└── Makefile             # Build automation

````

---

##  How to Run

### 1. Clone the Repository
```bash
git clone https://github.com/Eng-Bunnys/HAV-UART-UVM.git
cd HAV-UART-UVM
````

### 2. Build & Run Simulation

```bash
make sim
```

### 3. (Optional) Run Hardware-Assisted Mode

> This step requires access to supported FPGA acceleration hardware and tools.

```bash
make hwassist
```

---

## Features

* **UVM Agents** for UART TX and RX
* **Scoreboard** for self-checking results
* **Functional Coverage** models for UART protocol verification
* **Constrained-Random Testing** for thorough corner-case exploration
* Optional **Hardware Acceleration** support (conceptual for open-source)

---

##  Disclaimer

This project is provided **for educational and portfolio purposes only**.
It is **not intended for production use** or as a drop-in verification solution for commercial products.
The hardware-assisted verification aspects are **demonstrative**, in this repository, they are implemented in a simplified or emulated manner to illustrate methodology without requiring proprietary hardware.
I am not responsible for any damage caused to your hardware.

---

Developed by Bunnys as part of a hardware-assisted verification learning and demonstration project.
If you have feedback or suggestions, feel free to open an issue.
