USE campuslands_mysql;

-- 1. total de servicios realizados por tipo
SELECT tipo_servicio, COUNT(*) AS cantidad_servicios, SUM(costo) AS ingreso_total
FROM servicios_taller
GROUP BY tipo_servicio;

-- 2. servicios completados en una fecha especifica (beneficiado por idx_fecha_servicio)
SELECT c.nombre, s.tipo_servicio, s.costo
FROM servicios_taller s
JOIN clientes_taller c ON s.cliente_id = c.id
WHERE s.fecha_servicio = '2026-08-15';

-- 3. clientes con más servicios realizados
SELECT c.nombre, COUNT(s.id) AS total_servicios
FROM clientes_taller c
JOIN servicios_taller s ON c.id = s.cliente_id
GROUP BY c.id
ORDER BY total_servicios DESC;

-- 4. reporte de servicios pendientes (beneficiado por idx_estado_servicio)
SELECT c.nombre, s.tipo_servicio, s.fecha_servicio
FROM servicios_taller s
JOIN clientes_taller c ON s.cliente_id = c.id
WHERE s.estado = 'pendiente';

-- 5. ranking de tipos de servicio por costo promedio
SELECT tipo_servicio, AVG(costo) AS costo_promedio
FROM servicios_taller
GROUP BY tipo_servicio
ORDER BY costo_promedio DESC;