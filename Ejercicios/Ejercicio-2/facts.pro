/*
Ejercicio 2
Dada la base de datos familiar, formula en PROLOG las siguientes preguntas:
a) ¿Quién es el progenitor de Patricia?
b) ¿Tiene Isabel un hijo o una hija?
c) ¿Quién es el abuelo de Isabel?
*/

progenitor(clara,jose).
progenitor(tomas, jose).
progenitor(tomas,isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia,jaime).

es_hombre(jose).
es_hombre(tomas).
es_hombre(jaime).

es_mujer(clara).
es_mujer(isabel).
es_mujer(ana).
es_mujer(patricia).

es_abuelo(X, Z) :- progenitor(X, Y), progenitor(Y,Z).
es_hijo(A, B) :- progenitor(B, A), es_hombre(A).
es_hija(A, B) :- progenitor(B, A), es_mujer(A).

/*
?- progenitor(X, patricia).
X = jose.

?- es_hijo(A, isabel).
false.

es_hija(A, isabel).
false.

?- es_abuelo(X, isabel).
false.
*/