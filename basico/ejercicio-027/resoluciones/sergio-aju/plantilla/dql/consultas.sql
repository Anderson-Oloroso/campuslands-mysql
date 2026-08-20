USE campuslands_mysql;

-- 1. Listado de misiones completadas ordenadas por recompensa de mayor a menor
SELECT nombre_mision, region, dificultad, recompensa_oro, fecha_limite 
FROM misiones_aventura 
WHERE estado = 'completada'
ORDER BY recompensa_oro DESC;

-- 2. Resumen por región: Total de misiones y oro total acumulado por región
SELECT region, COUNT(*) AS total_misiones, SUM(recompensa_oro) AS oro_total_region
FROM misiones_aventura
GROUP BY region
ORDER BY oro_total_region DESC;

-- 3. Misiones pendientes o en progreso ordenadas por fecha límite más cercana
SELECT nombre_mision, region, dificultad, estado, fecha_limite 
FROM misiones_aventura 
WHERE estado IN ('pendiente', 'en_progreso') 
  AND fecha_limite IS NOT NULL
ORDER BY fecha_limite ASC;

-- 4. Top 3 misiones con la recompensa de oro más alta (independientemente del estado)
SELECT nombre_mision, region, dificultad, recompensa_oro, estado 
FROM misiones_aventura 
ORDER BY recompensa_oro DESC 
LIMIT 3;

-- 5. Listado general de misiones agrupadas por nivel de dificultad con su respectivo promedio de recompensa
SELECT dificultad, COUNT(*) AS cantidad_misiones, AVG(recompensa_oro) AS recompensa_promedio
FROM misiones_aventura
GROUP BY dificultad
ORDER BY recompensa_promedio DESC;