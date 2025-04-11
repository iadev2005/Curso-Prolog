/*
Ejercicios
a) Escribir un predicado que permita calcular la potencia de un
numero.
b) Escribir un predicado que permita calcular multiplicación por
sumas sucesivas.
c) Escribir un predicado que permita calcular división por restas
sucesivas
*/

potencia(_, 0, 1).
potencia(B, E, P) :- E > 0, Emenos1 is E-1, potencia(B, Emenos1, P1), P is B * P1.

multiplicacion(_, 0, 0). 
multiplicacion(A, B, P) :- B > 0, Bmenos1 is B - 1, multiplicacion(A, Bmenos1, P1), P is P1 + A.

division(_, 0, _) :- write('Error: División por cero no está definida.'), !, fail. 

division(A, B, 0) :- A < B. division(A, B, C) :- A >= B, 
AmenosB is A - B, division(AmenosB, B, C1), C is C1 + 1.
