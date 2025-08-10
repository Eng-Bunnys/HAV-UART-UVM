#!/bin/bash
set -e
# Simple Questa run script (requires Mentor Questa)
vlog -sv ../rtl/*.sv ../tb/*.sv ../tb/agent/*.sv ../tb/sequences/*.sv ../tb/scoreboard/*.sv ../tb/regmodel/*.sv
vsim -c -do "run -all; quit" tb_top
