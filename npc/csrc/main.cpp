#include <memory>
#include "Vtop.h"
#include <verilated.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main(int argc, char** argv, char** env) {
  printf("Hello, ysyx!\n");
  int times = 10;

    // Using unique_ptr is similar to
    // "VerilatedContext* contextp = new VerilatedContext" then deleting at end.
  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};

    // Set debug level, 0 is off, 9 is highest presently used
    // May be overridden by commandArgs argument parsing
  contextp->debug(0);

    // Randomization reset policy
    // May be overridden by commandArgs argument parsing
  contextp->randReset(2);

    // Verilator must compute traced signals
  contextp->traceEverOn(true);

    // Pass arguments so Verilated code can see them, e.g. $value$plusargs
    // This needs to be called before you create any model
  contextp->commandArgs(argc, argv);

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v".
    // Using unique_ptr is similar to "Vtop* top = new Vtop" then deleting at end.
    // "TOP" will be the hierarchical name of the module.
  const std::unique_ptr<Vtop> top{new Vtop{contextp.get(), "TOP"}};

  while (times--) {
      int a = rand() & 1;
      int b = rand() & 1;
      top->a = a;
      top->b = b;
      top->eval();
      printf("a = %d, b = %d, f = %d\n", a, b, top->f);
//       contextp->timeInc(1);
      assert(top->f == (a ^ b));
  }
  return 0;
}
