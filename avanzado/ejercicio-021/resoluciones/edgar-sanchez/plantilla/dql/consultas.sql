EXPLAIN SELECT 
    p.proyecto_id,
    p.titulo_proyecto,
    p.fecha_creacion,
    p.estado_proyecto
FROM proyectos_dibujo p
WHERE p.artista_id = 1 AND p.estado_proyecto = 'En Proceso';

EXPLAIN SELECT 
    p.proyecto_id,
    p.titulo_proyecto,
    a.alias_artistico,
    p.fecha_creacion
FROM proyectos_dibujo p
INNER JOIN artistas_digitales a ON p.artista_id = a.artista_id
WHERE p.fecha_creacion >= '2026-08-01 00:00:00'
ORDER BY p.fecha_creacion DESC;

EXPLAIN SELECT 
    c.capa_id,
    c.nombre_capa,
    c.modo_fusion,
    c.opacidad_capa,
    ph.nombre_pincel
FROM capas_proyecto c
LEFT JOIN pinceles_herramientas ph ON c.pincel_usado_id = ph.pincel_id
WHERE c.proyecto_id = 1 AND c.modo_fusion = 'Multiplicar';

SELECT 
    p.proyecto_id,
    p.titulo_proyecto,
    a.alias_artistico AS artista,
    CONCAT(p.ancho_px, 'x', p.alto_px, ' px @ ', p.dpi, ' DPI') AS resolucion,
    COUNT(c.capa_id) AS total_capas,
    p.estado_proyecto
FROM proyectos_dibujo p
INNER JOIN artistas_digitales a ON p.artista_id = a.artista_id
LEFT JOIN capas_proyecto c ON p.proyecto_id = c.proyecto_id
GROUP BY p.proyecto_id, p.titulo_proyecto, a.alias_artistico, p.ancho_px, p.alto_px, p.dpi, p.estado_proyecto
ORDER BY p.proyecto_id ASC;     