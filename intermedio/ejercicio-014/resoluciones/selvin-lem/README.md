# Resolucion - Ejercicio 014 (Intermedio)

## Tematica
saga de ciencia ficcion

## Analisis breve
Se modela una saga de ciencia ficcion en peliculas_saga, enfocado en
practicar vistas simples (VIEW) en MySQL. Se crean dos vistas:
vista_peliculas_destacadas (calificacion >= 8.0) y
vista_resumen_saga (promedio de calificacion por saga). Como caso de
analisis, se consulta la vista de destacadas filtrando por saga y se
combinan ambas vistas para detectar episodios por debajo del
promedio de su propia saga.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear peliculas_saga.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para crear las vistas y correr las
   consultas sobre ellas.
