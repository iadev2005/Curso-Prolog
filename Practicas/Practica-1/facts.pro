/* Dado los siguientes hechos:

Clara es la madre de Pedro
Pedro es padre de José
Ana es madre de Clara
José es padre de Clara

* ¿Es Clara abuela de José?
+ ¿Es Pedro abuelo de Clara?
+ ¿Es Ana bisabuela de alguien?, ¿De quién?

*/

/* Hay múltiples maneras de resolver este ejercicio, pero aprovecharé que ya tengo una buena base de conocimiento en PROLOG para hacerlo de la manerma más simple posible, lo primero será declarar las relaciones */

/* Nota: A fin de simplificar el problema no consideraremos el sexo como algo importante solo nos interesa sabe si alguien es abuelo de otra persona, o si alguien es bisabuelo de otra persona */

/* Relaciones */
es_padre(clara, pedro).
es_padre(pedro, jose).
es_padre(ana, clara).
es_padre(jose, clara).

/* Reglas */
es_abuelo(A, C) :- es_padre(A, B), es_padre(B, C).
es_bisabuelo(A,C):- es_abuelo(A,B), es_padre(B, C).

/* Es importante aclarar que todas estas reglas funcionan, porque PROLOG cuando no se le indica la relación directa, busca en la base de conocimientos la relación directa declarada */

/* Acá usaré reglas recursivas por comodidad, la explicación a fondo de como funcionan esta en mi cuaderno de notas */

/* Fue buena lógica, pero debido a las confusas relaciones en la base de conociminentos, se termino volviendo una recursión infiinita */
/* es_descendiente(A, B) :- es_padre(B, A). */
/* es_descendiente(A, B) :- es_padre(X, A), es_descendiente(X, B).*/

/* Terminal */
/*
?- es_abuelo(clara, jose).
true.

?- es_abuelo(pedro, clara).
true.

?- es_bisabuelo(ana, X).
X = jose.
*/

/* Si, clara es abuela de jose, pedro es abuelo de clara, y ana es bisabuela de jose */