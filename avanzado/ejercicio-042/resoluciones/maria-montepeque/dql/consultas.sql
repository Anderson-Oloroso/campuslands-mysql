USE campuslands_mysql;

-- 1. RANK de usuarios por segundos totales escuchados (todas las reproducciones)
WITH tiempo_total AS (
  SELECT usuario, SUM(segundos_escuchados) AS segundos_totales
  FROM reproducciones_avanzado
  GROUP BY usuario
)
SELECT usuario, segundos_totales,
       RANK() OVER (ORDER BY segundos_totales DESC) AS posicion
FROM tiempo_total;

-- 2. Reproduccion con mas segundos escuchados de cada usuario para cada
-- cancion (ROW_NUMBER + particion)
SELECT usuario, cancion, segundos_escuchados, resultado, fecha
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY usuario, cancion ORDER BY segundos_escuchados DESC) AS rn
  FROM reproducciones_avanzado
) t
WHERE rn = 1
ORDER BY usuario, cancion;

-- 3. Segundos escuchados acumulados por usuario a lo largo del tiempo (suma corrida)
SELECT usuario, cancion, fecha, segundos_escuchados,
       SUM(segundos_escuchados) OVER (
         PARTITION BY usuario ORDER BY fecha
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS segundos_acumulados
FROM reproducciones_avanzado
ORDER BY usuario, fecha;

-- 4. Comparacion de segundos escuchados contra la reproduccion anterior del mismo usuario (LAG)
SELECT usuario, cancion, fecha, segundos_escuchados,
       LAG(segundos_escuchados) OVER (PARTITION BY usuario ORDER BY fecha) AS segundos_reproduccion_anterior,
       segundos_escuchados - LAG(segundos_escuchados) OVER (PARTITION BY usuario ORDER BY fecha) AS diferencia_segundos
FROM reproducciones_avanzado
ORDER BY usuario, fecha;

-- 5. Cuartiles de reproducciones segun los segundos escuchados (NTILE)
SELECT usuario, cancion, segundos_escuchados,
       NTILE(4) OVER (ORDER BY segundos_escuchados) AS cuartil
FROM reproducciones_avanzado
ORDER BY segundos_escuchados;

-- 6. Promedio movil de segundos escuchados en las ultimas 2 reproducciones de cada usuario
SELECT usuario, cancion, fecha, segundos_escuchados,
       ROUND(AVG(segundos_escuchados) OVER (
         PARTITION BY usuario ORDER BY fecha
         ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ), 1) AS promedio_movil_2_reproducciones
FROM reproducciones_avanzado
ORDER BY usuario, fecha;
