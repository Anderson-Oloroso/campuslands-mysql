# Ejercicio 030 - Optimización para Equipo de Streaming

Solución de nivel avanzado enfocada en las mejores prácticas de **optimización de bases de datos y rendimiento en MySQL** para la gestión de inventarios y transacciones de equipos de streaming, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, tablas optimizadas con tipos de datos estrictos, restricciones `CHECK` y la implementación estratégica de **índices avanzados** (índices compuestos `idx_categoria_estado`, índices de ordenamiento `idx_precio` e índices temporales `idx_fecha`) para acelerar las búsquedas y reducir el costo de las consultas.
- `dml/inserts.sql`: Carga inicial estructurada de registros en el inventario y transacciones comerciales para permitir pruebas reales de rendimiento.
- `dql/consultas.sql`: Implementación de 5 consultas optimizadas, incluyendo el uso de la sentencia `EXPLAIN` para auditar planes de ejecución, uso de índices compuestos, agregaciones eficientes y límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura optimizada y los índices del servidor.
2. Ejecutar el archivo `inserts.sql` para poblar los registros de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el rendimiento de las consultas analíticas y el uso de planes de ejecución (`EXPLAIN`).

## Decisiones Técnicas
- **Indexación Estratégica**: Se crearon índices compuestos en columnas de alta selectividad (`categoria` y `estado`) para optimizar consultas de filtrado múltiple sin requerir escaneos completos de tabla (*Full Table Scans*).
- **Auditoría de Rendimiento**: Incorporación de consultas con `EXPLAIN` para verificar empíricamente que el motor de MySQL aprovecha de forma óptima las estructuras de índices definidas.