/* Prolog necesita de una base dde conocimientos para poder funcionar, la base de conocimientos esta formada por hechos y reglas */

/* Cuando la base de conocimientos este conformada se le pueden hacer preguntas */

/* Algunos ejemplos de las preguntas son las siguientes */
/* ?- persona(laura) */
/* Laura es una persona? */
/* es_par(5) */
/* 5 es par? */
/* También esta la pregunta compuesta, o conjunción de objetivos */
/* es_par(5), divisibe_por_dos(5) */
/* 5 es par y divisible por dos? */
/* La "," se le considera el operador lógico AND */
/* es_par(5); divisible_por_dos(5) */
/* 5 es par o divisible_por_dos(5) */
/* El ";" se le considera el operador lógico OR */

/* Las variables empiezan con mayúsculas */

/* Hechos */
/* Los hechos son predicados en PROLOG que siempre van a ser verdaderos */
/* declaremos los siguientes hechos */
persona(david).
persona(pedro).
persona(jose).
persona(leo).
/* Relaciones */
es_hermano(ignacio, maria).

/* Reglas */
/* Se puede ver el ":-" como un if. "is" es para asignar el resultado de la operación (o mejor dicho comparar)  a la izquierda. En este caso devuelve true si el resultado de X mod 2 es igual a 0 */
es_par(X) :- 0 is X mod 2.

/* Terminal */
/* Nota: por cada cambio se debe hacer un ?- ['nombre_archivo.extension']. , o un, ?- consult('nombre_archivo.extension') */
/* swipl es para iniciar el compilador de PROLOG, consult o [] para cargar y detectar el archivo con la base de conocimientos, halt para salir del compilador de PROLOG, y todo lo demás para consultar hechos y reglas */
/* Se usaron los siguientes comandos para hacer pruebas
swipl
consult('facts.pro').
true.
persona('pedro').
true. 
es_par(5).
false. 
es_hermano(ignacio, maria).
true */