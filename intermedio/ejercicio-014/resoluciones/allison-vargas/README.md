# Resolución Ejercicio 014 (Intermedio) - Vistas Simples en Saga de Ciencia Ficción

**Estudiante:** Allison Vargas  
**Nivel:** Intermedio Inicial  

## Conceptos Aplicados
* **Vistas Simples (CREATE VIEW)**: Abstracción de filtros recurrentes (ista_personajes_activos) y agrupaciones precalculadas (ista_resumen_facciones).
* **Seguridad y Modularidad**: Ocultamiento de la complejidad de agregación y restricción de estados para consumo directo.

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la tabla personajes_scifi y definición de 2 vistas.
2. dml/inserts.sql: Inserción de 8 personajes de ciencia ficción.
3. dql/consultas.sql: 5 consultas realizando selects directa e indirectamente sobre las vistas.
