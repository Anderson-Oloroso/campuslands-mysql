# Resolucion - Ejercicio 015 (Basico) - Selvin Lem

## Tematica
Biblioteca gamer

## Analisis breve
Se modelan dos tablas relacionadas: desarrolladoras_015 (entidad
independiente) y basico_ejercicio_015 (juegos), con una relacion
uno a muchos mediante desarrolladora_id como FK. Esto permite
practicar JOIN para responder preguntas que combinan ambas
entidades, como horas jugadas por desarrolladora o cual tiene mas
titulos en la biblioteca. El campo horas_jugadas en 0 para un juego
pendiente sirve como caso limite en los calculos de SUM.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear desarrolladoras_015 y
   basico_ejercicio_015.
2. Ejecutar `dml/inserts.sql` para insertar 4 desarrolladoras y
   10 juegos de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   JOIN, SUM, COUNT y filtros por estado.
