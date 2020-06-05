<h1>O algoritmo mostra se o grafo (matriz de adjacência) tem as seguintes propriedades:</h1>
<ul>

<li>Passeio</li>
<li>Passeio Fechado</li>
<li>Trilha</li>
<li>Caminho</li>
<li>Circuito</li>
<li>Ciclo</li>

</ul>

<h2> Descrição da entrada</h2>

<p>
6 -------> quantidade de vertices<br>
5 -------> quantidade de arestas<br>
0 1 |<br>
1 3 |<br>
1 4 |----> arestas (u, v)<br>
3 4 |<br>
4 5 |<br>
5 -------> quantidade de vertices no certificado<br>
0 |<br>
1 |<br>
3 |------> vertices no certificado<br>
4 |<br>
1 |<br>
 </p>
 
 <h2> Executar o código </h2>
 <p>make</p> 
 <p><b>ou</b></p>
 <p>
 g++ tarefa.cpp checker.cpp generator.cpp -static -std=c++11 -pedantic -Wall<br>
 ./a.out < in
 </p>
