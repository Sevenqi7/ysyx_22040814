#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <search.h>

typedef struct testdata{
    int a;
    int b;
    int c;
    int d;
}

int main()
{
    testdata *t = malloc(sizeof(testdata));
    t->a = 1, t->b = 2, t->c = 3, t->d = 4;
    ENTRY item;
    item.key = strdup("test");
    item.data = t;
    ENTRY ret = hsearch(item, ENTER);
    if(ret)
    {
        item test;
        test.key = "test";
        printf("test.key = %s\n", test.key);
        ENTRY again = hsearch(test, FIND);
        printf("testdata: %d %d %d %d\n", test.a, test.b, test.c, test.d);
    }
    else
        printf("error\n");
    return 0;
}
