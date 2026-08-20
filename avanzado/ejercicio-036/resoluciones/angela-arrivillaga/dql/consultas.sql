USE campuslands_mysql;

-- 1. Analisis con EXPLAIN de consulta por velocidad
EXPLAIN SELECT modelo, velocidad_maxima_kmh 
FROM hiperdeportivos 
WHERE velocidad_maxima_kmh > 400;

-- 2. Analisis con EXPLAIN de consulta por estado
EXPLAIN SELECT modelo, precio_millones 
FROM hiperdeportivos 
WHERE estado = 'limitado';

-- 3. Union con Fabricante analizada
EXPLAIN SELECT h.modelo, f.nombre, h.velocidad_maxima_kmh 
FROM hiperdeportivos h
JOIN fabricantes f ON h.fabricante_id = f.id
WHERE h.velocidad_maxima_kmh > 380;

-- 4. Reporte de velocidad promedio por estado
SELECT estado, AVG(velocidad_maxima_kmh) AS promedio_vel
FROM hiperdeportivos
GROUP BY estado;

-- 5. Top 5 modelos más veloces
SELECT modelo, velocidad_maxima_kmh 
FROM hiperdeportivos 
ORDER BY velocidad_maxima_kmh DESC 
LIMIT 5;