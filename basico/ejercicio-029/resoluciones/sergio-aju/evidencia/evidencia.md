# Ejercicio 029 - Fechas Básicas para Marketplace de Accesorios

Solución de nivel básico enfocada en la gestión, filtrado y análisis de **fechas y rangos temporales** en MySQL para un marketplace de accesorios, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `pedidos_marketplace` con restricciones `CHECK` para precios y cantidades positivas, y campos estructurados con tipos de fecha `DATE`.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con fechas variadas distribuidas entre junio, julio y agosto de 2026 para probar filtros cronológicos.
- `dql/consultas.sql`: Implementación de 5 consultas clave utilizando filtros por rangos de fecha (`>=`, `<=`, `<`), funciones de agregación (`COUNT`, `SUM`), ordenamientos cronológicos y funciones de fecha (`DATEDIFF`).

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura y restricciones de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la correcta aplicación de los filtros temporales y reportes de pedidos.

## Decisiones Técnicas
- **Tipado de Fechas**: Uso del tipo estándar `DATE` para almacenar los registros temporales de los pedidos, facilitando comparaciones de rangos y operaciones de ordenamiento cronológico.
- **Validaciones de Integridad**: Inclusión de restricciones para asegurar que los valores monetarios y las cantidades de accesorios adquiridos sean lógicos y positivos.