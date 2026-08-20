-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;


SELECT 
    p.proyecto_id,
    p.nombre_proyecto,
    c.nombre_cliente,
    a.nombre_arquitecto,
    f.nombre_firma,
    p.tipo_uso,
    p.area_construccion_m2,
    p.presupuesto_render_usd
FROM proyectos_3d p
INNER JOIN clientes_arquitectura c ON p.cliente_id = c.cliente_id
INNER JOIN arquitectos_3d a ON p.arquitecto_id = a.arquitecto_id
INNER JOIN firmas_arquitectura f ON a.firma_id = f.firma_id
ORDER BY p.presupuesto_render_usd DESC;

SELECT 
    f.firma_id,
    f.nombre_firma,
    f.pais_sede,
    COUNT(DISTINCT a.arquitecto_id) AS total_arquitectos,
    COUNT(DISTINCT p.proyecto_id) AS total_proyectos_asignados,
    COALESCE(SUM(p.presupuesto_render_usd), 0.00) AS total_facturado_usd
FROM firmas_arquitectura f
LEFT JOIN arquitectos_3d a ON f.firma_id = a.firma_id
LEFT JOIN proyectos_3d p ON a.arquitecto_id = p.arquitecto_id
GROUP BY f.firma_id, f.nombre_firma, f.pais_sede
ORDER BY total_facturado_usd DESC;