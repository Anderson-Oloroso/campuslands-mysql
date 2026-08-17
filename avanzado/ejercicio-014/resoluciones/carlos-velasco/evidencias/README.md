# Ejercicio 014 - Event Scheduler para saga de ciencia ficcion

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Esperar la ejecución del Event Scheduler o verificar el evento mediante `SHOW EVENTS`.
4. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `misiones` y `bitacora_eventos`.
- Se utilizaron claves foráneas, `UNIQUE` y restricciones `CHECK`.
- Se insertaron 8 misiones con diferentes estados, riesgos y fechas.
- Se creó un Event Scheduler que cada minuto finaliza automáticamente las misiones vencidas y registra la acción en la bitácora.
- Las consultas incluyen filtros, agrupaciones, cálculos de duración y validación de las acciones automáticas.