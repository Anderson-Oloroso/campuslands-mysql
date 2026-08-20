# Ejercicio 015 - Carga de datos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se diseñaron dos tablas: `videojuegos` y `prestamos`.
- Se estableció una relación mediante `FOREIGN KEY` para registrar qué videojuego fue prestado.
- Se aplicaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho videojuegos y ocho registros de préstamos con datos realistas.
- Se incluyeron consultas para validar la carga de datos, consultar préstamos activos y generar reportes básicos.