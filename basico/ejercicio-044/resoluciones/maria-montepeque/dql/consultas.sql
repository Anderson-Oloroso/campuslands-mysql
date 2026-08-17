USE campuslands_mysql;

-- 1. Peliculas ordenadas por inicio de rodaje, con los dias que tomo (o tomara) la produccion
SELECT titulo, fecha_inicio_rodaje, fecha_estreno,
       DATEDIFF(fecha_estreno, fecha_inicio_rodaje) AS dias_de_produccion
FROM peliculas_saga_basico
ORDER BY fecha_inicio_rodaje;

-- 2. Peliculas cuyo rodaje inicio en enero de 2026
SELECT titulo, fecha_inicio_rodaje, estado
FROM peliculas_saga_basico
WHERE fecha_inicio_rodaje BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha_inicio_rodaje;

-- 3. Peliculas por mes de inicio de rodaje (usando YEAR y MONTH para agrupar)
SELECT YEAR(fecha_inicio_rodaje) AS anio, MONTH(fecha_inicio_rodaje) AS mes, COUNT(*) AS total_peliculas
FROM peliculas_saga_basico
GROUP BY YEAR(fecha_inicio_rodaje), MONTH(fecha_inicio_rodaje)
ORDER BY anio, mes;

-- 4. Fecha limite real de estreno, agregando 30 dias extra de margen (DATE_ADD)
SELECT titulo, fecha_estreno,
       DATE_ADD(fecha_estreno, INTERVAL 30 DAY) AS fecha_limite_con_margen
FROM peliculas_saga_basico
WHERE estado IN ('en_produccion', 'post_produccion');

-- 5. Peliculas con la produccion mas larga
SELECT titulo, DATEDIFF(fecha_estreno, fecha_inicio_rodaje) AS dias_de_produccion
FROM peliculas_saga_basico
ORDER BY dias_de_produccion DESC
LIMIT 3;

-- 6. Peliculas en produccion o post produccion, ordenadas por lo cerca que esta su estreno
SELECT titulo, estado, fecha_estreno
FROM peliculas_saga_basico
WHERE estado IN ('en_produccion', 'post_produccion')
ORDER BY fecha_estreno ASC;
