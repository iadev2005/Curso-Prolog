/* * ¿Existe una conexión directa entre A e I?
* ¿Con qué nodos esta conectado F y cuál es el costo de cada conexión?
* Construir una regla para determinar si un nodo tiene aristas
* Construir una regla para determinar cual es el costo de ir de un nodo X a un nodo Z pasando por Y
*/

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

/* Reglas */
/* No me interesa con quien las tiene, solo si las tiene, entonces ignoro el nodo de llegada y el costo */
tiene_aristas(A) :- conexion(A, _, _).
/* Bueno primero se verifica si X puede llegar Z, para eso se comprueba X puede llegar a Y, y Y puede llegar a Z, si eso es cierto se almancenan sus costos y se devuelve la suma de ambos */
llegar(Inicio, Intermedio, Final, Costo) :- conexion(Inicio, Intermedio, C1), conexion(Intermedio, Final, C2), Costo is C1+C2.
/*  Aca habrán dos cosas a considerar, la primera es que si no nos interesa algo usaremos el "_" que es para las variables anónimas, la segunda es que la última pregunta que nos hacen es X -> Z si X -> Y, Y -> Z, es decir solo toma a tres nodos, no es necesario hacerlo de manera recursiva */

/* Terminal */
/*
?- conexion(a, i, _).
false.

?- conexion(f, X, Y).
X = g,
Y = 10 ;
X = a,
Y = 8.

?- tiene_aristas(f).
true ;
true.

?- llegar(h, f, g, C).
C = 19 ;
*/

/* Nota: En la penúltima y última línea, hay dos resultado porque PROLOG busca todos los caminos posible para ver si se cumple esaa regla, f tiene dos aristas, y al llegar a f hay dos caminos pero solo uno conduce a g */