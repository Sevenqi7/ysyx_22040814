#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>
#include <search.h>

#define TABLE_SIZE 5

typedef struct tagSpritePart
{
  unsigned short usWidth;
  unsigned short usHeight;
  unsigned short X, Y;
  int hasAlpha;
} SpritePart_t;

int main()
{
    ENTRY item, *result, test;
    hcreate(512);
    FILE *fp = fopen("/share/games/bird/atlas.txt", "r");
    //FILE *fp = fopen("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/navy-apps/apps/bird/repo/res/atlas.txt", "r");
    if (fp == NULL)
        {
        return false;
        }

    while (!feof(fp))
        {
        char name[256];
        int w, h, x, y;

        if (fscanf(fp, "%s %d %d %d %d", name, &w, &h, &x, &y) != 5)
        {
        continue;
        }
        //printf("name:%s w:%d h:%d x:%d y:%d\n", name, w, h, x, y);
        SpritePart_t *spritePart = (SpritePart_t *)malloc(sizeof(SpritePart_t));

        spritePart->usWidth = w;
        spritePart->usHeight = h;
        spritePart->X = x;
        spritePart->Y = y;

        spritePart->hasAlpha = 0;

        item.key = strdup(name);
        item.data = spritePart;
        printf("Enter key:%s data:%d %d %d %d\n",item.key, spritePart->usWidth, spritePart->usHeight, spritePart->X, spritePart->Y);
        ENTRY *ret = hsearch(item, ENTER);
        test.key = strdup(name);
        ret = hsearch(test, FIND);
        spritePart = (SpritePart_t *)ret->data;
        printf("Find key:%s data:%d %d %d %d\n",test.key, spritePart->usWidth, spritePart->usHeight, spritePart->X, spritePart->Y);
        assert(ret != NULL);
        }

    fclose(fp);

    return 0;
}
