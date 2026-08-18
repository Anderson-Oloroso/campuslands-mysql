# Ejercicio 044 - Event Scheduler para saga de ciencia ficción

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_ciencia_ficcion`.
- Se creó `auditoria_estados` para registrar cambios de estado.
- Se utilizaron `NOT NULL`, `UNIQUE`, claves primaria y foránea y restricciones `CHECK`.
- Se insertaron 8 películas.
- Se implementó un `EVENT` diario para retirar películas con más de 10 años.
- Se implementó un trigger para auditar los cambios producidos por el evento.
- Se utilizaron `CURRENT_DATE`, `INTERVAL`, `UPDATE`, `COUNT`, `SHOW EVENTS` y `SHOW CREATE EVENT`.