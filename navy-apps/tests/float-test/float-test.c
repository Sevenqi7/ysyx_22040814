#include <stdio.h>
#include <assert.h>
#include <sys/time.h>
#include <fixedptc.h>

int main()
{
    char str_buf[255];
    fixedpt a = fixedpt_rconst(1.22121), b = fixedpt_rconst(-0.42121);
    fixedpt_str(fixedpt_ceil(a), str_buf, -1);
    printf("%s\n", str_buf);
    fixedpt_str(fixedpt_ceil(b), str_buf, -1);
    printf("%s\n", str_buf);
    return 0;
}
