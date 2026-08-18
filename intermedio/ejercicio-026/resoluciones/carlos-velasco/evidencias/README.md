# Ejercicio 026 - CHECK para videojuego RPG

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `personajes_rpg`.
- Se aplicaron restricciones `CHECK` para validar nivel, vida, maná, fuerza y defensa.
- Se utilizaron `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `UNSIGNED` y `ENUM`.
- Se insertaron 10 personajes con diferentes clases, niveles y estadísticas.
- Las consultas utilizan filtros, ordenamientos, `LIMIT` y funciones de agregación.