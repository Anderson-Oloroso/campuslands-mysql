USE campuslands_mysql;


SELECT
    id,
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    fecha_servicio,
    costo
FROM servicios_taller;

SELECT
    placa,
    marca,
    modelo
FROM servicios_taller;

SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado
FROM servicios_taller
WHERE estado = 'finalizado';

SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
ORDER BY costo DESC;

SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    costo
FROM servicios_taller
ORDER BY costo DESC
LIMIT 5;

SELECT
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_servicio,
    costo
FROM servicios_taller
WHERE fecha_servicio BETWEEN '2026-07-01' AND '2026-07-31'
ORDER BY fecha_servicio ASC;