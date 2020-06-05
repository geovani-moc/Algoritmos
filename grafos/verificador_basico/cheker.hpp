#ifndef CHECKER_HPP
#define CHECKER_HPP

#include "generator.hpp"
#include <string>
#include <cstring>

char *checkProperties(int **graph, int *certificate, int lenGraph, int lenCertificate);

bool isWalk(int **graph, int *certificate, int lenGraph, int lenCertificate);
bool isTrail(int **graph, int *certificate, int lenGraph, int lenCertificate);
bool isPath(int **graph, int *certificate, int lenGraph, int lenCertificate);

#endif