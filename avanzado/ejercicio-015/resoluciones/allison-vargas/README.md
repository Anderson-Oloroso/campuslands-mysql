# Resolución Ejercicio 015 (Avanzado) - Optimización e Índices en Biblioteca Gamer

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Indexación Compuesta**: Creación de idx_plataforma_estado y idx_genero_puntaje para acelerar filtros recurrentes.
* **Planes de Ejecución**: Uso de EXPLAIN para verificar la selección de índices y evitar escaneos completos de tabla (ALL table scan).

## Estructura de Ejecución
1. ddl/schema.sql: Creación de la tabla biblioteca_juegos e índices de rendimiento.
2. dml/inserts.sql: Carga de 9 videojuegos de distintas plataformas.
3. dql/consultas.sql: Consultas optimizadas con diagnóstico EXPLAIN.
