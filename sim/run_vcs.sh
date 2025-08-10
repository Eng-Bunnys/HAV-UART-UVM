#!/bin/bash
set -e
# Simple VCS run script (requires Synopsys VCS)
vcs -sverilog -f filelist.f -o simv
./simv +UVM_TESTNAME=uvm_test_top
