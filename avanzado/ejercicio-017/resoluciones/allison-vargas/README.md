# Resolución Ejercicio 017 (Avanzado) - Procedimientos Almacenados en Tienda de Ropa

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Procedimientos Almacenados (STORED PROCEDURES)**: Implementación de egistrar_venta_ropa para validar stock, registrar ventas y descontar inventario en una única llamada, y eabastecer_stock_ropa para reposición.
* **Manejo de Excepciones**: Uso de SIGNAL SQLSTATE para evitar ventas con stock insuficiente.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de tablas y procedimientos con DELIMITER.
2. dml/inserts.sql: Carga de catálogo y llamadas CALL a los procedimientos.
3. dql/consultas.sql: Consultas analíticas para verificar resultados.
