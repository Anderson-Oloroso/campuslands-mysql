-- Consultas con subconsultas sobre citas_tatuajes.
USE campuslands_mysql;

-- 1. Listado general ordenado por fecha
SELECT * FROM citas_tatuajes
ORDER BY fecha_cita;

-- 2. Citas con precio mayor al promedio general (subconsulta escalar en WHERE)
SELECT cliente, artista, precio
FROM citas_tatuajes
WHERE precio > (SELECT AVG(precio) FROM citas_tatuajes)
ORDER BY precio DESC;

-- 3. Artista con mas citas completadas (subconsulta en FROM)
SELECT artista, total_completadas
FROM (
  SELECT artista, COUNT(*) AS total_completadas
  FROM citas_tatuajes
  WHERE estado = 'completada'
  GROUP BY artista
) AS resumen_artistas
ORDER BY total_completadas DESC
LIMIT 1;

-- 4. Ingresos reales (solo citas completadas), sin distorsion por canceladas
SELECT SUM(precio) AS ingresos_reales
FROM citas_tatuajes
WHERE estado = 'completada';

-- 5. Clientes cuyo gasto en citas completadas supera el promedio de gasto
-- por cliente (subconsulta correlacionada mediante tabla derivada)
SELECT cliente, gasto_total
FROM (
  SELECT cliente, SUM(precio) AS gasto_total
  FROM citas_tatuajes
  WHERE estado = 'completada'
  GROUP BY cliente
) AS gasto_por_cliente
WHERE gasto_total > (
  SELECT AVG(gasto_total) FROM (
    SELECT cliente, SUM(precio) AS gasto_total
    FROM citas_tatuajes
    WHERE estado = 'completada'
    GROUP BY cliente
  ) AS gasto_promedio_interno
)
ORDER BY gasto_total DESC;
