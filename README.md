# uart-uvm-hwassist Hardware-Assisted Verification Project

One-line: A complete UVM verification project for a synthesizable UART peripheral, including a UVM environment, register model (UVM_REG), coverage, scoreboard, a DPI-C stub for hardware-assisted testcases, simulation scripts, and CI-ready.

## Quick start (Questa)
```
cd sim
./run_questa.sh
```

## Quick start (VCS)
```
cd sim
./run_vcs.sh
```

The repo contains a small, intentionally-simplified UART RTL and a modular UVM testbench with drivers/monitors/sequences/scoreboard, plus a DPI-C skeleton in hw_assist/dpi/transactor.c.

License: MIT

### Written by Bunnys
