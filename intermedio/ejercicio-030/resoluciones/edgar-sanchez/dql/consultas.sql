-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    c.creador_id,
    c.nombre_canal,
    c.plataforma_principal,
    c.pais,
    COUNT(a.equipo_id) AS total_equipos_adquiridos,
    COALESCE(SUM(a.cantidad), 0) AS total_unidades_setup,
    COALESCE(SUM(a.cantidad * e.precio_usd), 0.00) AS valor_total_setup_usd
FROM creadores_contenido c
LEFT JOIN asignaciones_setups a ON c.creador_id = a.creador_id
LEFT JOIN inventario_equipos e ON a.equipo_id = e.equipo_id
GROUP BY c.creador_id, c.nombre_canal, c.plataforma_principal, c.pais
ORDER BY valor_total_setup_usd DESC;

SELECT 
    e.equipo_id,
    e.codigo_sku,
    m.nombre_marca,
    e.modelo,
    cat.nombre_categoria,
    e.precio_usd,
    e.stock_almacen,
    COUNT(a.asignacion_id) AS veces_asignado,
    COALESCE(SUM(a.cantidad), 0) AS unidades_en_uso
FROM inventario_equipos e
INNER JOIN marcas_hardware m ON e.marca_id = m.marca_id
INNER JOIN categorias_equipo cat ON e.categoria_id = cat.categoria_id
LEFT JOIN asignaciones_setups a ON e.equipo_id = a.equipo_id
GROUP BY e.equipo_id, e.codigo_sku, m.nombre_marca, e.modelo, cat.nombre_categoria, e.precio_usd, e.stock_almacen
ORDER BY unidades_en_uso DESC, e.stock_almacen DESC;