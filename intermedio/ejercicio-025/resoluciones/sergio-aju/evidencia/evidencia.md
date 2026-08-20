# Ejercicio 025 - UNIQUE para Laboratorio de Fórmulas Químicas

Solución de nivel intermedio enfocada en la implementación de la restricción `UNIQUE` en MySQL para garantizar la unicidad de identificadores de negocio, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `formulas_quimicas` incorporando la restricción `UNIQUE` en el campo `codigo_referencia`.
- `dml/inserts.sql`: Inserción inicial de 8 registros con códigos de referencia únicos y datos técnicos reales de un laboratorio químico.
- `dql/consultas.sql`: Consultas analíticas orientadas al negocio con agregaciones (`COUNT`, `SUM`), filtros, ordenamientos y límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la tabla y restricciones.
2. Ejecutar el archivo `inserts.sql` para cargar los registros de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar los reportes analíticos de inventario químico.

## Decisiones Técnicas
- **Restricción UNIQUE**: Se aplicó sobre el campo `codigo_referencia` para evitar duplicidad de identificadores normalizados en el laboratorio.
- **Precisión Numérica**: Uso de `DECIMAL(10,2)` para asegurar el control exacto del volumen en mililitros.
- **Tipificación Segura**: Uso de `ENUM` para los campos categóricos `tipo_compuesto` y `estado`.