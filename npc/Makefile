all:
	@echo "Write this Makefile by your self."

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

TOPNAME := top

# OBJ_DIR := ./obj_dir
VSRC_OBJ := $(shell find $(abspath ./vsrc) -name "*.v")
CSRC_OBJ := $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

VERILATOR_INPUT = -f $(VSRC_OBJ) $(CSRC_OBJ)

VERILATOR_FLAGS += -cc --exe -OS -x-assign 0 -Wall --trace --build -y

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
#	@echo "Write this Makefile by your self."
	@rm -rf $(OBJ_DIR)
	$(shell mkdir logs)
	@echo "-- VERILATE ----------------"
	@echo "Verilating..."
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)
	@echo "Finish building and verilating."
	@echo "-- RUN ---------------------"
	./obj_dir/Vtop +trace
	@echo "-- DONE --------------------"

include ../Makefile
