USE campuslands_mysql;

-- 1. Mecanicos con mas de 2 servicios completados
SELECT mecanico, COUNT(*) AS servicios_completados
FROM servicios_taller_intermedio
WHERE estado = 'completado'
GROUP BY mecanico
HAVING COUNT(*) > 2
ORDER BY servicios_completados DESC;

-- 2. Tipos de servicio con ingreso total (solo completados) mayor a 200
SELECT tipo_servicio, SUM(costo) AS ingreso_total
FROM servicios_taller_intermedio
WHERE estado = 'completado'
GROUP BY tipo_servicio
HAVING SUM(costo) > 200
ORDER BY ingreso_total DESC;

-- 3. Marcas de moto atendidas mas de una vez
SELECT moto_marca, COUNT(*) AS total_servicios
FROM servicios_taller_intermedio
GROUP BY moto_marca
HAVING COUNT(*) > 1
ORDER BY total_servicios DESC;

-- 4. Mecanicos cuyo total facturado en servicios completados supera 300
SELECT mecanico, SUM(costo) AS total_facturado
FROM servicios_taller_intermedio
WHERE estado = 'completado'
GROUP BY mecanico
HAVING SUM(costo) > 300
ORDER BY total_facturado DESC;

-- 5. Tipos de servicio cuyo costo promedio supera 100
SELECT tipo_servicio, AVG(costo) AS costo_promedio
FROM servicios_taller_intermedio
GROUP BY tipo_servicio
HAVING AVG(costo) > 100
ORDER BY costo_promedio DESC;

-- 6. Fechas con mas de un servicio registrado el mismo dia
SELECT fecha_servicio, COUNT(*) AS servicios_en_el_dia
FROM servicios_taller_intermedio
GROUP BY fecha_servicio
HAVING COUNT(*) > 1
ORDER BY fecha_servicio;
