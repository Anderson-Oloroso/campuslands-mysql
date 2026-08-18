# Resolucion - Ejercicio 015 (Intermedio)

## Tematica
biblioteca gamer

## Analisis breve
Se modela una biblioteca de videojuegos en videojuegos_biblioteca,
enfocado en practicar distintas formas de carga de datos: INSERT
multiple, INSERT fila por fila, INSERT usando valores por DEFAULT
(horas_jugadas y completado) y una referencia comentada a LOAD DATA
INFILE para cargas masivas desde archivo. Como caso limite se
verifica que el registro cargado sin horas_jugadas ni completado
tome correctamente sus valores por defecto.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear videojuegos_biblioteca.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros usando
   distintas formas de carga de datos.
3. Ejecutar `dql/consultas.sql` para verificar los datos cargados y
   correr las consultas de resumen.
