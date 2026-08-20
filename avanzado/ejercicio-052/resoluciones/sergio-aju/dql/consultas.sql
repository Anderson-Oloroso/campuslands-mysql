USE campuslands_mysql;

-- 1. Porcentaje de presupuesto gastado en Render por proyecto
SELECT 
    proyecto,
    software_principal,
    estado,
    total_assets,
    carga_poligonal_total,
    gasto_render_usd,
    ROUND((gasto_render_usd / presupuesto_usd) * 100, 2) AS pct_presupuesto_render
FROM vw_resumen_proyectos_3d
ORDER BY gasto_render_usd DESC;

-- 2. Comparativa de velocidad por motor de renderizado
SELECT 
    motor_render,
    fotogramas_procesados,
    tiempo_total_minutos,
    promedio_minutos_por_frame,
    costo_acumulado_usd
FROM vw_rendimiento_render_farm
ORDER BY promedio_minutos_por_frame ASC;

-- 3. Análisis de productividad de animadores con modelos asignados
SELECT 
    animador,
    especialidad,
    nivel,
    assets_creados,
    ROUND(promedio_poligonos_por_asset, 0) AS poligonos_promedio,
    assets_con_rigging
FROM vw_eficiencia_animadores
WHERE assets_creados > 0
ORDER BY assets_creados DESC;

-- 4. Assets de alta complejidad (más de 100k polígonos) que incluyen Rigging
SELECT 
    p.nombre AS proyecto,
    m.nombre_asset,
    m.conteo_poligonos,
    m.estado AS estado_asset,
    a.nombre AS asignado_a
FROM modelos_3d m
JOIN proyectos_3d p ON m.proyecto_id = p.id
JOIN animadores a ON m.animador_id = a.id
WHERE m.conteo_poligonos > 100000 AND m.tiene_rigging = 1
ORDER BY m.conteo_poligonos DESC;

-- 5. Proyectos con inversión de renderizado superior a $300 USD
SELECT 
    p.nombre AS proyecto,
    SUM(rj.fotogramas_totales) AS frames_totales,
    SUM(rj.minutos_render_farm) AS minutos_totales,
    SUM(rj.costo_render_usd) AS inversion_render
FROM render_jobs rj
JOIN proyectos_3d p ON rj.proyecto_id = p.id
WHERE rj.estado = 'Exitoso'
GROUP BY p.id, p.nombre
HAVING inversion_render > 300.00
ORDER BY inversion_render DESC;