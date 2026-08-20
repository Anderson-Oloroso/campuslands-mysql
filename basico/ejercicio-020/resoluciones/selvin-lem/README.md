# Resolucion - Ejercicio 020 (Basico) - Selvin Lem

## Tematica
Estudio de tatuajes

## Analisis breve
Se modela la agenda del estudio en citas_tatuajes, enfocado en
practicar SELECT con distintos filtros (por estado), ordenamientos
y agregaciones (AVG, SUM). Las citas canceladas se incluyen como
caso limite para verificar que no distorsionen el calculo de
ingresos reales (SUM solo sobre estado = 'completada').

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear citas_tatuajes.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   filtros, AVG, SUM y ordenamientos.
