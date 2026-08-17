# Ejercicio 034 - HAVING para Garaje de Motos

## Descripción
Solución intermedia en MySQL enfocada en el uso avanzado de funciones de agregación combinadas con la cláusula HAVING para filtrar grupos de registros basados en métricas financieras y operativas del garaje de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (motos_garaje) con restricciones estrictas de validación.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de motocicletas con sus marcas, cilindradas, costos y estados variados.
- dql/consultas.sql: 5 consultas analíticas intermedias que explotan agrupamientos (GROUP BY) y filtrado avanzado de grupos (HAVING) con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
