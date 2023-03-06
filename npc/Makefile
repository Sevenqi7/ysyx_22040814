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

VSRC := ./vsrc
CSRC := ./csrc

VSRC_OBJ := ./vsrc/example.v
CSRC_OBJ := ./csrc/main.cpp

VERILATOR_INPUT = -f $(VSRC_OBJ) $(CSRC_OBJ)

#generate C++ code and excutable file
VERILATOR_FLAGS += -cc --exe

#optimisation
VERILATOR_FLAGS += -Os -x-assign 0

#print all warnings
VERILATOR_FLAGS += -Wall

#generate waveforms
VERILATOR_FLAGS += --trace

#auto build when verilating
VERILATOR_FLAGS += --build -y

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
#	@echo "Write this Makefile by your self."
	@echo "-- VERILATE ----------------"
	@echo "Verilating..."
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)
	@echo "Finish building and verilating."
	@echo "-- RUN ---------------------"
	./obj_dir/Vexample +trace
	@echo "-- DONE --------------------"

include ../Makefile
