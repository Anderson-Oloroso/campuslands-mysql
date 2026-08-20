USE paracaidismo_db;

-- 1. Listado completo de saltos programados y realizados relacionando su modalidad, altura, costo y estado actual
SELECT s.codigo_registro, s.nombre_paracaidista, t.nombre_modalidad, t.altura_salto_pies, s.costo_salto, s.estado_salto
FROM saltos_paracaidismo s
JOIN tipos_salto t ON s.id_tipo_salto = t.id_tipo_salto
ORDER BY s.fecha_salto DESC;

-- 2. Conteo de saltos, costo promedio e ingresos totales agrupados por cada modalidad de paracaidismo
SELECT t.nombre_modalidad AS modalidad, COUNT(s.id_salto) AS total_saltos, ROUND(AVG(s.costo_salto), 2) AS costo_promedio, SUM(s.costo_salto) AS ingresos_totales
FROM tipos_salto t
LEFT JOIN saltos_paracaidismo s ON t.id_tipo_salto = s.id_tipo_salto
GROUP BY t.id_tipo_salto, t.nombre_modalidad
ORDER BY total_saltos DESC;

-- 3. Saltos que se encuentran con estado 'completado' o 'programado' ordenados por duracion de caida libre
SELECT s.codigo_registro, s.nombre_paracaidista, t.nombre_modalidad, s.duracion_caida_libre_seg, s.fecha_salto, s.estado_salto
FROM saltos_paracaidismo s
JOIN tipos_salto t ON s.id_tipo_salto = t.id_tipo_salto
WHERE s.estado_salto IN ('completado', 'programado')
ORDER BY s.duracion_caida_libre_seg DESC;

-- 4. Top 5 de saltos con mayor duracion de caida libre en toda la base de datos de la escuela de paracaidismo
SELECT s.codigo_registro, s.nombre_paracaidista, t.nombre_modalidad, t.altura_salto_pies, s.duracion_caida_libre_seg, s.estado_salto
FROM saltos_paracaidismo s
JOIN tipos_salto t ON s.id_tipo_salto = t.id_tipo_salto
ORDER BY s.duracion_caida_libre_seg DESC
LIMIT 5;

-- 5. Analisis financiero y operativo agrupado por estado de los saltos registrando la sumatoria de costos y el promedio de duracion en caida libre
SELECT s.estado_salto, COUNT(*) AS cantidad_registros, ROUND(AVG(s.costo_salto), 2) AS costo_promedio, SUM(s.duracion_caida_libre_seg) AS tiempo_total_caida_seg
FROM saltos_paracaidismo s
GROUP BY s.estado_salto
ORDER BY cantidad_registros DESC;