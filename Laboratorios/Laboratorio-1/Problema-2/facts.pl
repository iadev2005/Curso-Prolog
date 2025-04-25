/*
2. Escribir un predicado en ProLog que concatene dos listas.
concatena(L1,L2,L3) <- concatena las listas L1 y L2 dando lugar a la lista L3 
*/

% La manera más sencilla es usando append, que es un comando para concatenar listas

concatena(L1, L2, L3) :- append(L1, L2, L3). 