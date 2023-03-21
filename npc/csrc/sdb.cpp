// #include <memory>
// #include <verilated.h>
// #include "svdpi.h"
// #include "Vtop__Dpi.h"
// #include "Vtop.h"
// #include <stdio.h>
// #include <string.h>
// #include <stdlib.h>

// void cpu_exec(uint64_t)
// {
//     return ;
// }

// int cmd_help()
// {
//     return 0;
// }

// int cmd_c()
// {
//     return 0;
// }

// int cmd_q()
// {
//     return 0;
// }

// int cmd_si(char *args)
// {
//     int steps = args ? atoi((const char *)args) : 1;
//     return 0;
// }

// static struct {
//   const char *name;
//   const char *description;
//   int (*handler) (char *);
// } cmd_table [] = {
//   { "help", "Display information about all supported commands", cmd_help },
//   { "c", "Continue the execution of the program", cmd_c },
//   { "q", "Exit NPC", cmd_q },
//   { "si", "Step next N commands, 1 if N is not given", cmd_si}
// //   { "x", "Print the content of memory with a given address.", cmd_x},
// //   { "w", "Set watchpoint.", cmd_w},
// //   { "d", "Delete watchpoint.", cmd_d},
// //   IFDEF(CONFIG_FTRACE, { "ftrace", "Display function call trace.", cmd_ftrace},)
// //   { "info", "Print the content of register(-r) or watchpoing(-w).", cmd_info}

//   /* TODO: Add more commands */

// };

// #define ARRLEN(arr) (int)(sizeof(arr)) / sizeof(arr[0])
// #define NR_CMD ARRLEN(NR_CMD)

// void sdb_mainloop() {

//   for (char *str; (str = rl_gets()) != NULL; ) {
//     char *str_end = str + strlen(str);

//     /* extract the first token as the command */
//     char *cmd = strtok(str, " ");
//     if (cmd == NULL) { continue; }

//     /* treat the remaining string as the arguments,
//      * which may need further parsing
//      */
//     char *args = cmd + strlen(cmd) + 1;
//     if (args >= str_end) {
//       args = NULL;
//     }

//     int i;
//     for (i = 0; i < NR_CMD; i ++) {
//       if (strcmp(cmd, cmd_table[i].name) == 0) {
//         if (cmd_table[i].handler(args) < 0) { return; }
//         break;
//       }
//     }

//     if (i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
//   }
// }