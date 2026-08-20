USE campuslands_mysql;

-- 1. Valor total invertido en inventario de equipos agrupado por marca
SELECT 
    m.nombre_marca,
    COUNT(e.id) AS total_modelos_registrados,
    SUM(e.stock_almacen) AS unidades_en_stock,
    SUM(e.precio_adquisicion * e.stock_almacen) AS inversion_total_usd
FROM marcas m
INNER JOIN equipos_streaming e ON m.id = e.marca_id
GROUP BY m.id, m.nombre_marca
ORDER BY inversion_total_usd DESC;

-- 2. Reporte consolidado de asignaciones activas por streamer
SELECT 
    s.nickname AS streamer,
    s.plataforma_principal AS plataforma,
    e.modelo AS equipo_asignado,
    c.nombre_categoria AS categoria,
    DATE_FORMAT(a.fecha_asignacion, '%Y-%m-%d %H:%i') AS fecha_prestamo
FROM asignaciones_equipos a
INNER JOIN streamers s ON a.streamer_id = s.id
INNER JOIN equipos_streaming e ON a.equipo_id = e.id
INNER JOIN categorias_equipos c ON e.categoria_id = c.id
WHERE a.estado_asignacion = 'Activa'
ORDER BY a.fecha_asignacion DESC;

-- 3. Equipos de alta gama disponibles para asignación (Precio > $150.00 USD)
SELECT 
    e.numero_serie,
    m.nombre_marca,
    e.modelo,
    c.nombre_categoria,
    e.precio_adquisicion,
    e.resolucion_o_especificacion
FROM equipos_streaming e
INNER JOIN marcas m ON e.marca_id = m.id
INNER JOIN categorias_equipos c ON e.categoria_id = c.id
WHERE e.estado = 'Disponible' AND e.precio_adquisicion > 150.00
ORDER BY e.precio_adquisicion DESC;

-- 4. Promedio de costo de equipos por categoría de transmisión
SELECT 
    c.nombre_categoria,
    COUNT(e.id) AS cantidad_equipos,
    ROUND(AVG(e.precio_adquisicion), 2) AS precio_promedio,
    MIN(e.precio_adquisicion) AS precio_minimo,
    MAX(e.precio_adquisicion) AS precio_maximo
FROM categorias_equipos c
LEFT JOIN equipos_streaming e ON c.id = e.categoria_id
GROUP BY c.id, c.nombre_categoria
ORDER BY precio_promedio DESC;

-- 5. Top de hardware asignado o en mantenimiento (Equipos no disponibles en stock)
SELECT 
    e.id AS equipo_id,
    m.nombre_marca,
    e.modelo,
    e.estado,
    e.precio_adquisicion
FROM equipos_streaming e
INNER JOIN marcas m ON e.marca_id = m.id
WHERE e.estado IN ('Asignado', 'En Mantenimiento')
ORDER BY e.precio_adquisicion DESC;