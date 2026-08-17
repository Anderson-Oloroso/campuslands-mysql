# Ejercicio 033 - Funciones SQL para Inventario de Skins Shooter

## Descripción
Solución avanzada en MySQL centrada en la creación y uso de **funciones almacenadas (STORED FUNCTIONS)** para el cálculo dinámico de valorización, aplicación de descuentos por rareza y gestión de un inventario de skins en un videojuego tipo shooter.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de skins (skins_shooter) con restricciones estrictas y definición de una función SQL personalizada.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de skins con precios, desgaste y rarezas variadas.
- dql/consultas.sql: 5 consultas analíticas avanzadas que explotan la función personalizada, cálculos matemáticos y reportes de inventario.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
