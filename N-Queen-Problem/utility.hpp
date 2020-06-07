#ifndef UTILITY_HPP
#define UTILITY_HPP

#include <stdlib.h>
#include <stdio.h>

void printArray(int *array, int size);
void printBoard(int **board, int size);
int **position2board(int *position, int size);
void insertInBoard(int **board, int *position, int size);
void clearBoard(int **board, int size);
int **allocateMatrix(int size);
void printMatrix(int **matrix, int size);

#endif
