# Resolución Ejercicio 021 (Intermedio) - 1FN en Dibujo Digital

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Aplicado  

## Conceptos Aplicados
* **Primera Forma Normal (1FN)**:
  * Eliminación de campos no atómicos (listas de etiquetas separadas por comas).
  * Descomposición mediante la tabla de detalle etiquetas_obras.
  * Definición de claves primarias y foráneas con restricciones UNIQUE.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de las tablas obras_dibujo_1fn y etiquetas_obras.
2. dml/inserts.sql: Carga de obras y sus etiquetas atómicas.
3. dql/consultas.sql: 5 consultas analíticas sobre los datos normalizados.
