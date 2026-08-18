# Ejercicio 028 - tablas puente para academia tech

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `estudiantes`, `cursos` e `inscripciones`.
- `inscripciones` funciona como tabla puente entre estudiantes y cursos.
- Se utilizaron claves foráneas y una clave primaria compuesta.
- Se aplicaron `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 8 estudiantes, 6 cursos y 15 inscripciones.
- Las consultas utilizan `JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, subconsultas y agregaciones.