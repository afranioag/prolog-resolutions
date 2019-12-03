soma(Z,Y,S) :- S is Z + Y.
subtracao(Z,Y, S) :- S is Z - Y.
mult(Z,Y,M) :- M is Z * Y.
div(Z,Y,D) :- D is Z / Y.
divI(Z,Y,D) :- D is Z // Y.
modulo(X, Y, M) :- M is X mod Y.

/* MDC entre M e D retornado na variavel C*/
mdc(0,D,D). 
mdc(M,D,C) :- R is D mod M, mdc(R, M, C).

/* retorna todos os valores binarios de 3 digitos*/
digito(0).
digito(1).
binario(N) :- N = (A,B,C), digito(A), digito(B), digito(C).

/*Somatario de uma lista*/
soma([],0).
soma([H|T], S) :- soma(T, G), S is H + G.

/*Tamanho da lista*/
tamanhoList([], 0).
tamanhoList([_|T], S) :- tamanhoList(T, G), S is 1 + G.

/*Insere elemento no inicio da lista*/
insere(N,L,[N|L]).

/*Insere elemento no final da lista*/
insereFim(N,[],[N]).
insereFim(N, [H|T], L) :- insereFim(N,T,X), insere(H,X,L).

/*Insere elemento em uma lista ja ordenada e mantendo-a ordenada*/
insereOrdenado(N, [], [N]).
insereOrdenado(N,[H|T], L):- N < H, insere(N, [H|T], L).
insereOrdenado(N, [H|T], L):- insereOrdenado(N, T, X), insere(H, X, L). 

/*Remove uma ocorrencia do ele x passado*/
remove(X, [X|T], T).
remove(X, [_|T], [_|T1]):- remove(X, T, T1).

/*retorna o menor elemento entre dois comparados */
retornaMenor(X,Y,Z) :- X < Y, Z is X; Z is Y. 

/*retorna o menor elemento de uma lista, usando a relacao anterior*/
menor([M], M).
menor([H|T], M) :- menor(T, G), retornaMenor(H, G, M). 

/*verifica se o ele x esta na lista*/
contem(X, [X|_]).
contem(X,[_|Y]) :- contem(X, Y).

/* sera retornado o elemto na posicao i passado */
byIndex(0, [X|_], X).
byIndex(I, [_|T], X):- Z is I - 1, byIndex(Z, T, X).

/*Sequencia de Fibonacci*/
fib(1, 1).
fib(2, 1).
fib(X, V):- Z is X - 1, H is X - 2, fib(Z, T), fib(H, S), V is T + S.

/*Fatorial*/
fatorial(0, 1).
fatorial(1, 1).
fatorial(N, X) :- Z is N - 1, fatorial(Z, H), X is N * H.
