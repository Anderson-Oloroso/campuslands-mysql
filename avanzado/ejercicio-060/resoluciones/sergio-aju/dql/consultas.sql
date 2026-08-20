USE campuslands_mysql;

-- 1. Análisis del plan de ejecución (EXPLAIN) aprovechando idx_transmisiones_creador_fecha
EXPLAIN SELECT 
    t.titulo_stream,
    t.duracion_minutos,
    t.espectadores_pico,
    t.fecha_transmision
FROM transmisiones t
WHERE t.creador_id = 1
ORDER BY t.fecha_transmision DESC;

-- 2. Consulta de alto rendimiento para métricas técnicas utilizando el índice compuesto de cobertura
SELECT 
    t.titulo_stream,
    t.calidad_resolucion,
    m.bitrate_promedio_kbps,
    m.fps_promedio,
    m.marcos_perdidos_pct,
    IF(m.marcos_perdidos_pct < 0.5, 'Excelente', 'Inestable') AS estado_conexion
FROM metricas_transmision m
JOIN transmisiones t ON m.transmision_id = t.id
WHERE m.bitrate_promedio_kbps >= 6000;

-- 3. Inversión total en equipo hardware por creador activo (Filtro eficiente con JOIN)
SELECT 
    c.alias AS creador,
    c.plataforma,
    COUNT(h.id) AS total_componentes,
    SUM(h.costo) AS inversion_hardware
FROM creadores c
INNER JOIN equipos_hardware h ON c.id = h.creador_id
WHERE c.estado = 'Activo'
GROUP BY c.id, c.alias, c.plataforma
ORDER BY inversion_hardware DESC;

-- 4. Promedio de audiencia e identificador de stream más visto por plataforma
SELECT 
    c.plataforma,
    COUNT(t.id) AS total_transmisiones,
    ROUND(AVG(t.espectadores_pico), 0) AS promedio_audiencia,
    MAX(t.espectadores_pico) AS pico_maximo
FROM creadores c
JOIN transmisiones t ON c.id = t.creador_id
WHERE c.estado = 'Activo'
GROUP BY c.plataforma;

-- 5. Consulta de auditoría de rendimiento: Streams con pérdidas de marcos por encima del umbral
SELECT 
    c.alias AS creador,
    t.titulo_stream,
    t.calidad_resolucion,
    mt.marcos_perdidos_pct,
    mt.bitrate_promedio_kbps
FROM metricas_transmision mt
JOIN transmisiones t ON mt.transmision_id = t.id
JOIN creadores c ON t.creador_id = c.id
WHERE mt.marcos_perdidos_pct > 1.00
ORDER BY mt.marcos_perdidos_pct DESC;