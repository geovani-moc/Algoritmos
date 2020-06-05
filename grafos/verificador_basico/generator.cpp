#include "generator.hpp"

int **generateGraph(int quantityVertices, int quantityEdges)
{
    int u, v;
    int **graph = allocateMatrix(quantityVertices);

    for (int i = 0; i < quantityEdges; i++)
    {
        scanf("%d %d", &u, &v);
        graph[u][v] = 1;
        graph[v][u] = 1;
    }
    return graph;
}

int *generateCertificate(int quantityVertices)
{
    int *vertices = allocateArray(quantityVertices);

    for (int i = 0; i < quantityVertices; i++)
    {
        scanf("%d", &vertices[i]);
    }
    return vertices;
}

int **allocateMatrix(int size)
{
    int **matrix = (int **)malloc(size * (sizeof(int *)));

    for (int i = 0; i < size; i++)
    {
        matrix[i] = (int *)calloc(size, sizeof(int));
    }
    return matrix;
}

int *allocateArray(int size)
{
    return (int *)calloc(size, sizeof(int));
}

void printGraph(int **graph, int len)
{
    for (int i = 0; i < len; i++)
    {
        for (int j = 0; j < len; j++)
        {
            printf("[%d] ", graph[i][j]);
        }
        printf("\n");
    }
}