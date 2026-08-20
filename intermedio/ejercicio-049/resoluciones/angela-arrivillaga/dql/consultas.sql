USE campuslands_mysql;

-- Consulta 1: Zonas que registran más de 2 saltos asociados
SELECT 
    z.nombre_zona, 
    COUNT(s.id) AS total_saltos
FROM zonas_salto z
JOIN saltos s ON z.id = s.zona_id
GROUP BY z.id, z.nombre_zona
HAVING COUNT(s.id) > 2;

-- Consulta 2: Zonas cuyo promedio de altura de salto supera los 13500 pies
SELECT 
    z.nombre_zona, 
    AVG(s.altura_salto_pies) AS promedio_altura
FROM zonas_salto z
JOIN saltos s ON z.id = s.zona_id
GROUP BY z.id, z.nombre_zona
HAVING AVG(s.altura_salto_pies) > 13500;

-- Consulta 3: Zonas con un tiempo acumulado de caída libre superior a 100 segundos
SELECT 
    z.nombre_zona, 
    SUM(s.tiempo_caida_libre_seg) AS tiempo_total_caida
FROM zonas_salto z
JOIN saltos s ON z.id = s.zona_id
GROUP BY z.id, z.nombre_zona
HAVING SUM(s.tiempo_caida_libre_seg) > 100;

-- Consulta 4: Filtrar saltos completados por zona cuyo promedio de tiempo de caída libre sea mayor o igual a 50 segundos
SELECT 
    z.nombre_zona, 
    AVG(s.tiempo_caida_libre_seg) AS promedio_tiempo
FROM zonas_salto z
JOIN saltos s ON z.id = s.zona_id
WHERE s.estado_salto = 'completado'
GROUP BY z.id, z.nombre_zona
HAVING AVG(s.tiempo_caida_libre_seg) >= 50;

-- Consulta 5: Zonas que tienen al menos un salto con una altura máxima superior a 15000 pies
SELECT 
    z.nombre_zona, 
    MAX(s.altura_salto_pies) AS altura_maxima
FROM zonas_salto z
JOIN saltos s ON z.id = s.zona_id
GROUP BY z.id, z.nombre_zona
HAVING MAX(s.altura_salto_pies) > 15000;