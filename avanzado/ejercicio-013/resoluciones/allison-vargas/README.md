# Resolución Ejercicio 013 (Avanzado) - JSON en MySQL para Catálogo de Terror

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Tipo de Dato JSON**: Almacenamiento de metadatos semiestructurados (subgéneros, listas de subtítulos, métricas de IMDb).
* **Operadores y Funciones JSON**: Uso de ->>, JSON_CONTAINS(), JSON_VALID() y parseo de tipos con CAST().

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la tabla con restricción de formato JSON_VALID.
2. dml/inserts.sql: Carga de 8 películas con documentos JSON.
3. dql/consultas.sql: 5 consultas analíticas sobre atributos embebidos.
