## Ejericio 011 Avanzado.

## Descripción

Uso de CTE en este ejericio<br>

¿ Que hace?<br>
Una Expresión de Tabla Común (CTE) en MySQL es un conjunto de resultados temporal con nombre definido mediante la cláusula WITH, diseñado para simplificar consultas complejas dividiéndolas en pasos lógicos más manejables.

Ejemplo:

```sql
    USE campuslands_mysql;

WITH resumen_categoria AS (
    SELECT
        categoria,
        COUNT(*) AS total_registros,
        AVG(puntaje) AS promedio_puntaje,
        MAX(puntaje) AS puntaje_maximo,
        MIN(puntaje) AS puntaje_minimo
    FROM avanzado_ejercicio_011
    GROUP BY categoria
)
SELECT
    categoria,
    total_registros,
    ROUND(promedio_puntaje, 2) AS promedio_puntaje,
    puntaje_maximo,
    puntaje_minimo
FROM resumen_categoria
ORDER BY promedio_puntaje DESC;
```