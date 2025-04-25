% En general la estructura para una persona es la siguiente:

% Persona: sexo(Nombre, Altura, ColorCabello, Edad)
% Nombre: cualquiera
% Altura: alta, media y baja
% ColorCabello: rubio, castaño, pelirrojo y negro
% Edad: joven, adulta y madura

hombre(martin, alta, rubio, adulta).
hombre(ignacio, media, negro, joven).
hombre(juan, baja, negro, madura).

mujer(lucia, alta, rubio, adulta).
mujer(marta, media, pelirrojo, joven).
mujer(ana, baja, castano, madura).

% En general la estructura para los gustos es la siguiente:

% Gustos: gusta(Nombre, Musica, Literatura, Deporte)
% Nombre: cualquiera
% Musica: clasica, pop y jazz
% Literatura: aventura, ciencia_ficcion y policiaca
% Deporte: tenis, natación y futbol

gusta(martin, jazz, aventura, natacion).
gusta(ignacio, pop, ciencia_ficcion, futbol).
gusta(juan, clasica, policiaca, tenis).

gusta(lucia, clasica, aventura, natacion).
gusta(marta, pop, ciencia_ficcion, futbol).
gusta(ana, jazz, policiaca, tenis).

% En general la estructura para buscar es la siguiente:

% Busca: busca(Nombre, AlturaBuscada, ColorCabelloBuscado, EdadBuscada)
% Nombre: cualquiera
% AlturaBuscada: alta, media y baja
% ColorCabelloBuscado: rubio, castaño, pelirrojo y negro
% EdadBuscada: joven, adulta y madura

busca(martin, alta, rubio, adulta).
busca(ignacio, media, pelirrojo, joven).
busca(juan, baja, castano, madura).

busca(lucia, alta, rubio, adulta).
busca(marta, media, negro, joven).
busca(ana, baja, negro, madura).

% Conviene físicamente: X conviene a Y si la altura, el color de cabello y la edad de X son las que busca Y (y viceversa)
conviene_fisicamente(X, Y) :-
    hombre(X, A, C, E),
    mujer(Y, _, _, _),
    % Primero se debe buscar al "X" e "Y", luego se pueden verificar si son distintos
    X \= Y,
    busca(Y, A, C, E).

conviene_fisicamente(X, Y) :-
    mujer(X, _, _, _),
    hombre(Y, A, C, E),
    X \= Y,
    busca(X, A, C, E).

% Gustos: tiene igualdad de gustos si coinciden en música, literatura y deporte
tiene_igual_gusto(X, Y) :-
    gusta(X, M, L, S),
    gusta(Y, M, L, S),
    X \= Y.

% Dos personas X e Y son adecuadas si X conviene a Y y Y conviene a X 
pareja_adecuada(X, Y) :-
    X \== Y, % Aseguramos que no se compare a la misma persona
    conviene_fisicamente(X, Y),
    tiene_igual_gusto(X, Y).