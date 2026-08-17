# Resolución Ejercicio 016 (Avanzado) - Transacciones en Restaurante de Comida Urbana

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Garantía ACID en Transacciones**: Uso de START TRANSACTION y COMMIT para asegurar la consistencia entre la creación de pedidos, el desglose en detalle y el descuento de stock.
* **Manejo de Claves Foráneas**: Relación pedidos_urbano 1:N detalle_pedidos_urbano 1:N productos_urbano.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la base de datos y esquemas para productos, pedidos y detalle.
2. dml/inserts.sql: Carga del menú y ejecución de bloques transaccionales.
3. dql/consultas.sql: Consultas analíticas de ventas por categoría, inventario e ingresos.
