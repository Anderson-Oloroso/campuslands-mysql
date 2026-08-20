USE campuslands_mysql;

-- 1. Consultar el estado actual de los proyectos tras las modificaciones de UPDATE, ordenados por honorarios
SELECT 
    codigo_proyecto,
    nombre_proyecto,
    tipo_inmueble,
    superficie_m2,
    honorarios_usd,
    estado_proyecto
FROM proyectos_arquitectura_3d
ORDER BY honorarios_usd DESC;

-- 2. Reporte agrupado por tipo de inmueble: Cantidad de proyectos, superficie promedio y honorarios totales actualizados
SELECT 
    tipo_inmueble,
    COUNT(*) AS total_proyectos,
    ROUND(AVG(superficie_m2), 2) AS superficie_promedio_m2,
    SUM(honorarios_usd) AS honorarios_totales_usd
FROM proyectos_arquitectura_3d
GROUP BY tipo_inmueble
ORDER BY honorarios_totales_usd DESC;

-- 3. Análisis de rendimiento por estado del proyecto reflejando el impacto de los cambios de estatus
SELECT 
    estado_proyecto,
    COUNT(*) AS cantidad_proyectos,
    ROUND(AVG(calificacion_cliente), 1) AS calificacion_media
FROM proyectos_arquitectura_3d
GROUP BY estado_proyecto
ORDER BY cantidad_proyectos DESC;

-- 4. Top 3 de proyectos de arquitectura 3D con mayores honorarios tras las actualizaciones aplicadas
SELECT 
    codigo_proyecto,
    nombre_proyecto,
    tipo_inmueble,
    honorarios_usd,
    calificacion_cliente,
    estado_proyecto
FROM proyectos_arquitectura_3d
ORDER BY honorarios_usd DESC
LIMIT 3;

-- 5. Consulta analítica de rentabilidad por metro cuadrado (honorarios / superficie_m2) tras los ajustes financieros
SELECT 
    codigo_proyecto,
    nombre_proyecto,
    tipo_inmueble,
    superficie_m2,
    honorarios_usd,
    ROUND((honorarios_usd / superficie_m2), 2) AS valor_por_m2_usd
FROM proyectos_arquitectura_3d
ORDER BY valor_por_m2_usd DESC;