USE campuslands_mysql;

-- 1. promedio de precio y horas por estilo de tatuaje para trabajos completados
SELECT estilo, AVG(precio) AS promedio_precio, AVG(horas_trabajo) AS promedio_horas
FROM tatuajes
WHERE estado = 'completado'
GROUP BY estilo;

-- 2. top 3 tatuajes mejor calificados del estudio
SELECT cliente, estilo, calificacion, precio
FROM tatuajes
WHERE estado = 'completado'
ORDER BY calificacion DESC
LIMIT 3;

-- 3. listado de tatuajes filtrados por un estilo especifico
SELECT cliente, precio, horas_trabajo, calificacion, estado
FROM tatuajes
WHERE estilo = 'realismo';

-- 4. reporte de tatuajes agrupados por su estado actual con conteo total y precio acumulado
SELECT estado, COUNT(*) AS total_tatuajes, SUM(precio) AS ingreso_estimado
FROM tatuajes
GROUP BY estado;

-- 5. tatuajes completados con un precio menor o igual a 400 ordenados por calificacion descendente
SELECT cliente, estilo, precio, horas_trabajo, calificacion
FROM tatuajes
WHERE estado = 'completado' AND precio <= 400.00
ORDER BY calificacion DESC;