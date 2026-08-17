-- DQL: Consultas apoyadas en las Vistas Avanzadas creadas
USE campuslands_mysql;

-- 1. Consultar la vista de resúmenes de proyectos filtrando inversiones mayores a  USD
SELECT 
    proyecto_nombre,
    total_renders,
    fotogramas_procesados,
    inversion_farm_usd
FROM vista_resumen_proyectos_3d
WHERE inversion_farm_usd > 300.00
ORDER BY inversion_farm_usd DESC;

-- 2. Consultar la vista de rendimiento para animadores Senior
SELECT 
    codigo_animador,
    animador,
    especialidad,
    renders_asignados,
    costo_acumulado_usd
FROM vista_rendimiento_animadores
WHERE nivel = 'Senior'
ORDER BY costo_acumulado_usd DESC;

-- 3. Análisis de tiempo medio por fotograma generado en renders completados
SELECT 
    r.proyecto_nombre,
    r.motor_render,
    ROUND(SUM(r.tiempo_render_hs * 60) / SUM(r.fotogramas_totales), 2) AS minutos_por_fotograma
FROM renders_3d r
WHERE r.estado = 'completado'
GROUP BY r.proyecto_nombre, r.motor_render
ORDER BY minutos_por_fotograma ASC;

-- 4. Unir la vista de proyectos con el detalle de motores de render usados
SELECT 
    v.proyecto_nombre,
    v.inversion_farm_usd,
    COUNT(DISTINCT r.motor_render) AS motores_distintos_usados
FROM vista_resumen_proyectos_3d v
JOIN renders_3d r ON v.proyecto_nombre = r.proyecto_nombre
GROUP BY v.proyecto_nombre, v.inversion_farm_usd
ORDER BY v.inversion_farm_usd DESC;

-- 5. Ranking de animadores con mayor rendimiento acumulado consultando la vista
SELECT 
    animador,
    especialidad,
    renders_asignados,
    costo_acumulado_usd
FROM vista_rendimiento_animadores
WHERE renders_asignados > 0
ORDER BY costo_acumulado_usd DESC
LIMIT 3;
