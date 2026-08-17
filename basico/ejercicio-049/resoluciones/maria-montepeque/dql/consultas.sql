USE campuslands_mysql;

-- 1. Listado completo ordenado por fecha
SELECT id_salto, paracaidista, instructor, tipo_salto, zona_salto, costo, fecha_salto
FROM saltos_basico
ORDER BY fecha_salto;

-- 2. Saltos de formacion o free_fly (los mas costosos habitualmente)
SELECT paracaidista, instructor, tipo_salto, costo
FROM saltos_basico
WHERE tipo_salto IN ('formacion', 'free_fly')
ORDER BY costo DESC;

-- 3. Costo promedio por tipo de salto
SELECT tipo_salto, COUNT(*) AS total_saltos, AVG(costo) AS costo_promedio
FROM saltos_basico
GROUP BY tipo_salto
ORDER BY costo_promedio DESC;

-- 4. Saltos realizados por cada instructor
SELECT instructor, COUNT(*) AS total_saltos
FROM saltos_basico
GROUP BY instructor
ORDER BY total_saltos DESC;

-- 5. Top 3 saltos mas caros
SELECT paracaidista, tipo_salto, costo
FROM saltos_basico
ORDER BY costo DESC
LIMIT 3;

-- 6. Saltos realizados en la zona "La Sabana"
SELECT paracaidista, instructor, tipo_salto, costo
FROM saltos_basico
WHERE zona_salto = 'La Sabana';
