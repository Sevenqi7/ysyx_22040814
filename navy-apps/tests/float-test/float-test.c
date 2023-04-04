#include <stdio.h>
#include <assert.h>
#include <sys/time.h>
#include <fixedptc.h>

int main()
{
    char str_buf[255];
    fixedpt a = fixedpt_rconst(1.2);
    pritnf("%s\n", fixedpt_str(fixedpt_floot(a), str_buf, -1));
    return 0;
}
