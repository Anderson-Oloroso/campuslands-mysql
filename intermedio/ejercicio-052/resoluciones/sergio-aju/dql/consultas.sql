USE campuslands_mysql;

-- 1. Reporte Consolidado 2FN: Detalle completo reuniendo Escenas, Proyectos, Animadores y Motores de Render
SELECT 
    p.titulo_proyecto,
    e.nombre_escena,
    CONCAT(a.nombre, ' ', a.apellido) AS animador,
    a.especialidad,
    m.nombre_engine AS motor_render,
    ar.horas_computo_render,
    ar.cuadros_renderizados,
    ar.puntuacion_calidad
FROM asignaciones_render ar
INNER JOIN escenas_3d e ON ar.escena_id = e.id
INNER JOIN proyectos_animacion p ON e.proyecto_id = p.id
INNER JOIN animadores a ON ar.animador_id = a.id
INNER JOIN motores_render m ON ar.motor_id = m.id
ORDER BY ar.horas_computo_render DESC;

-- 2. Consumo total de horas de computo y promedio de calidad agrupado por Motor de Render (Demuestra la ventaja de la tabla separada en 2FN)
SELECT 
    m.nombre_engine,
    m.licencia,
    COUNT(ar.escena_id) AS total_escenas_procesadas,
    SUM(ar.horas_computo_render) AS total_horas_render,
    ROUND(AVG(ar.puntuacion_calidad), 2) AS calidad_promedio
FROM motores_render m
LEFT JOIN asignaciones_render ar ON m.id = ar.motor_id
GROUP BY m.id, m.nombre_engine, m.licencia
ORDER BY total_horas_render DESC;

-- 3. Métricas de eficiencia: Cuadros renderizados por hora de cómputo agrupado por Proyecto
SELECT 
    p.titulo_proyecto,
    p.cliente,
    COUNT(DISTINCT e.id) AS total_escenas,
    SUM(ar.cuadros_renderizados) AS total_cuadros,
    SUM(ar.horas_computo_render) AS total_horas_invertidas,
    ROUND(SUM(ar.cuadros_renderizados) / SUM(ar.horas_computo_render), 2) AS rendimiento_cuadros_por_hora
FROM proyectos_animacion p
INNER JOIN escenas_3d e ON p.id = e.proyecto_id
INNER JOIN asignaciones_render ar ON e.id = ar.escena_id
GROUP BY p.id, p.titulo_proyecto, p.cliente
ORDER BY rendimiento_cuadros_por_hora DESC;

-- 4. Top Animadores con mayor volumen de renderizado en escenas de complejidad 'Alta' o 'Extrema'
SELECT 
    CONCAT(a.nombre, ' ', a.apellido) AS animador,
    a.especialidad,
    COUNT(e.id) AS cantidad_escenas_complejas,
    SUM(ar.horas_computo_render) AS horas_totales_complejas
FROM animadores a
INNER JOIN asignaciones_render ar ON a.id = ar.animador_id
INNER JOIN escenas_3d e ON ar.escena_id = e.id
WHERE e.nivel_complejidad IN ('Alta', 'Extrema')
GROUP BY a.id, a.nombre, a.apellido, a.especialidad
HAVING horas_totales_complejas > 10.00
ORDER BY horas_totales_complejas DESC;

-- 5. Análisis de costo estimado de licencias por proyecto según los motores utilizados
SELECT 
    p.titulo_proyecto,
    GROUP_CONCAT(DISTINCT m.nombre_engine SEPARATOR ', ') AS motores_utilizados,
    SUM(DISTINCT m.costo_licencia_usd) AS costo_acumulado_licencias_usd
FROM proyectos_animacion p
INNER JOIN escenas_3d e ON p.id = e.proyecto_id
INNER JOIN asignaciones_render ar ON e.id = ar.escena_id
INNER JOIN motores_render m ON ar.motor_id = m.id
GROUP BY p.id, p.titulo_proyecto
ORDER BY costo_acumulado_licencias_usd DESC;