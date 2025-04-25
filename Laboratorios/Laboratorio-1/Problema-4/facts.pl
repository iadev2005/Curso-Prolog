/*
Consideremos la relación nota(X,Y) que se verifica si Y es la calificación correspondiente a la nota
X; es decir, Y es Reprobado si X es menor que 5, Y es aprobado si X es mayor o igual que 5 pero
menor que 7, Y es Bueno si X es mayor que 7 pero menor que 9 e Y es sobresaliente si X es mayor
que 9.
Se pide:
• Definir la Base de Conocimientos correspondiente a lo descrito anteriormente.
• Describa el árbol de deducción al determinar la calificación correspondiente al 6.
• Modifique la base de conocimientos para hacerlo más eficiente a través del uso de corte.
• Genere el árbol de deducción correspondiente.
*/

% nota(X, reprobado) :- X < 5.
% nota(X, aprobado) :- X >= 5, X < 7.
% nota(X, bueno) :- X >= 7, X < 9.
% nota(X, sobresaliente) :- X >= 9.

/*
Prolog buscará en su base de conocimientos que regla asociada cumple con la condición, la primera es falsa, la segunda es verdadera (X se encuentra en ese rango de valores), luego como Prolog busca todas las soluciones posibles (a menos que se le indique lo contrario), seguirá iterando, donde tanto la 4ta y la 3era serán falsas
*/

/* Optimización con el operador de corte */
nota(X, reprobado) :- X < 5, !.
nota(X, aprobado) :- X >= 5, X < 7, !.
nota(X, bueno) :- X >= 7, X < 9, !.
nota(X, sobresaliente) :- X >= 9, !.

/*
Árbol de deducción para la consulta nota(6, Y)

                                   nota(6, Y)
                                      |
                                    /   \
                                   /     \
                                  /       \
                                 /         \
                             Reprobado    Aprobado
                                |            |
                            (6 < 5)       (6 >= 5, 6 < 7)
                                |            |
                             FALSO       VERDADERO
                                        |
                                       Y = aprobado 
                                        |
                                      FIN
                                     
El árbol muestra que Prolog evaluó primero la regla relacionada con "reprobado", que resultó falsa,
por lo que procedió a la siguiente regla que trata con "aprobado", la cual resulta verdadera.
En este punto, Prolog asigna el valor "aprobado" a Y y termina la búsqueda, ya que esta el operador de corte "!"
*/