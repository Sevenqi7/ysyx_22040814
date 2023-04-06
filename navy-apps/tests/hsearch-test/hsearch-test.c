#include <stdio.h>
#include <stdlib.h>
#include <search.h>

#define TABLE_SIZE 5

int main()
{
    ENTRY item, *result;
    ENTRY table[TABLE_SIZE] = {0};
    hcreate(128);
    char *key = "hello";
    char *value = "world";

    // Insert key-value pair into the hash table
    item.key = key;
    item.data = value;
    hsearch(item, ENTER);

    // Search for the key in the hash table
    item.key = key;
    result = hsearch(item, FIND);

    // Check if the key was found
    if (result != NULL) {
        printf("Value for key '%s' is '%s'\n", result->key, (char*) result->data);
    } else {
        printf("Key not found\n");
    }

    return 0;
}
