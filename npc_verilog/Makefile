ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

default: all

TOPNAME := top
INC_PATH ?=

include ../nvboard/scripts/nvboard.mk

BUILD_DIR = ./build
OBJ_DIR := ./build/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

NXDC_FILES = ./top.nxdc
SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
VSRC_OBJ := $(shell find $(abspath ./vsrc) -name "*.v")
CSRC_OBJ := $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
CSRC_OBJ += $(SRC_AUTO_BIND)

# VERILATOR_INPUT = -f $(VSRC_OBJ) $(CSRC_OBJ)

INCFLAGS = $(addprefix -I, $(INC_PATH))
VERILATOR_FLAGS += -cc --exe -OS -MMD -x-assign 0 -j 6 --trace --build
CFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
LDFLAGS += -lSDL2 -lSDL2_image

$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

all: $(BIN)
#	@echo "Write this Makefile by your self."
	
	$(shell mkdir -p $(BUILD_DIR))
	@rm -rf $(OBJ_DIR)


$(BIN): $(VSRC_OBJ) $(CSRC_OBJ) $(NVBOARD_ARCHIVE)

	$(VERILATOR) $(VERILATOR_FLAGS) $^ \
	$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
	--top-module $(TOPNAME) \
	--Mdir $(OBJ_DIR) -o $(abspath $(BIN))

run: $(BIN)
	$(abspath $(BIN))

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
#	@echo "Write this Makefile by your self."
	@rm -rf $(OBJ_DIR)
	$(shell mkdir logs)
	@echo "-- VERILATE ----------------"
	@echo "Verilating..."
	$(BIN)
	@echo "Finish building and verilating."
	@echo "-- RUN ---------------------"
	./obj_dir/Vtop +trace
	@echo "-- DONE --------------------"

clean:
	rm -rf $(OBJ_DIR)
include ../Makefile
