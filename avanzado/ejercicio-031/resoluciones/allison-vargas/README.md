# Solución Ejercicio 031 - Torneo Esports MOBA

## Decisiones Técnicas
- Se implementó un esquema relacional con integridad referencial (`FOREIGN KEY`) y restricciones de validación (`CHECK`) para asegurar la consistencia en la duración de las partidas.
- El bloque DML utiliza transacciones explícitas (`START TRANSACTION` y `COMMIT`) para garantizar la atomicidad en la inserción de catálogos y relaciones.
- Las consultas DQL emplean funciones de agregación (`AVG`, `COUNT`), alias descriptivos y subconsultas para reportes gerenciales útiles.

## Orden de Ejecución
1. Ejecutar `ddl/schema.sql`
2. Ejecutar `dml/inserts.sql`
3. Ejecutar `dql/consultas.sql`
