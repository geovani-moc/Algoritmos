#include "cheker.hpp"

char *checkProperties(int **graph, int *certificate, int lenGraph, int lenCertificate)
{
    std::string answer = "Nenhuma das opcoes.\n";

    if (isWalk(graph, certificate, lenGraph, lenCertificate))
    {
        answer = "Passeio\n";
        if (certificate[0] == certificate[lenCertificate - 1])
        {
            answer += "Passeio Fechado\n";
        }

        if (isTrail(graph, certificate, lenGraph, lenCertificate))
        {
            answer.append("Trilha\n");
            if (certificate[0] == certificate[lenCertificate - 1])
            {
                answer += "Circuito\n";
            }

            if (isPath(graph, certificate, lenGraph, lenCertificate))
            {
                if (certificate[0] == certificate[lenCertificate - 1])
                {
                    answer += "Ciclo\n";
                }
                answer.append("Caminho\n");
            }
        }
    }

    char *finalAnswer = (char *)malloc((answer.size() + 1) * sizeof(char));
    std::strcpy(finalAnswer, answer.c_str());

    return finalAnswer;
}

bool isWalk(int **graph, int *certificate, int lenGraph, int lenCertificate)
{
    if (lenGraph < 2)
    {
        return false;
    }

    int u, v;

    for (int i = 0; i < lenCertificate - 1; i++)
    {
        u = certificate[i];
        v = certificate[i + 1];

        if (graph[u][v] == 0)
        {
            return false;
        }
    }
    return true;
}

bool isTrail(int **graph, int *certificate, int lenGraph, int lenCertificate)
{
    int **repeatedEdges = allocateMatrix(lenGraph);
    int u, v;

    for (int i = 0; i < lenCertificate - 1; i++)
    {
        u = certificate[i];
        v = certificate[i + 1];

        repeatedEdges[u][v]++;
        repeatedEdges[v][u]++;

        if (repeatedEdges[u][v] > 1)
        {
            return false;
        }
    }
    return true;
}

bool isPath(int **graph, int *certificate, int lenGraph, int lenCertificate)
{
    int lastPosition = lenCertificate - 1;
    if (certificate[0] == certificate[lastPosition])
    {
        lastPosition--;
    }

    int *repeatCounter = allocateArray(lenGraph);

    for (int i = 0; i <= lastPosition; i++)
    {
        repeatCounter[certificate[i]]++;
        if (repeatCounter[certificate[i]] > 1)
        {
            return false;
        }
    }
    return true;
}