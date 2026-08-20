# Ejercicio 029 - Vistas Simples para Marketplace de Accesorios

Solución de nivel intermedio enfocada en el diseño, creación y explotación de **vistas simples (Views)** en MySQL para la gestión y análisis de datos en un marketplace de accesorios, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, la tabla transaccional `pedidos_marketplace_intermedio` con restricciones `CHECK` para precios y cantidades, y la definición de dos vistas analíticas (`vista_pedidos_activos` y `vista_resumen_ventas_categoria`).
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con datos variados de categorías de accesorios, precios y estados.
- `dql/consultas.sql`: Implementación de 5 consultas estructuradas sobre las vistas creadas para demostrar la reutilización de lógica SQL, filtros, ordenamientos y reportes ejecutivos.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la tabla base, sus restricciones y compilar las vistas.
2. Ejecutar el archivo `inserts.sql` para poblar la base de datos con los registros de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la extracción de información a través de las vistas.

## Decisiones Técnicas
- **Abstracción con Vistas**: Se crearon vistas para encapsular consultas complejas (como cálculos de totales por línea y agregaciones por categorías), simplificando el acceso a la información para otros desarrolladores o reportes de negocio.
- **Integridad y Precisión**: Uso de tipos `DECIMAL(10,2)` para los precios unitarios y restricciones `CHECK` para garantizar que los valores económicos y cuantitativos sean coherentes.