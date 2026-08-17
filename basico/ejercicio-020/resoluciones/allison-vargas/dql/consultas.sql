-- DQL: Consultas de selección y reportes para el estudio de tatuajes
USE campuslands_mysql;

-- 1. Proyección general de diseños disponibles con alias formateados
SELECT 
    codigo_disenio AS Codigo,
    nombre_disenio AS Disenio,
    estilo AS Estilo_Artistico,
    precio_estimado AS Precio_USD
FROM catalogo_tatuajes
WHERE disponible = TRUE
ORDER BY precio_estimado ASC;

-- 2. Filtrado de diseños de presupuesto moderado (menores o iguales a .00)
SELECT 
    codigo_disenio,
    nombre_disenio,
    estilo,
    precio_estimado
FROM catalogo_tatuajes
WHERE precio_estimado <= 200.00 AND disponible = TRUE
ORDER BY precio_estimado DESC;

-- 3. Consulta de conteo y promedio de precio por estilo de tatuaje
SELECT 
    estilo,
    COUNT(*) AS total_disenios,
    ROUND(AVG(precio_estimado), 2) AS precio_promedio
FROM catalogo_tatuajes
GROUP BY estilo
ORDER BY total_disenios DESC;

-- 4. Búsqueda por estilos específicos de arte (Realismo y Neotradicional)
SELECT 
    codigo_disenio,
    nombre_disenio,
    tamanio_cm,
    precio_estimado
FROM catalogo_tatuajes
WHERE estilo IN ('realismo', 'neotradicional')
ORDER BY precio_estimado DESC;

-- 5. Ranking Top 3 de los diseños de mayor valor en el catálogo
SELECT 
    codigo_disenio,
    nombre_disenio,
    estilo,
    precio_estimado
FROM catalogo_tatuajes
ORDER BY precio_estimado DESC
LIMIT 3;
