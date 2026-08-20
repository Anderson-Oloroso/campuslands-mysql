USE campuslands_mysql;

-- 1. Reporte Completo 3FN: Proyectos 3D con datos de Arquitecto, Firma y Categoría (Eliminando dependencias transitivas)
SELECT 
    m.id AS modelo_id,
    m.nombre_proyecto,
    CONCAT(a.nombre, ' ', a.apellido) AS arquitecto_responsable,
    f.nombre_firma,
    f.pais_origen AS pais_firma,
    c.nombre_categoria,
    c.norma_construccion_aplicable,
    m.superficie_m2,
    m.costo_estimado_usd,
    m.estado
FROM modelos_3d m
INNER JOIN arquitectos a ON m.arquitecto_id = a.id
INNER JOIN firmas_arquitectura f ON a.firma_id = f.id
INNER JOIN categorias_espacio c ON m.categoria_id = c.id
ORDER BY m.costo_estimado_usd DESC;

-- 2. Análisis por Firma de Arquitectura: Total de m2 proyectados y costo promedio estimado por metro cuadrado
SELECT 
    f.nombre_firma,
    f.software_bim_preferido,
    COUNT(m.id) AS total_modelos,
    SUM(m.superficie_m2) AS superficie_total_m2,
    ROUND(AVG(m.costo_estimado_usd / m.superficie_m2), 2) AS costo_promedio_usd_por_m2
FROM firmas_arquitectura f
INNER JOIN arquitectos a ON f.id = a.firma_id
INNER JOIN modelos_3d m ON a.id = m.arquitecto_id
GROUP BY f.id, f.nombre_firma, f.software_bim_preferido
ORDER BY superficie_total_m2 DESC;

-- 3. Promedio de tiempo de renderizado y resolución predominante según el motor de render
SELECT 
    r.motor_render,
    COUNT(r.id) AS cantidad_renders,
    ROUND(AVG(r.tiempo_render_minutos), 2) AS promedio_minutos_render,
    MAX(r.resolucion_k) AS maxima_resolucion
FROM render_escenas r
INNER JOIN modelos_3d m ON r.modelo_id = m.id
WHERE m.estado IN ('Aprobado', 'En Construcción')
GROUP BY r.motor_render
ORDER BY promedio_minutos_render DESC;

-- 4. Proyectos en espacios públicos con un costo estimado superior a 5 millones USD
SELECT 
    m.nombre_proyecto,
    c.nombre_categoria,
    m.costo_estimado_usd,
    f.nombre_firma,
    m.estado
FROM modelos_3d m
INNER JOIN categorias_espacio c ON m.categoria_id = c.id
INNER JOIN arquitectos a ON m.arquitecto_id = a.id
INNER JOIN firmas_arquitectura f ON a.firma_id = f.id
WHERE c.es_espacio_publico = TRUE 
  AND m.costo_estimado_usd > 5000000.00
ORDER BY m.costo_estimado_usd DESC;

-- 5. Ranking de arquitectos con mayor volumen de inversión aprobada o en construcción
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS arquitecto,
    a.licencia_profesional,
    f.nombre_firma,
    COUNT(m.id) AS proyectos_aprobados,
    SUM(m.costo_estimado_usd) AS inversion_total_gestionada_usd
FROM arquitectos a
INNER JOIN firmas_arquitectura f ON a.firma_id = f.id
INNER JOIN modelos_3d m ON a.id = m.arquitecto_id
WHERE m.estado IN ('Aprobado', 'En Construcción')
GROUP BY a.id, a.nombre, a.apellido, a.licencia_profesional, f.nombre_firma
ORDER BY inversion_total_gestionada_usd DESC;