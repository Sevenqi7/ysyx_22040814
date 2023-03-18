#include <Vtop.h>

static Vtop dut;

int main() {
  dut.in1 = 1;
  dut.in2 = 0;
  while(1) {
    dut.eval();
  }
}

