USE campuslands_mysql;

-- 1. Subconsulta Escalar: Mostrar aquellas órdenes cuyo costo de servicio sea superior al costo promedio general del taller
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    modelo_moto,
    costo_servicio
FROM taller_mecanico_subconsultas
WHERE costo_servicio > (SELECT AVG(costo_servicio) FROM taller_mecanico_subconsultas)
ORDER BY costo_servicio DESC;

-- 2. Subconsulta con IN: Consultar las órdenes correspondientes a las marcas de motos que tienen servicios con costos superiores a 300.00
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    modelo_moto,
    costo_servicio
FROM taller_mecanico_subconsultas
WHERE marca_moto IN (
    SELECT DISTINCT marca_moto 
    FROM taller_mecanico_subconsultas 
    WHERE costo_servicio > 300.00
)
ORDER BY marca_moto, costo_servicio DESC;

-- 3. Subconsulta en la Cláusula FROM (Tabla Derivada): Calcular el promedio de costo por marca y listar solo aquellas marcas cuyo promedio supere los 200.00
SELECT 
    t.marca_moto,
    t.total_servicios,
    t.promedio_costo
FROM (
    SELECT 
        marca_moto,
        COUNT(*) AS total_servicios,
        ROUND(AVG(costo_servicio), 2) AS promedio_costo
    FROM taller_mecanico_subconsultas
    GROUP BY marca_moto
) AS t
WHERE t.promedio_costo > 200.00
ORDER BY t.promedio_costo DESC;

-- 4. Subconsulta Correlacionada con EXISTS: Mostrar órdenes de servicio cuya marca pertenezca al grupo de marcas que tienen al menos una orden en estado 'pendiente'
SELECT 
    o1.codigo_orden,
    o1.propietario,
    o1.marca_moto,
    o1.estado_reparacion,
    o1.costo_servicio
FROM taller_mecanico_subconsultas AS o1
WHERE EXISTS (
    SELECT 1 
    FROM taller_mecanico_subconsultas AS o2 
    WHERE o2.marca_moto = o1.marca_moto 
      AND o2.estado_reparacion = 'pendiente'
)
ORDER BY o1.marca_moto, o1.costo_servicio DESC;

-- 5. Subconsulta Escalar en la Proyección (SELECT): Mostrar cada orden junto con la diferencia de su costo respecto al servicio más costoso registrado en el taller
SELECT 
    codigo_orden,
    propietario,
    marca_moto,
    costo_servicio,
    (SELECT MAX(costo_servicio) FROM taller_mecanico_subconsultas) AS costo_maximo_taller,
    ROUND((SELECT MAX(costo_servicio) FROM taller_mecanico_subconsultas) - costo_servicio, 2) AS diferencia_con_el_maximo
FROM taller_mecanico_subconsultas
ORDER BY costo_servicio DESC;