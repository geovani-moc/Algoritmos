#include "utility.hpp"

void printArray(int *array, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("[%i] ", array[i]);
    }
    printf("\n");
}

int **position2board(int *position, int size)
{
    int **board = (int **)malloc(size * sizeof(int *));
    for (int i = 0; i < size; i++)
    {
        board[i] = (int *)calloc(size, sizeof(int));
    }

    for (int i = 0; i < size; i++)
    {
        board[i][position[i]] = 1;
    }

    return board;
}

void printBoard(int **board, int size)
{
    printf("╔");
    for (int i = 0; i < size - 1; i++)
    {
        {
            printf("═══╦");
        }
    }
    printf("═══╗\n");

    for (int i = 0; i < (size - 1); ++i)
    {
        for (int j = 0; j < size; ++j)
        {
            if (board[i][j])
            {
                printf("║ ■ ");
            }
            else
            {
                printf("║   ");
            }
        }
        printf("║\n╠");

        for (int a = 0; a < size - 1; a++)
        {
            printf("═══╬");
        }
        printf("═══╣\n");
    }

    for (int j = 0; j < size; ++j)
    {
        if (board[size - 1][j])
        {
            printf("║ ■ ");
        }
        else
        {
            printf("║   ");
        }
    }

    printf("║\n╚");

    for (int i = 0; i < size - 1; i++)
    {
        printf("═══╩");
    }
    printf("═══╝\n\n");
}

void clearBoard(int **board, int size)
{
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            board[i][j] = 0;
        }
    }
}

int **allocateMatrix(int size)
{
    int **matrix = (int **)malloc(size * sizeof(int*));

    if (matrix == NULL)
    {
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < size; i++)
    {
        matrix[i] = (int *) calloc (size, sizeof(int));
        if (matrix[i] == NULL)
        {
            fprintf(stderr, "Error: allocation memory.\n");
            exit(EXIT_FAILURE);
        }
    }

    return matrix;
}

void printMatrix(int **matrix, int size)
{
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            printf("[%d] ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void insertInBoard(int **board, int *position, int size)
{
    int line = 0;
    for (int i = 0; i < size; i++)
    {
        line = position[i];
        board[line][i] = 1;
    }
}