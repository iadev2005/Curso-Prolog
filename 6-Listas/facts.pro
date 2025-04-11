/* Las listas en prolog son colas, [X|Y] X representa el elemnto actual, Y el resto de los elementos */

[a,b,c] = [1,2,3].
[n1,n2,n3] = [2, 0, 2].

miembro(X, [X|_]).
miembro(X, [_|Cola]) :- miembro(X, Cola).
% La lista esta vacía, entonces devuelve 0
longitud([], 0).
% Un elemento anónimo que representa la cabeza de la lista, luego, la nueva lista que se va a recorrer recorre a la cola (sin la cabeza) y va acumulando en una variable L2 el tamaño de la lista
longitud([_|Xs], L):- longitud(Xs, L2), L is L2 + 1.

% mostrar([], 0, _).
% mostrar([X|Xs], L, Y):- mostrar(Xs, L2, Y), L is L2 + 1, Y is X.

primero([X|_], Z) :- X == Z.

ultimo([X|Xs], Y) :- X == Y , Xs == [].
ultimo([X|Xs], Y):- ultimo(Xs, Y).

es_par(X) :- 0 is X mod 2.

sumar_pares([], 0).
sumar_pares([X|Xs], S) :- sumar_pares(Xs, S2), (es_par(X) -> S is S2 + X ; S = S2).
suma_pares_es_igual_a_n(Lista, N) :- sumar_pares(Lista, S), S == N.