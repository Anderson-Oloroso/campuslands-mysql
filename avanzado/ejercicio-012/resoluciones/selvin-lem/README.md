# Resolucion - Ejercicio 012 Avanzado 

## Tematica
Playlist musical

## Analisis breve
Se practican consultas de reportes sobre reproducciones_playlist:
ranking (LIMIT), agregacion por artista (SUM), filtrado de grupos
con HAVING, comparacion contra el promedio general mediante
subconsulta, y un reporte combinado por genero con SUM y AVG. La
cancion con muy pocas reproducciones (500) sirve de caso limite
para verificar que el promedio no se distorsione.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear reproducciones_playlist.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas de
   reportes (LIMIT, SUM, HAVING, subconsulta y GROUP BY).
