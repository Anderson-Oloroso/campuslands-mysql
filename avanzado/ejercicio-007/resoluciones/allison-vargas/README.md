# Resolución Ejercicio 007 (Avanzado) - Vistas Avanzadas Liga de Fútbol

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Creación de vistas relacionales avanzadas (`vw_tabla_posiciones_resumen` y `vw_top_goleadores_liga`) para agregar estadísticas de rendimiento, cálculo de goles a favor/en contra y tops de goleadores en la Liga de Fútbol.

## Estructura de Ejecución
1. `ddl/schema.sql`: Creación de la base de datos `campuslands_mysql`, tablas relacionales (`equipos`, `jugadores`, `partidos`) y vistas compuestas.
2. `dml/inserts.sql`: Carga de datos reales y coherentes para equipos, jugadores y encuentros deportivos.
3. `dql/consultas.sql`: 5 consultas analíticas que consumen las vistas compuestas y realizan cálculos estadísticos.
