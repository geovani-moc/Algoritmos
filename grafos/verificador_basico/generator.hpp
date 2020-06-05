#ifndef GENERATOR_HPP
#define GENERATOR_HPP

#include <stdio.h>
#include <stdlib.h>

void printGraph(int** graph, int len);

int** generateGraph(int quantityVertices, int quantityEdges);
int* generateCertificate(int quantityVertices);

int** allocateMatrix(int size);
int* allocateArray(int size);

#endif