#include "generator.hpp"

int *generateArray(int size)
{
    int *array = (int *)malloc(size * sizeof(int));
    
    if(array == NULL)
    {
        printf("Error allocation memory: no memory avalible. /n");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < size; i++)
    {
        array[i] = i;
    }

    return array;
}
