USE campuslands_mysql;

-- 1. Relación básica (JOIN): Listado completo de dispositivos mostrando su marca y país de origen
SELECT 
    e.codigo_equipo,
    e.nombre_dispositivo,
    m.nombre_marca AS marca,
    m.pais_origen,
    e.tipo_equipo,
    e.precio_usd
FROM equipos_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id
ORDER BY e.precio_usd DESC;

-- 2. Conteo e inversión total por marca de streaming (Agregación con INNER JOIN)
SELECT 
    m.nombre_marca,
    COUNT(e.id) AS total_dispositivos,
    SUM(e.precio_usd) AS inversion_total_usd
FROM marcas_streaming m
LEFT JOIN equipos_streaming e ON m.id = e.id_marca
GROUP BY m.id, m.nombre_marca
ORDER BY inversion_total_usd DESC;

-- 3. Filtrado por estado operativo: Equipos activos que superen los 150 USD
SELECT 
    e.codigo_equipo,
    e.nombre_dispositivo,
    m.nombre_marca,
    e.precio_usd,
    e.estado_operativo
FROM equipos_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id
WHERE e.estado_operativo = 'activo' AND e.precio_usd > 150.00
ORDER BY e.precio_usd ASC;

-- 4. Ranking o Top 3 de los equipos de streaming más costosos del inventario
SELECT 
    e.codigo_equipo,
    e.nombre_dispositivo,
    m.nombre_marca,
    e.tipo_equipo,
    e.precio_usd
FROM equipos_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id
ORDER BY e.precio_usd DESC
LIMIT 3;

-- 5. Análisis de equipos por tipo de hardware (Precio promedio y cantidad por categoría)
SELECT 
    tipo_equipo,
    COUNT(*) AS cantidad_equipos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio_usd
FROM equipos_streaming
GROUP BY tipo_equipo
ORDER BY precio_promedio_usd DESC;