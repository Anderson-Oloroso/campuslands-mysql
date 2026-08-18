# Ejercicio 058 - Tablas puente para academia tech

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `estudiantes`, `cursos` e `inscripciones`.
- `inscripciones` funciona como tabla puente entre estudiantes y cursos.
- Se utilizaron claves foráneas y una clave primaria compuesta para evitar duplicar inscripciones.
- Se insertaron 5 estudiantes, 4 cursos y 10 inscripciones.
- Se utilizaron `JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `COUNT` y filtros por estado.