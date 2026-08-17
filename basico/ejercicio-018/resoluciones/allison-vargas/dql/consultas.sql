-- DQL: Consultas de análisis basadas en la entidad de destinos turísticos
USE campuslands_mysql;

-- 1. Consulta por llave primaria específica
SELECT 
    destino_id,
    codigo_destino,
    nombre,
    region,
    costo_promedio_dia
FROM destinos_turismo
WHERE destino_id = 1;

-- 2. Destinos activos ordenados de mayor a menor costo diario
SELECT 
    codigo_destino,
    nombre,
    categoria,
    costo_promedio_dia
FROM destinos_turismo
WHERE activo = TRUE
ORDER BY costo_promedio_dia DESC;

-- 3. Métricas agrupadas por categoría turística
SELECT 
    categoria,
    COUNT(*) AS total_destinos,
    ROUND(AVG(costo_promedio_dia), 2) AS costo_promedio_usd,
    SUM(cupo_maximo) AS capacidad_total_turistas
FROM destinos_turismo
GROUP BY categoria
ORDER BY capacidad_total_turistas DESC;

-- 4. Búsqueda de destinos económicos en regiones clave
SELECT 
    codigo_destino,
    nombre,
    region,
    costo_promedio_dia
FROM destinos_turismo
WHERE costo_promedio_dia <= 80.00 AND activo = TRUE
ORDER BY costo_promedio_dia ASC;

-- 5. Ranking Top 3 destinos con mayor capacidad de cupo
SELECT 
    codigo_destino,
    nombre,
    region,
    cupo_maximo
FROM destinos_turismo
ORDER BY cupo_maximo DESC
LIMIT 3;
