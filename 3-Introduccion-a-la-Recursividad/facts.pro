/* Como saber si existe un camino entre dos nodos? */

/* Hay un camino de D con I, tiene un costo de 2 (aunque no este en el diagrama) */

/*
/         A ------> B        C
/         ʌ   7
/         |
D         | 8
|         |
| 4    -> F ------> G
|    _|   ʌ   10
v   | 9   |
H- -      | 11      
/         |
/         I
*/

/* Relaciones */
/* conexion(nodo1, nodo2, costo) */
conexion(d, h, 4).
conexion(h, f, 9).
conexion(i, f, 11).
conexion(f, g, 10).
conexion(f, a, 8).
conexion(a, b, 7).
conexion(d, i, 2).

/* Reglas */
/* Camino con recursividad */
/* Hay que recordar que PROLOG retrocede con tal de buscar TODOS los caminos posibles, es por eso que de D a F evalua el camino que pasa por I y por H (casualmente ambas sumas dan 13). Todo esto sucede por el Backtracking que es el segundo mecanismo de inferencia de PROLOG */
camino(A, B, _) :- conexion(A, B, _).
camino(A, B, _) :- conexion(A, X, _), conexion(X,B, _).
caminoCosto(A, B, Costo) :- conexion(A, B, Costo).
caminoCosto(A, B, CostoTotal) :- conexion(A, X, C1), conexion(X, B, C2), CostoTotal is C1 + C2. 

/* Terminal */
/*
?- ['facts.pro'].
true.

?- camino(f, X, _).
X = g ;
X = a ;
X = b.

?- caminoCosto(f,X,C).
X = g,
C = 10 ;
X = a,
C = 8 ;
X = b,
C = 15.

?- caminoCosto(d,f,C).
C = 13 ;
C = 13.
*/