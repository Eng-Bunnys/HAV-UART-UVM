.PHONY: all zip
all:
	@echo "Build and simulation are done via sim/run_*.sh scripts."

zip:
	zip -r uart-uvm-hwassist.zip .
