# Resolucion - Ejercicio 018 (Basico) - Selvin Lem

## Tematica
Viajes y turismo

## Analisis breve
Se modela el catalogo de destinos en la tabla destinos_turisticos,
con id_destino como PRIMARY KEY definida de forma explicita
(CONSTRAINT pk_destino_turistico) para practicar la clave primaria
de forma clara. Se incluye un destino sin cupos disponibles como
caso limite para probar el filtro de agotados.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear destinos_turisticos.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   filtros, AVG, busqueda por PRIMARY KEY y ordenamientos.
