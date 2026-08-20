# Ejercicio 025 - Backup Lógico para Laboratorio de Fórmulas Químicas

Solución de nivel avanzado enfocada en la estrategia y comandos de **Backup Lógico** en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `formulas_quimicas_avanzado` con restricciones `UNIQUE` y tipos de datos estrictos.
- `dml/inserts.sql`: Inserción inicial de 8 registros normalizados con datos técnicos del laboratorio químico.
- `dql/consultas.sql`: Documentación práctica de comandos CLI para respaldos y restauraciones (`mysqldump`), junto con 5 consultas analíticas de negocio.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la base de datos y tablas.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales.
3. Ejecutar los comandos de terminal documentados en `consultas.sql` para practicar el respaldo lógico y validar las consultas analíticas posteriores.

## Decisiones Técnicas
- **Backup Lógico**: Se documentaron los flujos estándar utilizando `mysqldump` para garantizar la persistencia, portabilidad y recuperación ante desastres de la información transaccional.
- **Integridad y Precisión**: Uso de restricciones `UNIQUE` en códigos de referencia y `DECIMAL(10,2)` para el control exacto de mililitros en los compuestos químicos.