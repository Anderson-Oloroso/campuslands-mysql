USE campuslands_mysql;

-- 1. EXPLAIN: citas de un mecanico en una fecha (usa el indice unico como prefijo)
EXPLAIN
SELECT id_cita, tipo_servicio, hora_cita, estado
FROM citas_taller_avanzado
WHERE mecanico = 'Pedro Ariza' AND fecha_cita = '2026-01-10';

-- 2. EXPLAIN: citas de un tipo de servicio ordenadas por costo (usa idx_citas_taller_avanzado_tipo_costo)
EXPLAIN
SELECT id_cita, mecanico, costo
FROM citas_taller_avanzado
WHERE tipo_servicio = 'reparacion'
ORDER BY costo DESC;

-- 3. Citas de un mecanico especifico, ordenadas por fecha y hora
SELECT id_cita, tipo_servicio, fecha_cita, hora_cita, estado
FROM citas_taller_avanzado
WHERE mecanico = 'Pedro Ariza'
ORDER BY fecha_cita, hora_cita;

-- 4. Citas de un tipo de servicio, de mas cara a mas barata
SELECT id_cita, mecanico, costo, fecha_cita
FROM citas_taller_avanzado
WHERE tipo_servicio = 'reparacion'
ORDER BY costo DESC;

-- 5. Ingresos totales por mecanico, solo citas realizadas
SELECT mecanico, SUM(costo) AS ingresos
FROM citas_taller_avanzado
WHERE estado = 'realizada'
GROUP BY mecanico
ORDER BY ingresos DESC;

-- 6. Citas registradas en un rango de fechas (usa idx_citas_taller_avanzado_fecha)
SELECT id_cita, mecanico, tipo_servicio, fecha_cita
FROM citas_taller_avanzado
WHERE fecha_cita BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha_cita;

-- Nota de validacion manual: el indice unico mecanico+fecha+hora evita
-- dobles reservas. Por ejemplo, intentar:
--   INSERT INTO citas_taller_avanzado (id_cliente, mecanico, tipo_servicio, costo, fecha_cita, hora_cita)
--   VALUES (4, 'Pedro Ariza', 'cambio_aceite', 40.00, '2026-01-10', '10:00:00');
-- debe fallar con Duplicate entry, porque Pedro Ariza ya tiene una cita
-- exactamente a esa fecha y hora (no se ejecuta aqui para no interrumpir el script).
