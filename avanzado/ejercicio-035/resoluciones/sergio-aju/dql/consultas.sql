USE campuslands_mysql;

-- 1. Análisis de Rendimiento (EXPLAIN) utilizando el índice compuesto `idx_marca_estado`
EXPLAIN SELECT 
    codigo_orden,
    propietario,
    modelo_moto,
    costo_servicio
FROM taller_mecanico_indices
WHERE marca_moto = 'Yamaha' AND estado_reparacion = 'en_proceso';

-- 2. Consulta optimizada por fecha utilizando el índice `idx_fecha_ingreso`
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    fecha_ingreso,
    estado_reparacion
FROM taller_mecanico_indices
WHERE fecha_ingreso >= '2026-08-10'
ORDER BY fecha_ingreso ASC;

-- 3. Análisis de rendimiento con EXPLAIN para búsqueda exacta optimizada por el índice único `idx_codigo_orden_unique`
EXPLAIN SELECT 
    propietario,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo_servicio
FROM taller_mecanico_indices
WHERE codigo_orden = 'ORD-004';

-- 4. Reporte agrupado por marca de moto utilizando el índice simple `idx_marca_moto` para acelerar el agrupamiento
SELECT 
    marca_moto,
    COUNT(*) AS total_ordenes,
    SUM(costo_servicio) AS ingresos_totales,
    ROUND(AVG(costo_servicio), 2) AS costo_promedio
FROM taller_mecanico_indices
GROUP BY marca_moto
ORDER BY ingresos_totales DESC;

-- 5. Consulta combinada filtrando por estado y ordenando por costo con soporte de índices
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    tipo_servicio,
    costo_servicio,
    estado_reparacion
FROM taller_mecanico_indices
WHERE estado_reparacion IN ('pendiente', 'en_proceso')
ORDER BY costo_servicio DESC;