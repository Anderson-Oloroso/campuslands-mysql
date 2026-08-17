-- Consultas de análisis para la biblioteca gamer
USE campuslands_mysql;

-- 1. Resumen de inversión y tiempo: ¿Cuánto dinero y tiempo he invertido en total?
SELECT 
    COUNT(id) AS total_juegos,
    SUM(precio) AS inversion_total_usd,
    SUM(horas_jugadas) AS tiempo_total_horas
FROM ejercicio_015_biblioteca_gamer;

-- 2. Reporte por estado: ¿Cuántos juegos tengo en cada estado y cuál es el promedio de horas jugadas en ellos?
SELECT 
    estado,
    COUNT(*) AS cantidad,
    ROUND(AVG(horas_jugadas), 1) AS promedio_horas
FROM ejercicio_015_biblioteca_gamer
GROUP BY estado
ORDER BY cantidad DESC;

-- 3. Top 3 juegos más jugados (Ranking)
SELECT 
    titulo, 
    plataforma, 
    horas_jugadas AS horas_totales
FROM ejercicio_015_biblioteca_gamer
ORDER BY horas_jugadas DESC
LIMIT 3;

-- 4. Backlog de juegos: ¿Qué juegos tengo pendientes que costaron dinero (excluyendo gratuitos)?
SELECT 
    titulo, 
    genero, 
    precio, 
    fecha_adquisicion
FROM ejercicio_015_biblioteca_gamer
WHERE estado = 'pendiente' AND precio > 0.00
ORDER BY fecha_adquisicion ASC;

-- 5. Análisis de rentabilidad: Costo por hora jugada de los juegos completados
SELECT 
    titulo, 
    precio, 
    horas_jugadas,
    ROUND((precio / horas_jugadas), 2) AS costo_por_hora_usd
FROM ejercicio_015_biblioteca_gamer
WHERE estado = 'completado' AND horas_jugadas > 0
ORDER BY costo_por_hora_usd ASC;