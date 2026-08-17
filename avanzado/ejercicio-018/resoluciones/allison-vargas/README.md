# Resolución Ejercicio 018 (Avanzado) - Funciones SQL en Viajes y Turismo

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Funciones Almacenadas (STORED FUNCTIONS)**: Definición de calcular_dias_viaje usando DATEDIFF y calcular_precio_con_descuento para lógica condicional de precios según tamaño del grupo.
* **Integración en DML y DQL**: Uso directo de funciones en sentencias INSERT y consultas de reporte.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de esquema y funciones con sintaxis DELIMITER.
2. dml/inserts.sql: Carga de catálogo de viajes e inserción de reservas con llamados a las funciones.
3. dql/consultas.sql: 5 consultas analíticas de reservas, ingresos y estadías.
