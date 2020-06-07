#ifndef CHECKER_HPP
#define CHECKER_HPP

#include <stdio.h>
#include <stdlib.h>

bool checker(int **board, int size);
bool checkMainDiagonal(int **board, int size);
bool checkSecondaryDiagonal(int **board, int size);

#endif