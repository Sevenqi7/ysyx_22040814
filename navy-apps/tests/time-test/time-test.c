#include <stdio.h>
#include <assert.h>
#include <sys/time.h>

int main()
{
    struct timeval tv;
    uint64_t last_ms, ms;
    gettimeofday(&tv, NULL);
    float i = 0;
    while(1)
    {
        last_ms = tv.tv_sec * 1000 + tv.tv_usec / 1000;
        while(1)
        {
            gettimeofday(&tv, NULL);
            ms = tv.tv_sec * 1000 + tv.tv_usec / 1000;
            // printf("ms:%lu\n", ms);
            if(ms - last_ms >= 500) break;
        }
        printf("0.5s Pass, total time %fs\n", ++i * 0.5);
        last_ms = ms;
    }
    return 0;
}
