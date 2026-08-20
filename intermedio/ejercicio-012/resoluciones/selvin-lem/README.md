# Resolucion - Ejercicio 012 (Intermedio)

## Tematica
playlist musical

## Analisis breve
Se modela una playlist musical en canciones_playlist, enfocado en
practicar consultas de reportes: totales y promedios por genero,
ranking de canciones mas reproducidas y comparacion contra el
promedio general. Se usa una subconsulta escalar para detectar
canciones por encima del promedio de reproducciones, como caso de
analisis mas alla del filtro simple.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear canciones_playlist.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr los reportes de
   duracion, ranking y promedio de reproducciones.
