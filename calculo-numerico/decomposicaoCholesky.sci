function x = decomposicaoCholesky(matriz, vetorTermosIndepedentes)
    l = chol(a);
    y = l' \ vetorTermosIndepedentes;
    x = l \ y;
endfunction