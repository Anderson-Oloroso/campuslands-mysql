USE campuslands_mysql;

-- 1. Listado completo ordenado por fecha
SELECT id_servicio, moto_marca, moto_modelo, tipo_servicio, mecanico, costo, fecha_servicio
FROM servicios_moto_basico
ORDER BY fecha_servicio;

-- 2. Servicios de reparacion o personalizacion (los mas costosos habitualmente)
SELECT moto_marca, moto_modelo, tipo_servicio, costo
FROM servicios_moto_basico
WHERE tipo_servicio IN ('reparacion', 'personalizacion')
ORDER BY costo DESC;

-- 3. Costo promedio por tipo de servicio
SELECT tipo_servicio, COUNT(*) AS total_servicios, AVG(costo) AS costo_promedio
FROM servicios_moto_basico
GROUP BY tipo_servicio
ORDER BY costo_promedio DESC;

-- 4. Servicios realizados por cada mecanico
SELECT mecanico, COUNT(*) AS total_servicios
FROM servicios_moto_basico
GROUP BY mecanico
ORDER BY total_servicios DESC;

-- 5. Top 3 servicios mas caros
SELECT moto_marca, moto_modelo, tipo_servicio, costo
FROM servicios_moto_basico
ORDER BY costo DESC
LIMIT 3;

-- 6. Servicios realizados a motos Honda
SELECT moto_modelo, tipo_servicio, mecanico, costo
FROM servicios_moto_basico
WHERE moto_marca = 'Honda';
