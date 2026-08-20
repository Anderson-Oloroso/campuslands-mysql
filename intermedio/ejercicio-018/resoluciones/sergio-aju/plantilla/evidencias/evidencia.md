# Solución Ejercicio 018 (Intermedio) - GROUP BY Viajes y Turismo

## Descripción
Solución del ejercicio intermedio enfocado en la aplicación de funciones de agregación (`COUNT`, `AVG`, `MAX`, `SUM`) combinadas con `GROUP BY` y `HAVING` para consultar indicadores de negocio en un catálogo de viajes y turismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla `paquetes_turisticos`.
2. Ejecuta `dml/inserts.sql` para poblar los registros de prueba.
3. Ejecuta `dql/consultas.sql` para verificar las consultas agregadas.

---

## Evidencia de Resultados

### Consulta 1: Resumen por categoría de viaje
| categoria  | total_paquetes | precio_promedio | mejor_puntaje |
|------------|----------------|-----------------|---------------|
| Cultural   | 2              | 420.00          | 4.90          |
| Ecoturismo | 1              | 280.00          | 4.60          |
| Playa      | 3              | 720.00          | 4.75          |
| Aventura   | 1              | 620.00          | 4.85          |

### Consulta 3: Categorías con precio promedio superior a $400.00 (HAVING)
| categoria | cantidad | precio_promedio |
|-----------|----------|-----------------|
| Cultural  | 2        | 420.00          |
| Playa     | 3        | 720.00          |
| Aventura  | 1        | 620.00          |