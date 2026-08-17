USE campuslands_mysql;

-- 1. Listado completo ordenado por fecha de salto
SELECT id_salto, paracaidista, nivel, tipo_salto, altura_metros, costo, fecha_salto
FROM saltos_basico
ORDER BY fecha_salto;

-- 2. Saltos tandem ordenados por costo
SELECT paracaidista, altura_metros, costo, fecha_salto
FROM saltos_basico
WHERE tipo_salto = 'tandem'
ORDER BY costo DESC;

-- 3. Promedio de altura y duracion de caida libre por tipo de salto
SELECT tipo_salto, COUNT(*) AS total_saltos, AVG(altura_metros) AS altura_promedio, AVG(duracion_caida_libre_seg) AS duracion_promedio
FROM saltos_basico
GROUP BY tipo_salto
ORDER BY duracion_promedio DESC;

-- 4. Top 3 saltos con mayor duracion de caida libre
SELECT paracaidista, tipo_salto, duracion_caida_libre_seg
FROM saltos_basico
ORDER BY duracion_caida_libre_seg DESC
LIMIT 3;

-- 5. Cantidad de saltos por nivel de paracaidista
SELECT nivel, COUNT(*) AS total_saltos
FROM saltos_basico
GROUP BY nivel
ORDER BY total_saltos DESC;

-- 6. Saltos realizados en febrero de 2026
SELECT paracaidista, tipo_salto, fecha_salto
FROM saltos_basico
WHERE fecha_salto BETWEEN '2026-02-01' AND '2026-02-28'
ORDER BY fecha_salto;
