#include "checker.hpp"

bool checker(int **board, int size)
{
    bool mainDiagonal = checkMainDiagonal(board, size);
    bool secondaryDiagonal = checkSecondaryDiagonal(board, size);

    return (mainDiagonal && secondaryDiagonal);
}

bool checkMainDiagonal(int **board, int size)
{
    int count;
    for (int i = 0; i < size; i++)
    {
        count = 0;
        for (int j = 0; (j + i) < size; j++)
        {
            if (board[j][j + i])
            {
                count++;
            }
        }
        if (count > 1)
        {
            return false;
        }
    }

    for (int i = 1; i < size; i++)
    {
        count = 0;
        for (int j = 0; (j + i) < size; j++)
        {
            if (board[i + j][j])
            {
                count++;
            }
        }
        if (count > 1)
        {
            return false;
        }
    }

    return true;
}

bool checkSecondaryDiagonal(int **board, int size)
{
    int count;
    for (int i = 0; i < size; i++)
    {
        count = 0;
        for (int j = i, k = 0; j >= 0; j--, k++)
        {
            if (board[j][k])
            {
                count++;
            }
        }
        if (count > 1)
        {
            return false;
        }
    }

    for (int i = 1; i < size; i++)
    {
        count = 0;
        for (int j = (size-1), k = i; k < size; j--, k++)
        {
            if (board[j][k])
            {
                count++;
            }
        }
        if (count > 1)
        {
            return false;
        }
    }

    return true;
}