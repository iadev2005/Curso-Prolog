/*
Escribir un predicado en ProLog que permita crear una lista con N elementos de valor X.
repite(N,X,Xs) donde N es la cantidad de elementos, X el valor de los elementos y Xs la lista resultante.
*/

repite(0, _, []).
repite(N, X, [X|Xs]):- N>0, N1 is N-1, repite(N1, X, Xs).

% repite(N, X, L):- N>0, N1 is N-1, repite(N1, X, append(X, L)).
