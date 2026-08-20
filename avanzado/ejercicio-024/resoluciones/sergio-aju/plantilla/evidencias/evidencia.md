# Ejercicio 024 - Bloqueos para Soldadura

Solución de nivel avanzado enfocada en la gestión de concurrencia y control de transacciones mediante **Bloqueos (Locks)** en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la estructura de la tabla `procesos_soldadura` con validaciones de tipo `ENUM` y `DECIMAL`.
- `dml/inserts.sql`: Inserción de 8 registros con datos técnicos reales de procesos de soldadura.
- `dql/consultas.sql`: Demostración práctica de control de concurrencia (`LOCK TABLES`, `SELECT ... FOR UPDATE`) junto con 5 consultas analíticas orientadas al negocio.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la tabla.
2. Ejecutar el archivo `inserts.sql` para cargar los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para revisar las transacciones con bloqueos y los reportes analíticos.

## Decisiones Técnicas
- **Control de Concurrencia**: Se documentaron e incluyeron ejemplos de bloqueos a nivel de fila (`FOR UPDATE`) y de tabla (`LOCK TABLES`) para garantizar la consistencia en entornos con múltiples operaciones simultáneas de inventario.
- **Precisión Numérica**: Uso de `DECIMAL(10,2)` para el control de inventario de material de soldadura en kilogramos.