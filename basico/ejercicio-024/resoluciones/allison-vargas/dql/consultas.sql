USE soldadura_delete_db;

-- Consulta 1: Listado general de equipos remanentes en el inventario activo
SELECT 
    codigo_equipo AS 'Codigo',
    modelo AS 'Modelo Equipamiento',
    tipo_proceso AS 'Proceso',
    horas_uso AS 'Horas Acumuladas',
    estado AS 'Estado Actual'
FROM equipos_soldadura
ORDER BY horas_uso DESC;

-- Consulta 2: Promedio de horas de uso y gasto en mantenimiento por proceso
SELECT 
    tipo_proceso AS 'Proceso de Soldadura',
    COUNT(*) AS 'Equipos Activos',
    ROUND(AVG(horas_uso), 0) AS 'Promedio Horas Uso',
    SUM(costo_mantenimiento_usd) AS 'Costo Mantenimiento Total (USD)'
FROM equipos_soldadura
GROUP BY tipo_proceso
ORDER BY `Costo Mantenimiento Total (USD)` DESC;

-- Consulta 3: Equipos operativos en optimas condiciones (< 1500 horas de uso)
SELECT 
    codigo_equipo AS 'Equipo Optimo',
    modelo AS 'Modelo',
    horas_uso AS 'Horas de Uso',
    fecha_ultimo_mantenimiento AS 'Ultimo Mantenimiento'
FROM equipos_soldadura
WHERE estado = 'operativo' AND horas_uso < 1500
ORDER BY horas_uso ASC;

-- Consulta 4: Resumen de disponibilidad de inventario
SELECT 
    estado AS 'Estado Equipo',
    COUNT(*) AS 'Cantidad',
    ROUND(AVG(costo_mantenimiento_usd), 2) AS 'Costo Promedio Mantenimiento'
FROM equipos_soldadura
GROUP BY estado
ORDER BY Cantidad DESC;

-- Consulta 5: Top 3 equipos con mayor costo acumulado de mantenimiento
SELECT 
    codigo_equipo AS 'Codigo',
    modelo AS 'Equipo',
    costo_mantenimiento_usd AS 'Costo Mantenimiento (USD)',
    estado AS 'Estado'
FROM equipos_soldadura
ORDER BY costo_mantenimiento_usd DESC
LIMIT 3;
