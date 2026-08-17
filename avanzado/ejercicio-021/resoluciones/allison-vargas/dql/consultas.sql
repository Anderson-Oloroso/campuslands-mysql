-- DQL: Diagnóstico del plan de ejecución utilizando la sentencia EXPLAIN
USE campuslands_mysql;

-- 1. EXPLAIN de búsqueda indexada por estilo de ilustración
EXPLAIN SELECT 
    codigo_ilustracion,
    titulo,
    estilo,
    precio_usd
FROM ilustraciones_digitales
WHERE estilo = 'Concept Art';

-- 2. EXPLAIN de Join con filtrado compuesto por artista y estado
EXPLAIN SELECT 
    a.nombre AS artista,
    a.software_principal,
    i.titulo,
    i.precio_usd
FROM ilustraciones_digitales i
INNER JOIN artistas_digitales a ON i.artista_id = a.artista_id
WHERE i.artista_id = 1 AND i.estado = 'vendida';

-- 3. EXPLAIN de consulta con escaneo completo (WHERE en columna no indexada)
EXPLAIN SELECT 
    titulo,
    resolucion_px,
    horas_trabajo
FROM ilustraciones_digitales
WHERE horas_trabajo > 15.00;

-- 4. Reporte general de rendimiento y facturación por artista
SELECT 
    a.nombre AS artista,
    a.software_principal,
    COUNT(i.ilustracion_id) AS total_obras,
    ROUND(SUM(i.precio_usd), 2) AS recaudacion_total
FROM artistas_digitales a
LEFT JOIN ilustraciones_digitales i ON a.artista_id = i.artista_id AND i.estado = 'vendida'
GROUP BY a.artista_id, a.nombre, a.software_principal
ORDER BY recaudacion_total DESC;

-- 5. Promedio de costo por hora según el estilo de arte
SELECT 
    estilo,
    COUNT(*) AS total_obras,
    ROUND(AVG(precio_usd / horas_trabajo), 2) AS tarifa_promedio_hora_usd
FROM ilustraciones_digitales
GROUP BY estilo
ORDER BY tarifa_promedio_hora_usd DESC;
