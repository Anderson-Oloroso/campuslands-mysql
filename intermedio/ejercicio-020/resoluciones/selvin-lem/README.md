# Resolucion - Ejercicio 020 (Intermedio)

## Tematica
estudio de tatuajes

## Analisis breve
Se modela la agenda del estudio en citas_tatuajes, enfocado en
practicar subconsultas: una subconsulta escalar en WHERE para
comparar contra el precio promedio, una subconsulta en FROM (tabla
derivada) para hallar el artista con mas citas completadas, y una
subconsulta anidada para comparar el gasto por cliente contra el
promedio de gasto entre clientes. Las citas canceladas se incluyen
como caso limite para verificar que no distorsionen el calculo de
ingresos reales (SUM solo sobre estado = 'completada').

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear citas_tatuajes.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las consultas con
   subconsultas escalares, en FROM y anidadas.
