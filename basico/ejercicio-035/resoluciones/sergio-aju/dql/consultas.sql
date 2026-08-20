USE campuslands_mysql;

-- 1. Consultar todas las órdenes de servicio ordenadas por el costo del servicio de mayor a menor
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo_servicio,
    estado_reparacion
FROM taller_mecanico_motos
ORDER BY costo_servicio DESC;

-- 2. Filtrar únicamente las órdenes de servicio que se encuentran pendientes o en proceso
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    fecha_ingreso,
    estado_reparacion
FROM taller_mecanico_motos
WHERE estado_reparacion IN ('pendiente', 'en_proceso')
ORDER BY fecha_ingreso ASC;

-- 3. Agrupación por marca de motocicleta para conocer el total de ingresos y el costo promedio de los servicios
SELECT 
    marca_moto,
    COUNT(*) AS total_ordenes,
    SUM(costo_servicio) AS ingresos_totales,
    ROUND(AVG(costo_servicio), 2) AS costo_promedio_servicio
FROM taller_mecanico_motos
GROUP BY marca_moto
ORDER BY ingresos_totales DESC;

-- 4. Top 3 de los servicios más costosos registrados en el taller mecánico
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    tipo_servicio,
    costo_servicio
FROM taller_mecanico_motos
ORDER BY costo_servicio DESC
LIMIT 3;

-- 5. Reporte analítico agrupado por el estado de reparación de las motocicletas
SELECT 
    estado_reparacion,
    COUNT(*) AS cantidad_ordenes,
    SUM(costo_servicio) AS valor_acumulado_estado
FROM taller_mecanico_motos
GROUP BY estado_reparacion
ORDER BY cantidad_ordenes DESC;