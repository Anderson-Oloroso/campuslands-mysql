# Ejercicio 034 - INSERT para Garaje de Motos

## Descripción
Solución básica en MySQL centrada en la práctica correcta de la sentencia INSERT (tanto inserción explícita de columnas como inserciones múltiples) para la gestión del inventario de un garaje de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (motos_garaje) con tipos de datos estrictos y restricciones de validación.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de motocicletas aplicando distintas sintaxis de INSERT.
- dql/consultas.sql: 5 consultas básicas enfocadas en filtrado por estado, ordenamiento por cilindrada, cálculos y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
