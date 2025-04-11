/*
Escribir un programa que ayude a una empresa que desarrolla software, respondiendo
consultas sobre qué personas pueden trabajar junto con una determinada persona.
Dos personas pueden trabajar juntas si hay alguna herramienta que ambas conozcan.
Incluir en el programa la siguiente información:
• Juan maneja Pascal, Clipper y Prolog.
• Pedro maneja Clipper y Basic.
• Ofelia maneja Basic y Pascal.
• Diana maneja Pascal,Access y Prolog.
¿Con quiénes puede trabajar Ofelia ? Respuesta: "Juan" y "Diana".
Agregar al programa la posibilidad de responder a consultas sobre qué personas
pueden trabajar en un determinado proyecto. Decimos que una persona puede
trabajar en un proyecto si maneja alguna de las herramientas que se van a usar para
desarrollarlo.
Incluir en el programa la siguiente información:
a) El proyectoA se desarrollará usando Prolog.
b) El proyecto B se desarrollará usando Access y Basic.
c) El proyecto C se desarrollará usando Pascal.
d) El proyecto D se desarrollará usando Access.
¿Quiénes pueden trabajar en el proyecto B ? Respuesta: "Pedro", "Ofelia“ y "Diana".
Agregar al programa la posibilidad de responder a consultas sobre si un
estudio puede trabajar en un determinado proyecto. Decimos que el estudio
puede trabajar en un proyecto si hay dos personas (¡ distintas entre sí !) que
pueden asignársele. Una persona puede asignarse a un proyecto si puede
trabajar en el mismo, según la definición del punto anterior.
En cuales proyectos se puede trabajar? Respuesta: Proyectos A, B y C, y que
no puede trabajar en el D.
Modificar el programa para que no cuente entre las personas que pueden
asignarse a un proyecto aquellas que ya tienen un proyecto asignado. El
programa debe modificar la respuesta a la consulta planteada
anteriormente.
Incluir en el programa la siguiente información:
• Juan tiene un proyecto asignado.
Ahora el programa debería responder que sí se pueden encarar los
proyectos B y C, y que no pueden encargarse los proyectosA y D.
*/

% Lenguajes que maneja Juan
maneja(juan,pascal).
maneja(juan, clipper).
maneja(juan, prolog).

% Lenguajes que maneja Pedro
maneja(pedro, clipper).
maneja(pedro, basic).

% Lenguajes que maneja Ofelia
maneja(ofelia, basic).
maneja(ofelia, pascal).

% Lenguajes que maneja Diana
maneja(diana, pascal).
maneja(diana, access).
maneja(diana, prolog).

% Se desarrollara el proyecto X con el lenguaje Y
desarrolla(proyectoA, prolog).
desarrolla(proyectoB, access).
desarrolla(proyectoB, basic).
desarrolla(proyectoC, pascal).
desarrolla(proyectoD, access).


pueden_trabajar_juntos(X,Y) :- maneja(X, Z), maneja(Y, Z), X \= Y. 
pueden_trabajar_proyecto(X,P) :- maneja(X, Y), desarrolla(P, Y).

asignado(proyectoA).

% NOTA: En prolog para seguir viendo con los hechos que cumplen la condición no se pulsa "ENTER", se pulsa ";"

% Estudiar: dos personas que pueden trabajar en diferentes proyectos no asignados
% estudiar(X) :- 
%     pueden_trabajar_proyecto(X, P1), 
%     pueden_trabajar_proyecto(Y, P2), 
%     X \= Y, 
%     P1 \= P2, 
%     \+ asignado(P1),
%     \+ asignado(P2).  