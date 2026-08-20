USE saga_scifi_db;

-- 1. Listado cronologico de eventos de la saga ordenados por fecha real de ocurrencia
SELECT titulo_evento, tipo_hito, fecha_evento, anio_universo_ficcion, estado_registro
FROM eventos_saga
ORDER BY fecha_evento ASC;

-- 2. Conteo de hitos agrupados por tipo de evento en la cronologia
SELECT tipo_hito, COUNT(*) AS total_eventos, MIN(fecha_evento) AS primer_registro
FROM eventos_saga
GROUP BY tipo_hito
ORDER BY total_eventos DESC;

-- 3. Eventos ocurridos despues del año 2220 filtrados por estado activo
SELECT titulo_evento, tipo_hito, fecha_evento, anio_universo_ficcion
FROM eventos_saga
WHERE fecha_evento > '2220-01-01' AND estado_registro = 'activo'
ORDER BY fecha_evento ASC;

-- 4. Extraccion del año real del evento utilizando funciones de fecha (YEAR)
SELECT titulo_evento, fecha_evento, YEAR(fecha_evento) AS anio_real, anio_universo_ficcion
FROM eventos_saga
ORDER BY anio_real DESC;

-- 5. Calculo de antiguedad y lapso temporal transcurrido desde cada evento hasta la fecha actual de referencia (2026)
SELECT titulo_evento, fecha_evento, 
       DATEDIFF('2026-08-18', fecha_evento) AS dias_transcurridos,
       ROUND(DATEDIFF('2026-08-18', fecha_evento) / 365.25, 1) AS anos_transcurridos
FROM eventos_saga
ORDER BY fecha_evento ASC;