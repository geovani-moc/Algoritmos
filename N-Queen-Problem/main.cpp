#include <stdio.h>
#include <algorithm>

#include "checker.hpp"
#include "generator.hpp"
#include "utility.hpp"

int main()
{
    int size, sizeRead, countAnswer = 0;
    int **board;

    sizeRead = scanf("%d", &size);
    if (sizeRead < 1)
    {
        printf("Stdin error: %d/n", sizeRead);
    }

    int *permutation = generateArray(size);
    

    board = allocateMatrix(size);

    do
    {
        insertInBoard(board, permutation, size);
        if (checker(board, size))
        {
            printArray(permutation, size);
            printBoard(board, size);
            countAnswer++;
        }
        clearBoard(board, size);

    } while (std::next_permutation(permutation, permutation + size));

    printf("Quantity of answers: %d\n", countAnswer);

    free(board);

    return 0;
}
