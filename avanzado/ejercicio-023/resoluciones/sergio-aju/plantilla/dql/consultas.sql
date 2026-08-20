USE campuslands_mysql;

-- 1. Ranking de proyectos activos ordenados por costo de mayor a menor
SELECT nombre_proyecto, tipo, costo_estimado 
FROM proyectos_arquitectura 
WHERE estado = 'activo'
ORDER BY costo_estimado DESC;

-- 2. Resumen financiero por tipo de arquitectura: Total de proyectos y costo promedio
SELECT tipo, COUNT(*) AS total_proyectos, AVG(costo_estimado) AS costo_promedio
FROM proyectos_arquitectura
GROUP BY tipo
ORDER BY costo_promedio DESC;

-- 3. Proyectos en revisión o cancelados ordenados por fecha de creación
SELECT nombre_proyecto, estado, creado_en 
FROM proyectos_arquitectura 
WHERE estado IN ('revision', 'cancelado')
ORDER BY creado_en ASC;

-- 4. Top 3 proyectos más costosos de toda la academia
SELECT nombre_proyecto, tipo, costo_estimado 
FROM proyectos_arquitectura 
ORDER BY costo_estimado DESC 
LIMIT 3;

-- 5. Listado general organizado alfabéticamente por nombre de proyecto
SELECT nombre_proyecto, tipo, costo_estimado, estado 
FROM proyectos_arquitectura 
ORDER BY nombre_proyecto ASC;