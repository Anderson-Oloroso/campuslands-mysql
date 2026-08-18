# Resolucion - Ejercicio 014 Avanzado

## Tematica
Saga de ciencia ficcion

## Analisis breve
Se crean dos vistas simples sobre entregas_saga_cf:
vista_entregas_estrenadas (filtro directo por estado) y
vista_resumen_saga (agregado con COUNT y AVG agrupado por el
nombre base de la saga). La entrega cancelada con duracion 0 queda
fuera de ambas vistas por no estar estrenada, sirviendo de caso
limite para confirmar el filtro.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear entregas_saga_cf y las
   dos vistas.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas,
   incluyendo consultas directas sobre las vistas.
