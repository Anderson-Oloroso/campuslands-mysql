USE campuslands_mysql;

-- 1. Menu completo ordenado por precio
SELECT nombre_plato, categoria, precio, disponible
FROM platos_basico
ORDER BY precio;

-- 2. Platos de la categoria plato fuerte
SELECT nombre_plato, precio, calorias
FROM platos_basico
WHERE categoria = 'plato_fuerte';

-- 3. Calorias por cada mil pesos de precio (relacion calorias/precio)
SELECT nombre_plato,
       precio, calorias,
       ROUND(calorias / (precio / 1000), 1) AS calorias_por_mil_pesos
FROM platos_basico
ORDER BY calorias_por_mil_pesos DESC;

-- 4. Cantidad de platos por categoria
SELECT categoria, COUNT(*) AS total_platos
FROM platos_basico
GROUP BY categoria
ORDER BY total_platos DESC;

-- 5. Top 3 platos mas caros
SELECT nombre_plato, categoria, precio
FROM platos_basico
ORDER BY precio DESC
LIMIT 3;

-- 6. Platos creados antes de 2020
SELECT nombre_plato, categoria, fecha_creacion
FROM platos_basico
WHERE fecha_creacion < '2020-01-01'
ORDER BY fecha_creacion;
