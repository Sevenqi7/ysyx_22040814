#include <stdio.h>
#include <assert.h>
#include <sys/time.h>
#include <fixedptc.h>

int main()
{
    char str_buf[255];
    fixedpt a = fixedpt_rconst(1.2);
    fixedpt_str(fixedpt_floor(a), str_buf, -1);
    printf("%s\n", str_buf);
    return 0;
}
