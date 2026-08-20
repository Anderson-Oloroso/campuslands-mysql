USE campuslands_mysql;

-- 1. Reporte de rendimiento por región: Conteo de misiones, oro total acumulado y tiempo promedio de juego
SELECT 
    region, 
    COUNT(*) AS total_misiones, 
    SUM(recompensa_oro) AS oro_total_region, 
    AVG(tiempo_estimado_min) AS tiempo_promedio_min
FROM misiones_aventura_intermedio
GROUP BY region
ORDER BY oro_total_region DESC;

-- 2. Reporte de eficiencia (Oro por minuto) para misiones completadas o en progreso
SELECT 
    nombre_mision, 
    region, 
    dificultad, 
    recompensa_oro, 
    tiempo_estimado_min, 
    ROUND(recompensa_oro / tiempo_estimado_min, 2) AS oro_por_minuto
FROM misiones_aventura_intermedio
WHERE estado IN ('completada', 'en_progreso')
ORDER BY oro_por_minuto DESC;

-- 3. Reporte de misiones agrupadas por nivel de dificultad con indicadores clave de negocio
SELECT 
    dificultad, 
    COUNT(*) AS cantidad_misiones, 
    MIN(recompensa_oro) AS recompensa_minima, 
    MAX(recompensa_oro) AS recompensa_maxima, 
    AVG(recompensa_oro) AS recompensa_promedio
FROM misiones_aventura_intermedio
GROUP BY dificultad
ORDER BY recompensa_promedio DESC;

-- 4. Top 3 misiones de mayor valor estratégico (mayor recompensa de oro sin importar su estado)
SELECT 
    nombre_mision, 
    region, 
    dificultad, 
    recompensa_oro, 
    estado 
FROM misiones_aventura_intermedio 
ORDER BY recompensa_oro DESC 
LIMIT 3;

-- 5. Reporte de seguimiento para misiones pendientes o bloqueadas ordenadas por fecha límite
SELECT 
    nombre_mision, 
    region, 
    dificultad, 
    estado, 
    fecha_limite 
FROM misiones_aventura_intermedio 
WHERE estado IN ('pendiente', 'bloqueada') 
  AND fecha_limite IS NOT NULL
ORDER BY fecha_limite ASC;