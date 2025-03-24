/* Cuando se le hace algun tipo de pregunta a la base de conocimientos PROLOG solo puede devolver 3 tipos de respuestas: NO, SI y un valor */

/* Hechos */
persona(david).
persona(pedro).
persona(jose).

es_par(X) :- 0 is X mod 2.

/* Supongamos que pongamos lo siguiente en la terminal: persona(X). , esto nos devolverá X = david (y más nada), a menos que pongamos el operador ";" esto nos devolvera al siguiente objeto que cumpla con el hecho, y así sucesivamente hasta que se acaben los objetos que cumplan con ese hecho */

/* PROLOG puede hacer esto por sus mecanismos de inferencia, los cuales son: Unificación, Backtracking y Árboles SLD */

/* Unificación es el algoritmo base, es el que compara cada pregunta que le hacemos a PROLOG, el va buscando línea por línea, hasta encontrar el functor que coincida con la pregunta hecha (por ejemplo, en el caso de persona(david). el functor es persona) y luego cuando consigue el functor consulta si los objetos coinciden con la pregunta establecida */

/* Ojo, PROLOG siempre va línea por línea hasta encontrar el functor, luego evalua la expresión (al menos en el caso de la Unificación) */

/* Por ejemplo, cuando preguntamos si es_par(8). , ya que la regla esta definida como es_par(X) lo que esta haciendo PROLOG en realidad es instaciar a X como 8 para luego probar la regla */

/* Lo mismo cuando usamos una variable para ver todos los objetos que cumplan con el hecho o relación, simplemente va instanciando X con el valor de todos los objetos que cumplan esa relación en nuestra base de conocimientos */

/* Terminal */
/*
?- ['facts.pro'].
true.

?- persona(david).
true.

?- ['facts.pro'].
true.

?- es_par(8).
true.

?- persona(X).
X = david ;
X = pedro ;
X = jose.

*/