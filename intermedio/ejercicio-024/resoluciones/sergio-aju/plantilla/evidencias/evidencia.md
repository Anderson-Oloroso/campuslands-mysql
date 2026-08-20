# Ejercicio 024 - FOREIGN KEY para Soldadura

Solución de nivel intermedio enfocada en la implementación de relaciones relacionales mediante **FOREIGN KEY** en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, tablas maestras (`metodos_soldadura`, `tecnicos_soldadura`) y la tabla transaccionales (`procesos_soldadura`) interconectadas por llaves foráneas.
- `dml/inserts.sql`: Carga de datos maestros normalizados y 8 registros transaccionales con especificaciones técnicas de soldadura.
- `dql/consultas.sql`: Consultas analíticas y reportes de negocio utilizando `JOIN`, `GROUP BY`, `ORDER BY` y filtros avanzados.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar los catálogos y transacciones.
3. Ejecutar el archivo `consultas.sql` para verificar los indicadores y reportes de negocio.

## Decisiones Técnicas
- **Normalización**: Se separaron los atributos repetitivos en tablas independientes (`metodos_soldadura` y `tecnicos_soldadura`) aplicando llaves foráneas (`FOREIGN KEY`) para garantizar la integridad referencial y evitar la redundancia de datos.
- **Precisión Numérica**: Uso de `DECIMAL(10,2)` para llevar el control estricto del inventario de materiales en kilogramos.