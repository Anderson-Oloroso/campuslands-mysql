-- Consultas de negocio y análisis de optimización con EXPLAIN
USE campuslands_mysql;

-- 1. Consulta optimizada por índice compuesto (idx_citas_artista_estado_fecha)
-- Búsqueda de agenda programada de un artista específico
EXPLAIN SELECT 
    c.id AS cita_no,
    cl.nombre AS cliente,
    c.estilo,
    c.zona_cuerpo,
    c.fecha_hora,
    c.costo_total
FROM citas c
JOIN clientes cl ON c.cliente_id = cl.id
WHERE c.artista_id = 2 
  AND c.estado = 'programada'
ORDER BY c.fecha_hora ASC;

-- 2. Consulta optimizada por índice (idx_citas_estilo_costo)
-- Reporte de ingresos por estilo de tatuaje para sesiones de más de $300
SELECT 
    estilo,
    COUNT(*) AS total_citas,
    AVG(costo_total) AS costo_promedio,
    SUM(costo_total) AS recaudacion_total
FROM citas
WHERE costo_total >= 300.00
GROUP BY estilo
ORDER BY recaudacion_total DESC;

-- 3. Búsqueda de palabras clave usando el índice FULLTEXT (idx_citas_descripcion_ft)
SELECT 
    c.id,
    a.nombre AS artista,
    c.estilo,
    c.descripcion_diseno,
    c.costo_total
FROM citas c
JOIN artistas a ON c.artista_id = a.id
WHERE MATCH(c.descripcion_diseno) AGAINST('serpiente lobo' IN BOOLEAN MODE);

-- 4. Ranking de artistas más solicitados e ingresos generados (JOIN + GROUP BY)
SELECT 
    a.id AS artista_id,
    a.nombre AS artista,
    a.estilo_principal,
    COUNT(c.id) AS citas_totales,
    SUM(c.horas_estimadas) AS total_horas_trabajadas,
    COALESCE(SUM(c.costo_total), 0.00) AS ingresos_generados
FROM artistas a
LEFT JOIN citas c ON a.id = c.artista_id AND c.estado = 'completada'
GROUP BY a.id, a.nombre, a.estilo_principal
ORDER BY ingresos_generados DESC;

-- 5. Resumen diario de citas agendadas con formato de fecha (Índice idx_citas_fecha)
SELECT 
    DATE(fecha_hora) AS fecha_sesion,
    COUNT(*) AS total_sesiones_dia,
    SUM(horas_estimadas) AS horas_ocupadas_estudio,
    SUM(costo_total) AS proyeccion_ingresos
FROM citas
WHERE estado = 'programada'
GROUP BY DATE(fecha_hora)
ORDER BY fecha_sesion ASC;