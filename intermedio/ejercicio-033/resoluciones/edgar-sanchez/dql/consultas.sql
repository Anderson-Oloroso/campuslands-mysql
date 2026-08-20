-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    a.tipo_arma,
    COUNT(DISTINCT s.skin_id) AS total_diseños_skins,
    COUNT(i.inventario_id) AS total_unidades_inventario,
    MIN(s.precio_base_usd) AS precio_minimo_usd,
    MAX(s.precio_base_usd) AS precio_maximo_usd,
    ROUND(AVG(s.precio_base_usd), 2) AS precio_promedio_usd
FROM armas_shooter a
INNER JOIN skins_arma s ON a.arma_id = s.arma_id
LEFT JOIN inventario_jugadores_skins i ON s.skin_id = i.skin_id
GROUP BY a.tipo_arma
ORDER BY total_unidades_inventario DESC, precio_promedio_usd DESC;

SELECT 
    c.nombre_coleccion,
    r.nombre_rareza,
    COUNT(i.inventario_id) AS total_skins_adquiridas,
    SUM(CASE WHEN i.es_stattrak = TRUE THEN 1 ELSE 0 END) AS total_stattrak,
    ROUND(AVG(i.float_wear), 4) AS float_promedio,
    COALESCE(SUM(s.precio_base_usd * r.multiplicador_valor), 0.00) AS valor_estimado_mercado_usd
FROM colecciones_skins c
INNER JOIN skins_arma s ON c.coleccion_id = s.coleccion_id
INNER JOIN rarezas_skin r ON s.rareza_id = r.rareza_id
LEFT JOIN inventario_jugadores_skins i ON s.skin_id = i.skin_id
GROUP BY c.nombre_coleccion, r.nombre_rareza
ORDER BY valor_estimado_mercado_usd DESC, c.nombre_coleccion ASC;