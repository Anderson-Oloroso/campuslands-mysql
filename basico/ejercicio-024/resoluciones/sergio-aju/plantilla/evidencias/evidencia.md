# Ejercicio 024 - DELETE Controlado para Soldadura

Módulo diseñado para la práctica de eliminación segura y controlada de registros en bases de datos MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `basico_ejercicio_024` con validaciones de tipo `ENUM` y `DECIMAL`.
- `dml/inserts.sql`: Inserción inicial de 8 registros con datos técnicos reales de soldadura.
- `dql/consultas.sql`: Sentencias `DELETE` controladas mediante filtros estrictos de estado y 5 consultas analíticas de negocio con ordenamientos y agrupaciones.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la tabla.
2. Ejecutar el archivo `inserts.sql` para cargar los datos de prueba.
3. Ejecutar el archivo `consultas.sql` para aplicar las eliminaciones controladas y verificar los reportes analíticos resultantes.

## Decisiones Técnicas
- **DELETE Seguro**: Se implementaron sentencias de eliminación acompañadas de cláusulas `WHERE` específicas (por estado y llaves primarias) para evitar borrados masivos accidentales.
- **Integridad y Precisión**: Uso de `DECIMAL(10,2)` para el control riguroso del inventario de materiales en kilogramos y restricciones `ENUM` para los estados del proceso.