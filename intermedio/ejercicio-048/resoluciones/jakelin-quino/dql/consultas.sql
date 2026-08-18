-- 1. Conteo de destinos por categoría
SELECT categoria, COUNT(*) AS total_destinos
FROM `ejercicio-048-int-destinos`
GROUP BY categoria;

-- 2. Precio promedio por categoría
SELECT categoria, AVG(precio) AS precio_promedio
FROM `ejercicio-048-int-destinos`
GROUP BY categoria
ORDER BY precio_promedio DESC;

-- 3. Total de destinos por país
SELECT pais, COUNT(*) AS total
FROM `ejercicio-048-int-destinos`
GROUP BY pais;