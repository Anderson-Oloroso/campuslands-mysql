# Resolucion - Ejercicio 016 (Basico) - Selvin Lem

## Tematica
Restaurante de comida urbana

## Analisis breve
Se modela el menu del restaurante en una sola tabla, con categoria
como ENUM para practicar CREATE TABLE con validaciones simples
(CHECK en precio y control de disponibilidad). Se incluyen
platillos no disponibles como caso limite para probar el filtro de
disponible = 'no'.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear basico_ejercicio_016.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   filtros, AVG, COUNT y ordenamientos.
