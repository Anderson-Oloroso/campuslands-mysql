# Ejercicio 025 - COUNT y SUM para Laboratorio de Fórmulas Químicas

Módulo diseñado para la práctica de funciones de agregación analíticas (`COUNT` y `SUM`) en bases de datos MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `basico_ejercicio_025` con restricciones de tipo `ENUM` y `DECIMAL`.
- `dml/inserts.sql`: Inserción inicial de 8 registros con datos técnicos reales de un laboratorio químico.
- `dql/consultas.sql`: Consultas analíticas enfocadas en el conteo de registros y la suma de volúmenes agrupados por categorías y estados.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la tabla.
2. Ejecutar el archivo `inserts.sql` para cargar los datos de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar los reportes de negocio basados en `COUNT` y `SUM`.

## Decisiones Técnicas
- **Funciones de Agregación**: Se implementó el uso combinado de `COUNT(*)` para cuantificar registros y `SUM(volumen_ml)` para totalizar las cantidades volumétricas de compuestos químicos.
- **Precisión Numérica**: Uso de `DECIMAL(10,2)` para garantizar el manejo exacto de los mililitros en las fórmulas.
- **Restricciones**: Uso de `ENUM` en `tipo_compuesto` y `estado` para mantener la integridad de los datos categóricos.