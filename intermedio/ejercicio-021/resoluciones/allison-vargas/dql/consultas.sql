-- DQL: Consultas analíticas aprovechando la estructura en 1FN
USE campuslands_mysql;

-- 1. Búsqueda de obras asociadas a una etiqueta específica (Demuestra la atomicidad de 1FN)
SELECT 
    o.codigo_obra,
    o.titulo,
    o.artista_nombre,
    e.etiqueta,
    o.precio_usd
FROM obras_dibujo_1fn o
INNER JOIN etiquetas_obras e ON o.obra_id = e.obra_id
WHERE e.etiqueta IN ('Cyberpunk', 'Sci-Fi')
ORDER BY o.precio_usd DESC;

-- 2. Conteo de etiquetas por obra de arte
SELECT 
    o.titulo,
    o.artista_nombre,
    COUNT(e.etiqueta_id) AS total_etiquetas
FROM obras_dibujo_1fn o
LEFT JOIN etiquetas_obras e ON o.obra_id = e.obra_id
GROUP BY o.obra_id, o.titulo, o.artista_nombre
ORDER BY total_etiquetas DESC;

-- 3. Reporte de obras vendidas con recaudación y promedio de precio
SELECT 
    o.software,
    COUNT(DISTINCT o.obra_id) AS obras_vendidas,
    ROUND(SUM(o.precio_usd), 2) AS recaudacion_total
FROM obras_dibujo_1fn o
WHERE o.estado = 'vendida'
GROUP BY o.software
ORDER BY recaudacion_total DESC;

-- 4. Obras en venta que poseen etiquetas del género 'Fantasía' o 'Concept Art'
SELECT 
    o.codigo_obra,
    o.titulo,
    o.artista_nombre,
    o.precio_usd
FROM obras_dibujo_1fn o
WHERE o.estado = 'en_venta' 
  AND o.obra_id IN (
      SELECT obra_id FROM etiquetas_obras WHERE etiqueta IN ('Fantasía', 'Concept Art')
  );

-- 5. Listado consolidado de etiquetas más populares en el sistema
SELECT 
    etiqueta,
    COUNT(*) AS cantidad_obras
FROM etiquetas_obras
GROUP BY etiqueta
HAVING cantidad_obras >= 2
ORDER BY cantidad_obras DESC;
