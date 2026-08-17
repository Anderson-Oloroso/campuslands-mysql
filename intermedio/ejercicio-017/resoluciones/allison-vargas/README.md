# Resolución Ejercicio 017 (Intermedio) - LEFT JOIN en Tienda de Ropa

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Conceptos Aplicados
* **Consultas de Inclusión Total (LEFT JOIN)**: Obtención de todo el catálogo de productos_ropa_left asegurando mostrar prendas sin transacciones en detalle_ventas_left.
* **Tratamiento de Nulos**: Uso de COALESCE para reordenar datos de reporte y convertir NULL en ceros o textos descriptivos.

## Estructura de Ejecución
1. ddl/schema.sql: Creación del esquema con clave foránea.
2. dml/inserts.sql: Carga de catálogo e inserción de ventas parciales.
3. dql/consultas.sql: 5 consultas para auditar ventas e inventarios sin salida de stock.
