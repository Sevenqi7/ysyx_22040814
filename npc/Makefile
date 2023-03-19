BUILD_DIR = ./build
VSRC = ./vsrc
CSRC = ./csrc

export PATH := $(PATH):$(abspath ./utils)

test:
	mill -i __.test

verilog:
	$(call git_commit, "generate verilog")
	mkdir -p $(BUILD_DIR)
	mill -i __.test.runMain Elaborate -td $(BUILD_DIR)
	cp $(shell find $(abspath $(BUILD_DIR)) -name "*.v") $(VSRC)
help:
	mill -i __.test.runMain Elaborate --help

compile:
	mill -i __.compile

bsp:
	mill -i mill.bsp.BSP/install

reformat:
	mill -i __.reformat

checkformat:
	mill -i __.checkFormat

clean:
	-rm -rf $(BUILD_DIR)

.PHONY: test verilog help compile bsp reformat checkformat clean

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

TOPNAME := top
# INC_PATH ?=

BUILD_DIR = ./build
OBJ_DIR := ./build/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

VSRC_OBJ := $(shell find $(abspath ./vsrc) -name "*.v")
CSRC_OBJ := $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

# INCFLAGS = $(addprefix -I, $(INC_PATH))
# CLFAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
# LDFLAGS += -lSDL2 -lSDL2_image
VERILATOR_FLAGS += -cc --exe -OS -MMD -x-assign 0 -j 6 --trace --build

$(BIN): $(VSRC_OBJ) $(CSRC_OBJ)

	$(VERILATOR) $(VERILATOR_FLAGS) $^ \
	--top-module $(TOPNAME) \
	--Mdir $(OBJ_DIR) -o $(abspath $(BIN))

run: $(BIN)
	$(abspath $(BIN))
	
sim: $(BIN)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	# @echo "Write this Makefile by yourself."
	@rm $(BIN)
	$(shell mkdir logs)
	@echo "-- VERILATE ----------------"
	@echo "Verilating..."
	$(BIN)
	@echo "Finish building and verilating."
	@echo "-- RUN ---------------------"
	./build/top +trace
	@echo "-- DONE --------------------"

include ../Makefile
