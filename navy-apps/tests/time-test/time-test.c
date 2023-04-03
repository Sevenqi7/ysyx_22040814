#include <stdio.h>
#include <assert.h>
#include <sys/time.h>

int main()
{
    struct timeval tv;
    uint64_t last_ms, ms;
    gettimeofday(&tv, NULL);
    while(1)
    {
        last_ms = tv.tv_sec * 1000 + tv.tv_usec / 1000000;
        while(gettimeofday(&tv, NULL))
        {
            ms = tv.tv_sec * 1000 + tv.tv_usec / 1000000;
            if(ms - last_ms >= 500) break;
        }
        printf("0.5s Pass.\n");
        last_ms = ms;
    }
    return 0;
}
