# Resolucion - Ejercicio 014 (Basico) 

## Tematica
Saga de ciencia ficcion

## Analisis breve
Se modela una entrega por registro (numero_entrega dentro de la
saga), con fecha_estreno como DATE para poder filtrar por año,
calcular dias transcurridos y ordenar cronologicamente. El estado
distingue entregas ya estrenadas, proximas y una cancelada como
caso limite (duracion en 0).

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear basico_ejercicio_014.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas de
   fechas (ordenamiento, filtro por año, DATEDIFF y conteo).
