# Resolucion - Ejercicio 011 (Intermedio)

## Tematica
pingpong

## Analisis breve
Se modela el registro de partidos de pingpong en partidos_pingpong,
enfocado en practicar la restriccion CHECK de MySQL. Se agregan tres
CHECK: que los sets de cada jugador esten entre 0 y 3, y que no
exista empate entre sets_local y sets_visitante. Como caso limite se
deja comentado un INSERT que intenta registrar un empate, para
verificar que la restriccion CHECK lo rechaza (error 3819).

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear partidos_pingpong.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las consultas de filtros,
   calculo de ganador y verificacion del CHECK.
