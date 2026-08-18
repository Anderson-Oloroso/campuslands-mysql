-- 1. Reporte: Total personajes por tipo
SELECT tipo, COUNT(*) AS total, AVG(nivel) AS nivel_prom
FROM `ejercicio-057-int-personajes`
GROUP BY tipo;

-- 2. Reporte: Top 3 por misiones completadas
SELECT nombre, tipo, misiones_completadas
FROM `ejercicio-057-int-personajes`
ORDER BY misiones_completadas DESC LIMIT 3;

-- 3. Reporte: Estadísticas generales
SELECT 
    COUNT(*) AS total_personajes,
    AVG(nivel) AS nivel_promedio,
    MAX(ataque) AS ataque_maximo,
    SUM(misiones_completadas) AS misiones_totales
FROM `ejercicio-057-int-personajes`;