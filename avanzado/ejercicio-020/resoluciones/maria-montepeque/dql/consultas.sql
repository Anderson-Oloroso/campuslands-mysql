USE campuslands_mysql;

-- 1. EXPLAIN: citas de un tatuador en una fecha (usa el indice unico como prefijo)
EXPLAIN
SELECT id_cita, estilo, hora_cita, estado
FROM citas_avanzado
WHERE tatuador = 'Kike Nunez' AND fecha_cita = '2026-01-10';

-- 2. EXPLAIN: citas de un estilo ordenadas por precio (usa idx_citas_avanzado_estilo_precio)
EXPLAIN
SELECT id_cita, tatuador, precio
FROM citas_avanzado
WHERE estilo = 'realismo'
ORDER BY precio DESC;

-- 3. Citas de un tatuador especifico, ordenadas por fecha y hora
SELECT id_cita, estilo, fecha_cita, hora_cita, estado
FROM citas_avanzado
WHERE tatuador = 'Kike Nunez'
ORDER BY fecha_cita, hora_cita;

-- 4. Citas de un estilo, ordenadas de mas cara a mas barata
SELECT id_cita, tatuador, precio, fecha_cita
FROM citas_avanzado
WHERE estilo = 'realismo'
ORDER BY precio DESC;

-- 5. Ingresos totales por tatuador, solo citas realizadas
SELECT tatuador, SUM(precio) AS ingresos
FROM citas_avanzado
WHERE estado = 'realizada'
GROUP BY tatuador
ORDER BY ingresos DESC;

-- 6. Citas registradas en un rango de fechas (usa idx_citas_avanzado_fecha)
SELECT id_cita, tatuador, estilo, fecha_cita
FROM citas_avanzado
WHERE fecha_cita BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY fecha_cita;

-- Nota de validacion manual: el indice unico tatuador+fecha+hora evita
-- dobles reservas. Por ejemplo, intentar:
--   INSERT INTO citas_avanzado (id_cliente, tatuador, estilo, precio, fecha_cita, hora_cita)
--   VALUES (4, 'Kike Nunez', 'blackwork', 200.00, '2026-01-10', '10:00:00');
-- debe fallar con Duplicate entry, porque Kike Nunez ya tiene una cita
-- exactamente a esa fecha y hora (no se ejecuta aqui para no interrumpir el script).
