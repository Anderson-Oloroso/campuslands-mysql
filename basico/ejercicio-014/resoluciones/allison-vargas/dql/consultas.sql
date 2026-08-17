-- DQL: Consultas utilizando funciones de fecha (YEAR, DATEDIFF, TIMESTAMPDIFF)
USE campuslands_mysql;

-- 1. Listado de entregas calculando la antigüedad en años desde su estreno
SELECT 
    titulo,
    director,
    fecha_estreno,
    YEAR(fecha_estreno) AS anio_estreno,
    TIMESTAMPDIFF(YEAR, fecha_estreno, CURDATE()) AS antiguedad_anios
FROM entregas_scifi
ORDER BY fecha_estreno ASC;

-- 2. Entregas estrenadas a partir del año 2000
SELECT 
    titulo,
    director,
    fecha_estreno,
    FORMAT(recaudacion_usd, 2) AS recaudacion_usd
FROM entregas_scifi
WHERE YEAR(fecha_estreno) >= 2000
ORDER BY fecha_estreno DESC;

-- 3. Entregas estrenadas en un mes específico (ejemplo: estrenos de verano u otoño en octubre/noviembre/diciembre)
SELECT 
    titulo,
    director,
    MONTHNAME(fecha_estreno) AS mes_estreno,
    DAY(fecha_estreno) AS dia_estreno
FROM entregas_scifi
WHERE MONTH(fecha_estreno) IN (10, 11, 12)
ORDER BY MONTH(fecha_estreno) ASC;

-- 4. Promedio de recaudación agrupado por década de estreno
SELECT 
    CONCAT(FLOOR(YEAR(fecha_estreno) / 10) * 10, 's') AS decada,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(recaudacion_usd), 2) AS recaudacion_promedio
FROM entregas_scifi
GROUP BY decada
ORDER BY decada ASC;

-- 5. Días transcurridos desde el estreno de cada película hasta la fecha actual
SELECT 
    titulo,
    fecha_estreno,
    DATEDIFF(CURDATE(), fecha_estreno) AS dias_desde_estreno
FROM entregas_scifi
ORDER BY dias_desde_estreno DESC;
