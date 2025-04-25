/*
Escribir un predicado en ProLog que construya una lista creciente, donde su primer valor es X y su último
valor es Y. 
*/
l_creciente([Y], Y, Y).
l_creciente([X|Xs], X, Y):- X<Y,  X1 is X + 1, l_creciente(Xs, X1, Y).