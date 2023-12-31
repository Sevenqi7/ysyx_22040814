BUILD_DIR = ./build
VSRC = $(abspath ./vsrc)
CSRC = $(abspath ./csrc)

export PATH := $(PATH):$(abspath ./utils)

test:
	mill -i __.test

verilog:
	$(call git_commit, "generate verilog")
	mkdir -p $(BUILD_DIR)
	mill -i __.test.runMain Elaborate -td $(BUILD_DIR)
	fish $(NPC_HOME)/handle.fish
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
	mkdir -p $(BUILD_DIR)

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
INC_PATH += $(abspath ./csrc/include)
IMG ?= 
ELF ?=

BUILD_DIR = ./build
OBJ_DIR := ./build/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

#difftest
DIFF_REF_SO = $(NEMU_HOME)/build/riscv64-nemu-interpreter-so

VSRC_OBJ := $(shell find $(abspath ./vsrc) -name "*.v")
CSRC_OBJ := $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

INCFLAGS = $(addprefix -I , $(INC_PATH))
CFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
CFLAGS += -I/usr/lib/llvm-14/include -std=c++14 -fno-exceptions -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -fPIE
LDFLAGS += -lreadline $(shell llvm-config --libs) -lSDL2
# LDFLAGS += -$(DIFF_REF_SO)
VERILATOR_FLAGS += -cc --exe -MMD -x-assign 0 -j 12 --trace --build


$(BIN): $(VSRC_OBJ) $(CSRC_OBJ)
	$(shell mkdir -p $(OBJ_DIR))
	$(VERILATOR) $(VERILATOR_FLAGS) $^ \
	$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS ,$(LDFLAGS)) \
	--top-module $(TOPNAME) \
	--Mdir $(OBJ_DIR) -o $(abspath $(BIN))

run: $(BIN)
	$(abspath $(BIN)) $(IMG) $(ELF) $(DIFF_REF_SO) 
	
sim: $(BIN)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	# @echo "Write this Makefile by yourself."
	@rm $(BIN)
	$(shell mkdir logs)
	@echo "-- VERILATE ----------------"
	@echo "Verilating..."
	$(MAKE) run 
	@echo "Finish building and verilating."
	@echo "-- RUN ---------------------"
	./build/top +trace
	@echo "-- DONE --------------------"

include ../Makefile
