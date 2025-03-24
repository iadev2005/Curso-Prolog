/* constantes - valores o variables */
cafe.
azucar.
leche.
chocolate.
tierra.
arena.

/* Predicados - sirven para añadir propiedades */
ingredientes(cafe).
ingredientes(azucar).
ingredientes(leche).
ingredientes(chocolate).
material(tierra).
material(arena).

/* Si tiene mas de 1 argumento - expresan relaciones */
/* Importan las posiciones */
combinacion(cafe, azucar).
combinacion(cafe, leche).
combinacion(cafe, chocolate).

/* Comandos usados en la terminal */

/*
iadev@iadev-VivoBook-ASUSLaptop-X415JA-X415JA:~/Documentos/Programacion/Cursos/Curso-Prolog$ swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 9.0.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- consult('prueba.pro').
true.

?- ingredientes(cafe).
true.

?- combinacion(cafe, azucar).
true.

halt.
*/