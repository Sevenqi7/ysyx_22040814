#include <stdio.h>
#include <assert.h>
#include <sys/time.h>
#include <NDL.h>

int main()
{
    struct timeval tv;
    uint32_t last_ms, ms;
    int i=0;
    while(1)
    {
        last_ms = NDL_GetTicks();
        while(1)
        {
            ms = NDL_GetTicks();            
            // printf("ms:%lu\n", ms);
            if(ms - last_ms >= 500) break;
        }
        printf("0.5s Pass.\n");
        last_ms = ms;
    }
    return 0;
}
