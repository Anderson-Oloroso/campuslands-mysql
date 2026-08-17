# Ejercicio 033 - PRIMARY KEY para Inventario de Skins Shooter

## Descripción
Solución básica en MySQL centrada en la aplicación correcta de la restricción PRIMARY KEY y la identificación unívoca de registros para un inventario de skins en un videojuego tipo shooter.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (skins_shooter) utilizando una clave primaria autoincremental y restricciones de validación.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de skins con precios, rarezas y estados de inventario.
- dql/consultas.sql: 5 consultas básicas enfocadas en filtrado por rareza, ordenamiento por precio y reportes agrupados con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
