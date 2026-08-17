-- DQL: Reportes y consultas de agregación con GROUP BY y HAVING
USE campuslands_mysql;

-- 1. Resumen de facturación e ingresos promedios por categoría turística
SELECT 
    categoria,
    COUNT(*) AS total_reservas,
    ROUND(SUM(monto_total), 2) AS facturacion_total_usd,
    ROUND(AVG(monto_total), 2) AS ticket_promedio_usd
FROM reservas_groupby
GROUP BY categoria
ORDER BY facturacion_total_usd DESC;

-- 2. Conteo de reservas agrupadas por estado del paquete
SELECT 
    estado,
    COUNT(*) AS cantidad_reservas,
    ROUND(SUM(monto_total), 2) AS total_monto_usd
FROM reservas_groupby
GROUP BY estado
ORDER BY cantidad_reservas DESC;

-- 3. Análisis de ingresos por región filtrando regiones con facturación superior a .00 (HAVING)
SELECT 
    region,
    COUNT(*) AS total_ventas,
    ROUND(SUM(monto_total), 2) AS total_ingresos_usd
FROM reservas_groupby
WHERE estado != 'cancelada'
GROUP BY region
HAVING total_ingresos_usd > 300.00
ORDER BY total_ingresos_usd DESC;

-- 4. Ranking de los destinos con mayor número de reservas confirmadas o completadas
SELECT 
    destino,
    region,
    COUNT(*) AS veces_reservado
FROM reservas_groupby
WHERE estado IN ('confirmada', 'completada')
GROUP BY destino, region
ORDER BY veces_reservado DESC;

-- 5. Promedio de ingresos agrupados por categoría y estado
SELECT 
    categoria,
    estado,
    COUNT(*) AS total_operaciones,
    ROUND(AVG(monto_total), 2) AS monto_promedio
FROM reservas_groupby
GROUP BY categoria, estado
ORDER BY categoria ASC, estado ASC;
