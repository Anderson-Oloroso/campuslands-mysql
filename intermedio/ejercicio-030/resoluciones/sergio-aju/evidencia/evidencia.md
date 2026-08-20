# Ejercicio 030 - Carga de Datos para Equipo de Streaming

Solución de nivel intermedio enfocada en la estructuración, **carga masiva y eficiente de datos (Bulk Data Management)** en MySQL para un sistema de gestión de inventarios enfocado en equipos de streaming, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla de soporte de ubicaciones (`bodegas_streaming`) y la tabla principal de inventario (`inventario_streaming`) equipada con restricciones de integridad relacional, validaciones `CHECK` financieras y control de stock.
- `dml/inserts.sql`: Carga masiva estructurada de registros (3 bodegas y 8 equipos tecnológicos especializados) diseñada para probar filtros por categoría, márgenes de ganancia y estados operativos.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas avanzadas utilizando múltiples `JOIN`, cálculos de márgenes comerciales, agregaciones financieras (`SUM`, `AVG`), filtros por umbrales de stock y reportes de inventario con límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura de tablas y sus restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para realizar la carga masiva y estructurada de los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para validar los reportes de inventario y los indicadores de negocio.

## Decisiones Técnicas
- **Estructura de Carga Masiva**: Se diseñaron inserciones multi-fila estructuradas que garantizan la consistencia relacional con las llaves foráneas de bodegas, facilitando la auditoría y revisión por parte de otros desarrolladores.
- **Precisión Financiera**: Uso estricto de tipos `DECIMAL(10,2)` para los costos de adquisición y precios de venta al público, permitiendo calcular márgenes de ganancia exactos mediante consultas analíticas.