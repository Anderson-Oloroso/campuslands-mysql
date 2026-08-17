USE campuslands_mysql;

-- 1. EXPLAIN: citas de un tatuador en una fecha (usa el indice unico como prefijo)
EXPLAIN
SELECT id_cita, estilo, hora_cita, estado
FROM citas_estudio_avanzado
WHERE tatuador = 'Pedro Ariza' AND fecha_cita = '2026-01-10';

-- 2. EXPLAIN: citas de un estilo ordenadas por costo (usa idx_citas_estudio_avanzado_estilo_costo)
EXPLAIN
SELECT id_cita, tatuador, costo
FROM citas_estudio_avanzado
WHERE estilo = 'blackwork'
ORDER BY costo DESC;

-- 3. Citas de un tatuador especifico, ordenadas por fecha y hora
SELECT id_cita, estilo, fecha_cita, hora_cita, estado
FROM citas_estudio_avanzado
WHERE tatuador = 'Pedro Ariza'
ORDER BY fecha_cita, hora_cita;

-- 4. Citas de un estilo, de mas cara a mas barata
SELECT id_cita, tatuador, costo, fecha_cita
FROM citas_estudio_avanzado
WHERE estilo = 'blackwork'
ORDER BY costo DESC;

-- 5. Ingresos totales por tatuador, solo citas realizadas
SELECT tatuador, SUM(costo) AS ingresos
FROM citas_estudio_avanzado
WHERE estado = 'realizada'
GROUP BY tatuador
ORDER BY ingresos DESC;

-- 6. Citas registradas en un rango de fechas (usa idx_citas_estudio_avanzado_fecha)
SELECT id_cita, tatuador, estilo, fecha_cita
FROM citas_estudio_avanzado
WHERE fecha_cita BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha_cita;

-- Nota de validacion manual: el indice unico tatuador+fecha+hora evita
-- dobles reservas. Por ejemplo, intentar:
--   INSERT INTO citas_estudio_avanzado (id_cliente, tatuador, estilo, costo, fecha_cita, hora_cita)
--   VALUES (4, 'Pedro Ariza', 'realismo', 40.00, '2026-01-10', '10:00:00');
-- debe fallar con Duplicate entry, porque Pedro Ariza ya tiene una cita
-- exactamente a esa fecha y hora (no se ejecuta aqui para no interrumpir el script).
