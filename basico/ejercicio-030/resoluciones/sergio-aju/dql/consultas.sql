USE campuslands_mysql;

-- 1. Listar todos los dispositivos de streaming junto con el nombre de su marca utilizando JOIN
SELECT 
    d.nombre_dispositivo,
    m.nombre_marca AS marca,
    d.tipo_dispositivo,
    d.precio_unitario,
    d.stock,
    d.estado
FROM dispositivos_streaming d
JOIN marcas_streaming m ON d.marca_id = m.id
ORDER BY d.precio_unitario DESC;

-- 2. Conteo de dispositivos y valor total del inventario agrupados por marca de streaming
SELECT 
    m.nombre_marca AS marca,
    COUNT(d.id) AS total_dispositivos,
    SUM(d.precio_unitario * d.stock) AS valor_inventario_marca
FROM marcas_streaming m
LEFT JOIN dispositivos_streaming d ON m.id = d.marca_id
GROUP BY m.id, m.nombre_marca
ORDER BY valor_inventario_marca DESC;

-- 3. Filtrar dispositivos que se encuentran disponibles y cuyo precio sea mayor a 150.00
SELECT 
    d.nombre_dispositivo,
    m.nombre_marca AS marca,
    d.tipo_dispositivo,
    d.precio_unitario,
    d.stock
FROM dispositivos_streaming d
JOIN marcas_streaming m ON d.marca_id = m.id
WHERE d.estado = 'disponible' AND d.precio_unitario > 150.00
ORDER BY d.precio_unitario ASC;

-- 4. Top 3 dispositivos de streaming más costosos del catálogo
SELECT 
    d.nombre_dispositivo,
    m.nombre_marca AS marca,
    d.tipo_dispositivo,
    d.precio_unitario
FROM dispositivos_streaming d
JOIN marcas_streaming m ON d.marca_id = m.id
ORDER BY d.precio_unitario DESC
LIMIT 3;

-- 5. Resumen estadístico (precio promedio y stock total) agrupado por tipo de dispositivo
SELECT 
    tipo_dispositivo,
    COUNT(*) AS cantidad_modelos,
    ROUND(AVG(precio_unitario), 2) AS precio_promedio,
    SUM(stock) AS stock_total_acumulado
FROM dispositivos_streaming
GROUP BY tipo_dispositivo
ORDER BY stock_total_acumulado DESC;