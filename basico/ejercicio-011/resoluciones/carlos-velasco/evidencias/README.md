# Ejercicio 011 - Validaciones simples

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores` para almacenar la información de los participantes.
- Se aplicaron validaciones mediante `CHECK` para controlar que la edad sea mayor o igual a 8 años y que el ranking sea mayor que cero.
- Se utilizaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con datos realistas.
- Se agregaron consultas para comprobar los registros y validar el funcionamiento de las restricciones.