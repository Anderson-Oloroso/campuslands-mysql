# Ejercicio 030 - Relaciones Simples para Equipo de Streaming

Solución de nivel básico enfocada en la implementación de **relaciones simples (Uno a Muchos mediante Foreign Keys)** en MySQL para la gestión de un catálogo de hardware e insumos para equipos de streaming, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla padre `marcas_streaming` y la tabla hija `dispositivos_streaming` con restricciones de integridad referencial (`FOREIGN KEY`), validaciones de precios positivos (`CHECK`) y control de stock.
- `dml/inserts.sql`: Carga inicial de 5 marcas reconocidas del sector y 8 dispositivos tecnológicos variados con distintos estados e inventarios.
- `dql/consultas.sql`: Implementación de 5 consultas estructuradas utilizando operaciones de `JOIN`, funciones de agregación (`COUNT`, `SUM`, `AVG`), filtros por estados y límites de registros.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura relacional y las restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para poblar las tablas con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la extracción de reportes relacionales.

## Decisiones Técnicas
- **Modelado Relacional (Uno a Muchos)**: Se estructuró una relación clara donde múltiples dispositivos pertenecen a una única marca, evitando la redundancia de datos mediante la normalización de la entidad `marcas_streaming`.
- **Integridad y Control**: Uso de tipos monetarios `DECIMAL(10,2)` y restricciones de validación `CHECK` para asegurar que los precios y existencias en inventario mantengan valores coherentes y profesionales.