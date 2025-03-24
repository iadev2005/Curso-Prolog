/* Serie de Gauss Recursiva
* Dado un número entero positivo, devolver las suma de los antecesores a el
*/

/* const serieGauss = n => {
    return (n==1) ? 1 : (n + serieGauss(n-1));
}
*/

/* Reglas */
gauss(0,0).

/* Prolog no permite operaciones en los argumentos */
/* gauss(N, R):- N + gauss(N-1, R). */

/* Prolog no permite la suma entre numeros y reglas */
/* gauss(N, R):- A is N-1, R is N + gauss(A, R). */

/* El !. es para que deje de buscar más soluciones */
gauss(N, R) :- N>0, A is N-1, gauss(A, Ra), R is N + Ra, !.

/* En base a la misma lógica se puede calcular un factorial */
factorial(1,1).
factorial(N, R) :- N \= 1, A is N-1, factorial(A, Ra), R is N * Ra, !.

/* Terminal */
/*
?- gauss(5,R).
R = 15.

?- factorial(5,R).
R = 120.
*/