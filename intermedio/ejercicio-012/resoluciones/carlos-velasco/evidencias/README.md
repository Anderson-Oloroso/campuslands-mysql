# Ejercicio 012 - consultas de reportes para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

Se diseñó una tabla única llamada `canciones` porque el ejercicio está enfocado en la creación de consultas de reportes. Se aplicaron restricciones `PRIMARY KEY`, `UNIQUE`, `CHECK`, `DEFAULT` y `ENUM` para garantizar la integridad de los datos. Las consultas generan reportes utilizando filtros, ordenamientos, agrupaciones, funciones de agregación y rankings que permiten analizar la información de la playlist.