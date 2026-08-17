USE campuslands_mysql;

-- 1. Reporte resumen por usuario: reproducciones, tiempo total y duracion promedio
SELECT usuario,
       COUNT(*) AS total_reproducciones,
       SUM(duracion_seg) AS segundos_totales,
       AVG(duracion_seg) AS duracion_promedio
FROM reproducciones_intermedio
GROUP BY usuario
ORDER BY segundos_totales DESC;

-- 2. Reporte con ROLLUP: segundos escuchados por genero, con el total general
SELECT
  COALESCE(genero, 'TOTAL GENERAL') AS genero,
  SUM(duracion_seg) AS segundos_escuchados
FROM reproducciones_intermedio
GROUP BY genero WITH ROLLUP;

-- 3. Ratio reproducciones completadas / saltadas por usuario (mientras mas alto, mejor retencion)
SELECT usuario,
       SUM(CASE WHEN completada = TRUE THEN 1 ELSE 0 END) AS completadas,
       SUM(CASE WHEN completada = FALSE THEN 1 ELSE 0 END) AS saltadas,
       ROUND(SUM(CASE WHEN completada = TRUE THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN completada = FALSE THEN 1 ELSE 0 END), 0), 2) AS ratio_completadas_saltadas
FROM reproducciones_intermedio
GROUP BY usuario
ORDER BY ratio_completadas_saltadas DESC;

-- 4. Reporte mensual de tiempo escuchado (todos los usuarios)
SELECT MONTHNAME(fecha_reproduccion) AS mes, SUM(duracion_seg) AS segundos_escuchados
FROM reproducciones_intermedio
GROUP BY MONTH(fecha_reproduccion), MONTHNAME(fecha_reproduccion)
ORDER BY MONTH(fecha_reproduccion);

-- 5. Porcentaje de reproducciones completadas, sobre el total de reproducciones
SELECT
  COUNT(*) AS total_reproducciones,
  SUM(CASE WHEN completada = TRUE THEN 1 ELSE 0 END) AS reproducciones_completadas,
  ROUND(SUM(CASE WHEN completada = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS porcentaje_completadas
FROM reproducciones_intermedio;

-- 6. Ranking de usuarios por tiempo total escuchado
SELECT usuario, segundos_totales,
       (SELECT COUNT(DISTINCT r.usuario)
        FROM (
          SELECT usuario, SUM(duracion_seg) AS segundos_totales
          FROM reproducciones_intermedio
          GROUP BY usuario
        ) r
        WHERE r.segundos_totales > resumen.segundos_totales) + 1 AS posicion
FROM (
  SELECT usuario, SUM(duracion_seg) AS segundos_totales
  FROM reproducciones_intermedio
  GROUP BY usuario
) resumen
ORDER BY posicion;
