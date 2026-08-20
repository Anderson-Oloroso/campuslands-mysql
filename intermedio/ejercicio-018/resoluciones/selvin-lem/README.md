# Resolucion - Ejercicio 018 (Intermedio)

## Tematica
viajes y turismo

## Analisis breve
Se modela un registro de reservas de viajes en reservas_viajes,
enfocado en practicar GROUP BY: agrupacion por destino, por viajero
y por la combinacion de ambas columnas. Se calculan totales de
reservas, ingresos, promedio de dias y costo promedio por destino,
usando agregaciones simples (COUNT, SUM, AVG) sobre distintos
niveles de agrupacion.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear reservas_viajes.
2. Ejecutar `dml/inserts.sql` para insertar 10 registros de prueba.
3. Ejecutar `dql/consultas.sql` para correr las consultas agrupadas
   por destino, viajero y ambas columnas.
