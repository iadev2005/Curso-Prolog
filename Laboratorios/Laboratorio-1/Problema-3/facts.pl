/*
3. Escribir un predicado PROLOG para que dada una lista de números, determine el número de
elementos positivos (el cero (0), se considera como positivo) y el número de elementos negativos.
*/

es_positivo(X):- X>=0.
es_negativo(X):- not(es_positivo(X)).

% Si la lista es vacía devolvemos 0 para positivos y negativos
numeros([], 0, 0).

numeros([Cabeza|Cola], P, N):- es_positivo(Cabeza), numeros(Cola, P1, N), P is P1 + 1.

numeros([Cabeza|Cola], P, N):- es_negativo(Cabeza), numeros(Cola, P, N1), N is N1 + 1.



