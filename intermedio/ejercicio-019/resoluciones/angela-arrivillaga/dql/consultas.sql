USE paracaidismo_db;

-- 1. Agrupación por zona de salto aplicando HAVING para filtrar aquellas zonas que registran un promedio de altura mayor a 14,000 pies
SELECT nombre_zona AS zona_paracaidismo, COUNT(*) AS total_saltos, ROUND(AVG(altura_pies), 0) AS altura_promedio_pies, CONCAT('$', FORMAT(AVG(costo_usd), 2)) AS costo_promedio
FROM saltos_paracaidismo
GROUP BY nombre_zona
HAVING AVG(altura_pies) > 14000
ORDER BY altura_promedio_pies DESC;

-- 2. Agrupación por modalidad de salto utilizando HAVING para conservar únicamente modalidades donde la caída libre promedio supere los 55 segundos
SELECT modalidad, COUNT(*) AS cantidad_saltos, ROUND(AVG(duracion_caida_libre_seg), 1) AS caida_libre_promedio_seg, CONCAT('$', FORMAT(AVG(costo_usd), 2)) AS costo_medio
FROM saltos_paracaidismo
GROUP BY modalidad
HAVING AVG(duracion_caida_libre_seg) > 55
ORDER BY caida_libre_promedio_seg DESC;

-- 3. Análisis por zona de salto evaluando el costo total acumulado con HAVING para mostrar solo centros con inversión o costos totales superiores a $500 USD
SELECT nombre_zona AS zona_paracaidismo, COUNT(*) AS saltos_registrados, CONCAT('$', FORMAT(SUM(costo_usd), 2)) AS costo_acumulado_total, CONCAT('$', FORMAT(AVG(costo_usd), 2)) AS costo_promedio
FROM saltos_paracaidismo
GROUP BY nombre_zona
HAVING SUM(costo_usd) > 500.00
ORDER BY SUM(costo_usd) DESC;

-- 4. Agrupación por estado del salto aplicando HAVING para aislar estados que acumulan 2 o más registros en la base de datos
SELECT estado_salto, COUNT(*) AS total_registros, ROUND(AVG(altura_pies), 0) AS altura_media, CONCAT('$', FORMAT(AVG(costo_usd), 2)) AS costo_promedio
FROM saltos_paracaidismo
GROUP BY estado_salto
HAVING COUNT(*) >= 2
ORDER BY total_registros DESC;

-- 5. Análisis complejo por zona y modalidad filtrando mediante HAVING los grupos cuyo costo promedio supere los $250 USD
SELECT nombre_zona AS zona_paracaidismo, modalidad, COUNT(*) AS volumen_saltos, CONCAT('$', FORMAT(AVG(costo_usd), 2)) AS costo_promedio_modalidad, MAX(altura_pies) AS altura_maxima_pies
FROM saltos_paracaidismo
GROUP BY nombre_zona, modalidad
HAVING AVG(costo_usd) > 250.00
ORDER BY costo_promedio_modalidad DESC;