# Ejercicio 056 - CTE para videojuego RPG

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `personajes_rpg` con `PRIMARY KEY`, `UNIQUE`, `ENUM` y restricciones `CHECK`.
- Se insertaron 12 personajes con diferentes clases, niveles y estados.
- Se utilizaron CTE con `WITH` para filtrar, calcular estadísticas, agrupar datos y generar rankings.
- Se utilizó una función de ventana `ROW_NUMBER()` para obtener el top 5 por poder.