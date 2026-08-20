USE campuslands_mysql;

SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE placa = 'MTO103'
ORDER BY fecha_servicio DESC;



SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE estado = 'pendiente'
ORDER BY fecha_servicio ASC;


SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE fecha_servicio BETWEEN '2026-07-01' AND '2026-07-31'
ORDER BY fecha_servicio DESC;

SELECT
    tipo_servicio,
    COUNT(*) AS total_servicios,
    AVG(costo) AS costo_promedio
FROM servicios_taller
GROUP BY tipo_servicio
ORDER BY costo_promedio DESC;

SELECT
    marca,
    COUNT(*) AS total_servicios,
    SUM(costo) AS costo_total
FROM servicios_taller
GROUP BY marca
ORDER BY total_servicios DESC, costo_total DESC;


SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE estado = 'en proceso'
  AND fecha_servicio >= '2026-07-01'
ORDER BY fecha_servicio ASC;

SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo,
    estado
FROM servicios_taller
ORDER BY costo DESC
LIMIT 5;

EXPLAIN
SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE placa = 'MTO103';

EXPLAIN
SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE estado = 'finalizado'
  AND fecha_servicio >= '2026-07-15'
ORDER BY fecha_servicio ASC;