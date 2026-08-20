# Resolucion - Ejercicio 017 (Basico) - Selvin Lem

## Tematica
Tienda de ropa

## Analisis breve
Se practica variedad de tipos de datos en una sola tabla: ENUM para
talla, VARCHAR para color, DECIMAL para precio, INT para stock,
TINYINT(1) como booleano para disponibilidad en linea, DATE para la
fecha de ingreso y TEXT para la descripcion. Se incluyen productos
con stock en 0 y no disponibles en linea como casos limite para
probar los filtros.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear basico_ejercicio_017.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   filtros, SUM, AVG y ordenamientos.
