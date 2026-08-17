# Resolución Ejercicio 006 (Avanzado) - EXPLAIN Autos Hiperdeportivos

**Estudiante:** Allison Vargas  
**Nivel:** Avanzado Inicial  

## Descripción
Uso de la herramienta `EXPLAIN` en MySQL para evaluar el rendimiento, costo de escaneo de filas y uso de índices (`idx_marca`, `idx_estado_precio`) en consultas sobre el inventario de autos hiperdeportivos.

## Estructura
- `ddl/schema.sql`: Definición de la tabla `hiperdeportivos_avanzado` e índices estratégicos.
- `dml/inserts.sql`: Inserción de 8 hiperdeportivos para pruebas de volumen.
- `dql/consultas.sql`: 5 consultas antepuestas por `EXPLAIN` para auditar el plan de ejecución de MySQL.
