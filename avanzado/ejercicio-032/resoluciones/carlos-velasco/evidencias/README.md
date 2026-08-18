# Ejercicio 032 - Procedimientos almacenados para ranking battle royale

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores_battle_royale` con 10 registros.
- Se aplicaron `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se incluyeron consultas de filtros, ranking, agregaciones y cálculos.
- Se implementaron los procedimientos `sp_obtener_ranking` y `sp_resumen_jugador`.
- Se utilizaron parámetros de entrada para hacer reutilizables los procedimientos.