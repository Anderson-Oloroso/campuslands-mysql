-- DQL: 5 Consultas aprovechando la estructura 1FN y JOINs
USE campuslands_mysql;

-- 1. Listado de autos con la cantidad total de equipamientos atómicos registrados
SELECT 
    a.auto_id,
    a.marca,
    a.modelo,
    a.precio_usd,
    COUNT(e.equipamiento_id) AS total_caracteristicas
FROM hiperdeportivos_intermedio a
LEFT JOIN equipamientos_hiperdeportivos e ON a.auto_id = e.auto_id
GROUP BY a.auto_id, a.marca, a.modelo, a.precio_usd
ORDER BY total_caracteristicas DESC;

-- 2. Autos que poseen características de la categoría 'aerodinamica'
SELECT 
    a.marca,
    a.modelo,
    e.caracteristica,
    e.categoria
FROM hiperdeportivos_intermedio a
INNER JOIN equipamientos_hiperdeportivos e ON a.auto_id = e.auto_id
WHERE e.categoria = 'aerodinamica';

-- 3. Detalle completo de equipamiento para autos en estado 'disponible'
SELECT 
    a.auto_id,
    CONCAT(a.marca, ' ', a.modelo) AS hiperdeportivo,
    a.precio_usd,
    e.caracteristica,
    e.categoria
FROM hiperdeportivos_intermedio a
INNER JOIN equipamientos_hiperdeportivos e ON a.auto_id = e.auto_id
WHERE a.estado = 'disponible'
ORDER BY a.precio_usd DESC;

-- 4. Conteo de equipamientos agrupados por categoría técnica
SELECT 
    e.categoria,
    COUNT(*) AS cantidad_equipamientos
FROM equipamientos_hiperdeportivos e
GROUP BY e.categoria
ORDER BY cantidad_equipamientos DESC;

-- 5. Autos que tienen características enfocadas en 'rendimiento' y precio superior a $2,000,000 USD
SELECT DISTINCT
    a.marca,
    a.modelo,
    a.precio_usd,
    a.estado
FROM hiperdeportivos_intermedio a
INNER JOIN equipamientos_hiperdeportivos e ON a.auto_id = e.auto_id
WHERE e.categoria = 'rendimiento' AND a.precio_usd > 2000000.00;
