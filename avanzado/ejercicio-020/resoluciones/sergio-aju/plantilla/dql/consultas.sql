USE campuslands_mysql;

-- 1. Búsqueda de citas por estilo utilizando el índice idx_estilo (con EXPLAIN)
EXPLAIN SELECT 
    id,
    cliente,
    estilo_diseno,
    costo_total,
    calificacion
FROM citas_tatuajes
WHERE estilo_diseno = 'Realismo B&G';

-- 2. Reporte de citas completadas filtradas por fecha aprovechando el índice compuesto idx_estado_fecha
EXPLAIN SELECT 
    id,
    cliente,
    estilo_diseno,
    fecha_cita,
    costo_total
FROM citas_tatuajes
WHERE estado = 'completada' 
  AND fecha_cita >= '2026-08-05'
ORDER BY fecha_cita DESC;

-- 3. Análisis de ingresos y satisfacción agrupados por estilo
SELECT 
    estilo_diseno,
    COUNT(*) AS total_citas,
    ROUND(AVG(costo_total), 2) AS costo_promedio,
    ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM citas_tatuajes
WHERE estado = 'completada'
GROUP BY estilo_diseno
ORDER BY costo_promedio DESC;

-- 4. Búsqueda de citas de alto valor con buena calificación usando idx_costo_calificacion
SELECT 
    cliente,
    estilo_diseno,
    costo_total,
    calificacion
FROM citas_tatuajes
WHERE costo_total >= 200.00 
  AND calificacion >= 4.70
ORDER BY costo_total DESC;

-- 5. Consulta de verificación para listar todos los índices creados en la tabla
SHOW INDEX FROM citas_tatuajes;