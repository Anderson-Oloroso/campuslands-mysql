# Resolución Ejercicio 013 (Básico) - Filtros por Estado en Películas de Miedo

**Estudiante:** Allison Vargas  
**Nivel:** Básico Inicial  

## Conceptos Aplicados
* **Filtros por Estado (WHERE estado = ...)**: Clasificación por disponibilidad (disponible, proximamente, rchivada, estringida).
* **Condicionales Compuestas**: Uso de operadores IN, AND, y OR combinando estados y calificaciones.

## Estructura de Ejecución
1. ddl/schema.sql: Definición de la tabla peliculas_miedo con tipo ENUM para el estado.
2. dml/inserts.sql: Carga de 8 registros de prueba.
3. dql/consultas.sql: 5 consultas con lógica de filtrado por estado.
