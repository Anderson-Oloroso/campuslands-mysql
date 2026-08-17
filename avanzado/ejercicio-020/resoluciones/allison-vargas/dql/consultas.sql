-- DQL: Consultas optimizadas que aprovechan los índices definidos
USE campuslands_mysql;

-- 1. Búsqueda por rango de fechas (Aprovecha idx_citas_fecha)
SELECT 
    c.codigo_cita,
    c.cliente_nombre,
    t.nombre AS tatuador,
    c.estilo,
    c.fecha_cita,
    c.monto_total
FROM citas_tatuajes c
INNER JOIN tatuadores t ON c.tatuador_id = t.tatuador_id
WHERE c.fecha_cita BETWEEN '2026-07-01' AND '2026-07-15'
ORDER BY c.fecha_cita ASC;

-- 2. Análisis de citas por tatuador y estado (Aprovecha idx_tatuador_estado)
SELECT 
    t.nombre AS tatuador,
    c.estado,
    COUNT(*) AS cantidad_citas,
    ROUND(SUM(c.monto_total), 2) AS total_facturado
FROM citas_tatuajes c
INNER JOIN tatuadores t ON c.tatuador_id = t.tatuador_id
GROUP BY t.nombre, c.estado
ORDER BY t.nombre ASC;

-- 3. Filtrado por estilo y presupuesto elevado (Aprovecha idx_estilo_monto)
SELECT 
    c.codigo_cita,
    c.cliente_nombre,
    c.estilo,
    c.zona_cuerpo,
    c.monto_total
FROM citas_tatuajes c
WHERE c.estilo IN ('realismo', 'blackwork') AND c.monto_total >= 200.00
ORDER BY c.monto_total DESC;

-- 4. Reporte de productividad por especialidad del estudio
SELECT 
    t.especialidad,
    COUNT(c.cita_id) AS citas_totales,
    ROUND(AVG(c.duracion_horas), 1) AS duracion_promedio_hs,
    ROUND(SUM(c.monto_total), 2) AS ingresos_generados
FROM tatuadores t
LEFT JOIN citas_tatuajes c ON t.tatuador_id = c.tatuador_id AND c.estado = 'completada'
GROUP BY t.especialidad
ORDER BY ingresos_generados DESC;

-- 5. Demostración de EXPLAIN para verificar el uso de índices en la búsqueda
EXPLAIN SELECT 
    c.codigo_cita,
    c.cliente_nombre,
    c.monto_total
FROM citas_tatuajes c
WHERE c.tatuador_id = 1 AND c.estado = 'completada';
