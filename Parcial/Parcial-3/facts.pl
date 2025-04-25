/*
2. Escribe un predicado nat(X) que sea capaz de generar los números
naturales. Debe actuar de la siguiente forma:
nat(6) yes
nat(X) 12345678...
*/
% n es el número que se retornará, 0 la resta que se hará
% nbase(n, R).

% nat(N1, Naturales) :- 
%     findall(X, between(1, N1, X), Naturales).

% Predicado base para el caso de nat(0)
nat(0).

% Predicado recursivo para generar los números naturales
nat(N) :-
    nat_aux(N, 1).

% Auxiliar que ayuda a generar números naturales
nat_aux(X, N) :-
    X is N, !.  % Si se ha encontrado el número, lo unificamos.
nat_aux(X, N) :-
    N1 is N + 1,
    nat_aux(X, N1).  % Llamada recursiva para seguir generando números.


