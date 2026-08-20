USE equipo_streaming_db;

-- 1. Consultar equipos de streaming combinando la tabla principal con su respectiva marca (JOIN básico) y ordenados por precio descendente
SELECT 
    e.codigo_equipo,
    e.nombre_equipo,
    e.tipo_equipo,
    m.nombre_marca AS marca,
    m.pais_origen,
    e.precio_usd,
    e.estado_operativo
FROM equipo_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id_marca
ORDER BY e.precio_usd DESC;

-- 2. Consultar únicamente equipos activos y funcionales vinculados a una marca específica (ejemplo: Elgato) utilizando JOIN y WHERE
SELECT 
    e.codigo_equipo,
    e.nombre_equipo,
    e.tipo_equipo,
    m.nombre_marca AS marca,
    e.precio_usd
FROM equipo_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id_marca
WHERE m.nombre_marca = 'Elgato' AND e.estado_operativo = 'activo'
ORDER BY e.precio_usd ASC;

-- 3. Filtrar equipos cuyo precio sea superior o igual a $200.00 USD mostrando información completa de su fabricante
SELECT 
    e.codigo_equipo,
    e.nombre_equipo,
    m.nombre_marca AS fabricante,
    e.tipo_equipo,
    e.precio_usd
FROM equipo_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id_marca
WHERE e.precio_usd >= 200.00
ORDER BY e.precio_usd DESC;

-- 4. Excluir estados operativos inactivos o retirados mediante NOT IN en combinación con un reporte relacional
SELECT 
    e.codigo_equipo,
    e.nombre_equipo,
    m.nombre_marca AS marca,
    e.estado_operativo,
    e.precio_usd
FROM equipo_streaming e
JOIN marcas_streaming m ON e.id_marca = m.id_marca
WHERE e.estado_operativo NOT IN ('en_reparacion', 'retirado')
ORDER BY e.precio_usd DESC;

-- 5. Reporte analítico agrupado por fabricante (marca): total de equipos registrados, inversión total acumulada y precio promedio por marca
SELECT 
    m.nombre_marca AS marca,
    COUNT(e.id_equipo) AS total_equipos,
    CONCAT('$', FORMAT(SUM(e.precio_usd), 2)) AS inversion_total_usd,
    CONCAT('$', FORMAT(AVG(e.precio_usd), 2)) AS precio_promedio_usd
FROM marcas_streaming m
LEFT JOIN equipo_streaming e ON m.id_marca = e.id_marca
GROUP BY m.id_marca, m.nombre_marca
ORDER BY SUM(e.precio_usd) DESC;