# Ejercicio 014 - Vistas simples

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `sagas` para almacenar la información de las sagas de ciencia ficción.
- Se implementaron dos vistas:
  - `vista_sagas_activas`
  - `vista_sagas_recientes`
- Se aplicaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con datos realistas.
- Las consultas permiten validar tanto la información de la tabla como el funcionamiento de las vistas.