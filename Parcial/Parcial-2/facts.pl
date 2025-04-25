/*
Se necesita de un sistema que obtenga la
densidad de población de algunos estados de
Venezuela.
A continuación, se listan algunos estados con
su respectiva población y superficie:
1. Zulia cuenta con 4.957.765 habitantes y
tiene una superficie de 63.100 Km2.
2. Miranda cuenta con 3.739 .45 habitantes
y tiene una superficie de 7.950 Km2.
3. Carabobo cuenta con 2.886.093
habitantes y tiene una superficie de 4.650
Km2.
4. Aragua cuenta con 2.228.130 habitantes
y tiene una superficie de 7.014 Km2.
5. Anzoátegui cuenta con 2.103.856
habitantes y tiene una superficie de 43.300
Km2.
6. Bolívar cuenta con 2.069.064 habitantes y tiene una superficie de 240.528 Km2.
7. Falcón cuenta con 1.137.324 habitantes y tiene una superficie de 24.800 Km2.
La densidad poblacional se obtiene aplicando la fórmula: población/superficie. Se requiere determinar el
estado con mayor, menor o igual densidad poblacional.
resultado a Prolog las siguientes preguntas, ejecútalas y reporta los
En base a los estados previamente mencionados y según el mapa de Venezuela, se puede determinar los
estados que son vecinos:
 Zulia es vecina de Falcón.
 Miranda es vecina de Aragua y Anzoátegui.
 Carabobo es vecina de Aragua y Falcón.
 Anzoátegui es vecina de Miranda y Bolívar.
Se conoce además que:
Luis, Clara y Rosa viven en Zulia.
Ana y José viven en Bolívar.
María y Jorge viven en Falcón.
Sonia, Julieta y Eduardo viven en Miranda.
Construya en Prolog las siguientes preguntas:
¿Cuál es la población de un estado X? ¿Cuál estado tiene una población de N habitantes?
¿Cuál es la superficie de un estado Y? ¿Cuál estado tiene una superficie de N Km2?
¿Qué densidad poblacional tiene un estado X?
¿Cuál estado tiene mayor densidad poblacional que otro?
¿Cuál estado tiene menor densidad poblacional que otro?
¿Cuáles estados tienen igual densidad poblacional?
¿Cuál persona X es vecino de la persona Y?
¿Cuál persona X puede visitar a la persona Y?
*/

% Relación estado-población (E, P)
tiene_poblacion_de(zulia, 4967765).
tiene_poblacion_de(miranda, 3739045).
tiene_poblacion_de(carabobo, 2886093).
tiene_poblacion_de(aragua, 2228130).
tiene_poblacion_de(anzoategui, 2103856).
tiene_poblacion_de(bolivar, 2069064).
tiene_poblacion_de(falcon, 1137324).

% Relación estado-superficie (E, S)
tiene_superficie_de(zulia, 63110).
tiene_superficie_de(miranda, 7950).
tiene_superficie_de(carabobo, 4650).
tiene_superficie_de(anzoategui, 43000).
tiene_superficie_de(bolivar, 240528).
tiene_superficie_de(falcon, 24800).

% Relación persona-estado (P, E)
vive_en(luis, zulia).
vive_en(clara, zulia).
vive_en(rosa, zulia).
vive_en(ana, bolivar).
vive_en(jose, bolivar).
vive_en(maria, falcon).
vive_en(jorge, falcon).
vive_en(sonia, miranda).
vive_en(julieta, miranda).
vive_en(eduardo, miranda).

% Relación estado-estado (E1, E2)
es_vecino_de(zulia, falcon).
es_vecino_de(miranda, aragua).
es_vecino_de(miranda, anzoategui).
es_vecino_de(carabobo, aragua).
es_vecino_de(carabobo, falcon).
es_vecino_de(anzoategui, miranda).
es_vecino_de(anzoategui, bolivar).

tiene_una_densidad_poblacional_de(E, D) :- tiene_poblacion_de(E, P), tiene_superficie_de(E, S), D is P/S.

% Las siguientes preguntas pueden ser contestatadas sin necesidad de definir reglas complejas, directamente consultando desde los hechos:

/*
¿Cuál es la población de un estado X? ¿Cuál estado tiene una población de N habitantes?
¿Cuál es la superficie de un estado Y? ¿Cuál estado tiene una superficie de N Km2?
*/

tiene_mayor_densidad_que(E1, E2):- tiene_una_densidad_poblacional_de(E1, D1), tiene_una_densidad_poblacional_de(E2, D2), D1 > D2.

tiene_menor_densidad_que(E1, E2):- \+ tiene_mayor_densidad_que(E1, E2).

tiene_igual_densidad_que(E1, E2):- tiene_una_densidad_poblacional_de(E1, D1), tiene_una_densidad_poblacional_de(E2, D2), D1 == D2.

es_vecino_de_la_persona(P1, P2):- vive_en(P1, E1), es_vecino_de(E1, E2), vive_en(P2, E2).

puede_visitar_a_la_persona(P1, P2):- vive_en(P1, E), vive_en(P2, E), P1 \= P2.

