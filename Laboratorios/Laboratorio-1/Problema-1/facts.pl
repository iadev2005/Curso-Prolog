/*
1. Escribir un predicado en ProLog que permita eliminar un elemento de la lista.
del(Elem,L1,L2) <-borra el elemento Elem de la lista L1 obteniéndose la lista L2
*/

% Si la lista es vacía, no nos interesa el elemento y devolveremos una lista vacía
eliminar([],_,[]).

% Si el elemento E (cabeza de la lista), es igual al elemento ingresado, se devuelve la lista L (cola) sin el elemento E. El ! es para cortar la ejecución
eliminar([E|L], E, L) :- !.

% Si el elemento E (cabeza de la lista) no es igual, se irá pasando la cola para ir iterando, finalmente, cuando se encuentre al elemento, la clausula 2 retornará la lista sin el elemento, y append([C], N, L), tomará la cabeza del elemento con el que estamos (por lo tanto uno anterior a E) y unificará con la lista generada con la clausula 2
eliminar([C|Q], E, L) :- eliminar(Q, E, N), append([C], N, L).

/*
Nota: Append básicamente unifica dos lista y las devuelve en una variable

append([a,b], [c], X).
X = [a,b,c].
*/

/*
Corrida en frío:
eliminar([a,b,c], b, L).
La lista no es vacía, por lo tanto ignora la 1era clausula
La cabeza no es directamente igual al elemento dado, ignora la segunda clausula
Como la cabeza no es directamente igual al elemento, se pasa la cola y se vuelve hacer el proceso, ahora la cabeza si es igual al elemento, la clausula 2 retorna a la cola en ese punto (todo lo que esta después de E), y append([C], N, L) todo lo que esta detŕas de E para unificarlo en L
*/