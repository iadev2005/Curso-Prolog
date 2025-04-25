/*
1. Escribir un programa Prolog que responda consultas acerca de a qué voltajes pueden funcionar los
televisores de una determinada marca, sabiendo que:
• Los televisores japoneses pueden funcionar a 220 voltios, al igual que los alemanes.
• Los televisores hindúes (de la India) pueden funcionar a 110 voltios.
• Los televisores cameruneses (de Camerún) pueden funcionar tanto a 380 voltios como a 110 Voltios.
• Todos los televisores asiáticos pueden funcionar a 380 voltios.
• Hitachi y Honda son marcas de televisores japoneses.
• Pradesh y Agra son marcas de televisores hindúes.
• Mokuta es una marca de televisores cameruneses.
• Grundig y Fokker son marcas de televisores alemanes.
• Los televisores Philco pueden funcionar a 220 voltios.
• Entre las marcas mencionadas, las asiáticas son las japonesas y las híndúes, y ninguna más.
El programa debe ser capaz de responder a las siguientes consultas:
a. ¿ A qué voltajes pueden funcionar los televisores Honda ? Obteniendo 220 y 380.
Modificar el programa anterior para que responda consultas acerca de a qué países pueden exportarse los
televisores de una determinada marca.
Se dice que los televisores de una marca pueden exportarse a un país si pueden funcionar al voltaje que se
utiliza en ese país.
Incluir en el programa la siguiente información:
• En Brasil se utilizan 220 voltios.
• En Panamá se utilizan 110 voltios.
• En Turquía y en Irán se utilizan 380 voltios.
El programa debe ser capaz de responder, a la siguiente consulta
¿ A qué países pueden exportarse los televisores de marca Mokuta ? Obteniendo: Panamá, Turquía e Irán.
*/

% Antes de hacer el ejercicio hice un diagrama UML, para pensar como serían las entidades, que atributos tendrían y como se relacionarian con las demás

% Primero definiré la relación paises-continentes
es_un_pais_de(japon, asia).
es_un_pais_de(india, asia).
es_un_pais_de(camerun, africa).
es_un_pais_de(usa, america).
es_un_pais_de(alemania, europa).

% Ahora estableceré la relación entre marcas y paises
es_una_marca_de(hitachi, japon).
es_una_marca_de(honda, japon).
es_una_marca_de(pradesh, india).
es_una_marca_de(agra, india).
es_una_marca_de(mokuta, camerun).
es_una_marca_de(grundig, alemania).
es_una_marca_de(fokker, alemania).
% Se asume que philco es de Estados Unidos
es_una_marca_de(philco, usa).

% Con esto se puede establecer la relación voltaje-pais
es_el_voltaje_de(220, japon).
es_el_voltaje_de(110, india).
es_el_voltaje_de(110, camerun).
es_el_voltaje_de(380, camerun).
es_el_voltaje_de(220, alemania).
es_el_voltaje_de(220, usa).

% La relación voltaje-continente sería:
es_el_voltaje_que_manejan_en(380, asia).

maneja_un_voltaje_de(X, Y):- es_una_marca_de(X, A), es_el_voltaje_de(Y, A); es_una_marca_de(X, A), es_un_pais_de(A, B), es_el_voltaje_que_manejan_en(Y, B).

% Respuesta a)
/*
?- maneja_un_voltaje_de(hitachi, Y).
Y = 220 ;
Y = 380.
*/

es_el_voltaje_que_funciona_en(220, brasil).
es_el_voltaje_que_funciona_en(110, panama).
es_el_voltaje_que_funciona_en(380, iran).
es_el_voltaje_que_funciona_en(380, turquia).

pueden_exportarse_en_el_pais_de(X,Y):- maneja_un_voltaje_de(X, A), es_el_voltaje_que_funciona_en(A, Y).