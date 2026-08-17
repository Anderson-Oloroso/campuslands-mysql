-- DQL: Reportes e inspección del Event Scheduler y estado de la flota
USE campuslands_mysql;

-- 1. Verificación de los eventos programados activos en la base de datos
SELECT 
    EVENT_NAME AS nombre_evento,
    EVENT_TYPE AS tipo_evento,
    INTERVAL_VALUE AS intervalo,
    INTERVAL_FIELD AS unidad_tiempo,
    STATUS AS estado_evento
FROM INFORMATION_SCHEMA.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql';

-- 2. Estado de la flota con indicador de necesidad de mantenimiento por horas de vuelo
SELECT 
    nave_id,
    nombre,
    modelo,
    estado_mision,
    horas_vuelo,
    nivel_energia,
    CASE 
        WHEN horas_vuelo > 5000 THEN 'Mantenimiento Urgente'
        WHEN nivel_energia < 25.00 THEN 'Energía Crítica'
        ELSE 'Operativa'
    END AS diagnostico
FROM naves_espaciales
ORDER BY horas_vuelo DESC;

-- 3. Promedio de nivel de energía y horas de vuelo por estado de misión
SELECT 
    estado_mision,
    COUNT(*) AS total_naves,
    ROUND(AVG(nivel_energia), 2) AS promedio_energia,
    ROUND(AVG(horas_vuelo), 0) AS promedio_horas_vuelo
FROM naves_espaciales
GROUP BY estado_mision
ORDER BY promedio_energia ASC;

-- 4. Registro de alertas de la bitácora generadas por el scheduler o acciones automáticas
SELECT 
    b.log_id,
    n.nombre AS nave,
    n.modelo,
    b.descripcion,
    b.fecha_evento
FROM bitacora_mantenimiento b
INNER JOIN naves_espaciales n ON b.nave_id = n.nave_id
ORDER BY b.fecha_evento DESC;

-- 5. Naves con estado 'mantenimiento' o 'inactiva' que requieren recarga o supervisión
SELECT 
    nombre,
    modelo,
    nivel_energia,
    estado_mision,
    ultima_revision
FROM naves_espaciales
WHERE estado_mision IN ('mantenimiento', 'inactiva')
ORDER BY nivel_energia ASC;
