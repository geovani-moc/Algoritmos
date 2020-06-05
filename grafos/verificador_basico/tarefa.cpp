#include <stdio.h>
#include "cheker.hpp"
#include "generator.hpp"

int main()
{
    int quantityEdges, lenGraph, lenCertificate;

    scanf("%d", &lenGraph);
    scanf("%d", &quantityEdges);
    int **graph = generateGraph(lenGraph, quantityEdges);

    //printGraph(graph, lenGraph);

    scanf("%d", &lenCertificate);
    int *certificate = generateCertificate(lenCertificate);

    char *answer = checkProperties(graph, certificate, lenGraph, lenCertificate);

    printf("O grafo tem a(s) seguinte(s) propriedades:\n%s", answer);
}