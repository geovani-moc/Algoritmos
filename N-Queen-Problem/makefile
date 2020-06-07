all:
	g++ main.cpp checker.cpp generator.cpp utility.cpp -O3 -static -pedantic -Wall
	./a.out < in 1> out 2> error

debug:
	g++ main.cpp checker.cpp generator.cpp utility.cpp -g