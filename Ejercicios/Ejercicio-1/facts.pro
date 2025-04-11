/*
Ejercicio 1
Dada la base de datos familiar, se pide la respuesta de PROLOG y
el enunciado verbal de las siguientes preguntas:
a) ?-progenitor(jaime,X).
b) ?-progenitor(X,jaime).
c) ?-progenitor(clara,X), progenitor(X,patricia).
d) ?-progenitor(tomas,X), progenitor(X,Y), progenitor(Y,Z).
*/

progenitor(clara,jose).
progenitor(tomas, jose).
progenitor(tomas,isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia,jaime).

/*
Terminal:

?- progenitor(jaime, X).
false.

?- progenitor(X, jaime).
X = patricia.

?- progenitor(clara, X), progenitor(X, patricia).
X = jose.

?- progenitor(tomas, X), progenitor(X, Y), progenitor(Y
, Z).
X = jose,
Y = patricia,
Z = jaime .
*/