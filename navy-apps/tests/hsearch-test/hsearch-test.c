#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <search.h>

typedef struct testdata{
    int a;
    int b;
    int c;
    int d;
}testdata;

int main()
{
    testdata *t = malloc(sizeof(testdata));
    t->a = 1, t->b = 2, t->c = 3, t->d = 4;
    ENTRY item;
    item.key = "test";
    item.data = t;
    printf("start test\n");
    ENTRY *ret = hsearch(item, ENTER);
    if(ret)
    {
        ENTRY test;
        test.key = "test";
        printf("test.key = %s\n", test.key);
        ENTRY *again = hsearch(test, FIND);
        testdata *sb = (testdata *)test.data;
        printf("testdata: %d %d %d %d\n", sb->a, sb->b, sb->c, sb->d);
    }
    else
        printf("error\n");
    return 0;
}
