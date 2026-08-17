# Resolución Ejercicio 012 (Avanzado) - Window Functions en Playlist Musical

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Conceptos Aplicados
* **Window Functions (OVER)**: Uso de ROW_NUMBER(), DENSE_RANK(), SUM() OVER y AVG() OVER con particiones por playlist y género.
* **Cálculos Acumulados y Comparativos**: Análisis de *running totals* de tiempo y participación porcentual sin colapsar las filas.

## Estructura de Ejecución
1. ddl/schema.sql: Definición relacional entre playlists y canciones.
2. dml/inserts.sql: Carga de 9 registros representativos.
3. dql/consultas.sql: 5 consultas analíticas con funciones de ventana.
