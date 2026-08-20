USE campuslands_mysql;

-- 1. Reporte general de proyectos con sus presupuestos y total de renders aprobados
SELECT 
    p.nombre_proyecto AS proyecto,
    p.tipo_propiedad,
    p.estado AS estado_proyecto,
    CONCAT('$', FORMAT(p.presupuesto_usd, 2)) AS presupuesto,
    a.nombre AS arquitecto_lider,
    COUNT(r.id) AS renders_aprobados
FROM proyectos_arquitectura p
JOIN arquitectos a ON p.arquitecto_id = a.id
LEFT JOIN render_escenas r ON p.id = r.proyecto_id AND r.estado = 'Aprobado'
GROUP BY p.id, p.nombre_proyecto, p.tipo_propiedad, p.estado, p.presupuesto_usd, a.nombre
ORDER BY p.presupuesto_usd DESC;

-- 2. Ranking de tiempo promedio y complejidad poligonal de renders por proyecto
SELECT 
    p.nombre_proyecto AS proyecto,
    COUNT(r.id) AS total_escenas,
    FORMAT(AVG(r.poligonos_totales), 0) AS promedio_poligonos,
    ROUND(AVG(r.tiempo_render_minutos), 2) AS promedio_minutos_render,
    ROUND(AVG(r.calidad_score), 1) AS puntaje_calidad_promedio
FROM render_escenas r
JOIN proyectos_arquitectura p ON r.proyecto_id = p.id
GROUP BY p.id, p.nombre_proyecto
HAVING total_escenas >= 2
ORDER BY promedio_minutos_render DESC;

-- 3. Rendimiento y carga de trabajo por arquitecto activo
SELECT 
    a.nombre AS arquitecto,
    a.especialidad,
    a.nivel,
    CONCAT('$', a.costo_hora, '/h') AS tarifa_hora,
    COUNT(p.id) AS proyectos_asignados,
    COALESCE(SUM(p.presupuesto_usd), 0.00) AS valor_total_proyectos
FROM arquitectos a
LEFT JOIN proyectos_arquitectura p ON a.id = p.arquitecto_id
WHERE a.estado = 'Activo'
GROUP BY a.id, a.nombre, a.especialidad, a.nivel, a.costo_hora
ORDER BY valor_total_proyectos DESC;

-- 4. Top 3 de escenas de render más pesadas (alta complejidad poligonal)
SELECT 
    r.nombre_escena,
    p.nombre_proyecto AS proyecto,
    r.resolucion,
    FORMAT(r.poligonos_totales, 0) AS conteo_poligonos,
    r.tiempo_render_minutos AS minutos_render,
    r.calidad_score
FROM render_escenas r
JOIN proyectos_arquitectura p ON r.proyecto_id = p.id
WHERE r.calidad_score >= 8.0
ORDER BY r.poligonos_totales DESC
LIMIT 3;

-- 5. Resumen consolidado por tipo de propiedad y estado de desarrollo
SELECT 
    tipo_propiedad,
    COUNT(*) AS cantidad_proyectos,
    ROUND(AVG(presupuesto_usd), 2) AS presupuesto_promedio,
    MIN(presupuesto_usd) AS presupuesto_minimo,
    MAX(presupuesto_usd) AS presupuesto_maximo
FROM proyectos_arquitectura
GROUP BY tipo_propiedad
ORDER BY cantidad_proyectos DESC;