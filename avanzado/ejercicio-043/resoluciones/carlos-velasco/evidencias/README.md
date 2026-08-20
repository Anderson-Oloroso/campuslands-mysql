# Ejercicio 043 - JSON en MySQL para catalogo de peliculas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_miedo`.
- Se utilizó una columna `JSON` para almacenar información adicional de cada película.
- Se aplicaron restricciones `CHECK` para puntuación, año y validez del JSON.
- Se insertaron 10 registros con información JSON sobre país, idioma, duración, plataformas, premios y clasificación.
- Se utilizaron `JSON_OBJECT`, `JSON_ARRAY`, `JSON_EXTRACT`, `JSON_UNQUOTE` y `JSON_CONTAINS`.