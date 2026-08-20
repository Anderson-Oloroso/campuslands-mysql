USE campuslands_mysql;

-- 1. Filtrado y ordenamiento avanzado: Mostrar citas completadas con costo mayor a 200 USD ordenadas por satisfacción descendentemente
SELECT 
    codigo_cita,
    nombre_cliente,
    nombre_artista,
    estilo_tatuaje,
    costo_usd,
    calificacion_satisfaccion
FROM citas_tatuajes
WHERE estado_cita = 'completado' AND costo_usd > 200.00
ORDER BY calificacion_satisfaccion DESC, costo_usd DESC;

-- 2. Reporte analítico agrupado por estilo de tatuaje: Conteo de citas, costo promedio y duración media
SELECT 
    estilo_tatuaje,
    COUNT(*) AS total_citas,
    ROUND(AVG(costo_usd), 2) AS costo_promedio_usd,
    ROUND(AVG(tiempo_estimado_horas), 1) AS duracion_media_horas
FROM citas_tatuajes
GROUP BY estilo_tatuaje
ORDER BY total_citas DESC;

-- 3. Análisis de ingresos generados y volumen de trabajo agrupado por el estado actual de la cita
SELECT 
    estado_cita,
    COUNT(*) AS cantidad_citas,
    SUM(costo_usd) AS ingreso_total_estado_usd,
    ROUND(AVG(calificacion_satisfaccion), 1) AS satisfaccion_promedio
FROM citas_tatuajes
GROUP BY estado_cita
ORDER BY ingreso_total_estado_usd DESC;

-- 4. Top 3 de los trabajos más costosos y mejor calificados del estudio de tatuajes
SELECT 
    codigo_cita,
    nombre_cliente,
    nombre_artista,
    estilo_tatuaje,
    costo_usd,
    calificacion_satisfaccion
FROM citas_tatuajes
ORDER BY costo_usd DESC, calificacion_satisfaccion DESC
LIMIT 3;

-- 5. Consulta analítica proyectada: Cálculo de ingresos por hora estimada para evaluar la rentabilidad por servicio
SELECT 
    codigo_cita,
    nombre_cliente,
    estilo_tatuaje,
    costo_usd,
    tiempo_estimado_horas,
    ROUND((costo_usd / tiempo_estimado_horas), 2) AS rentabilidad_por_hora_usd
FROM citas_tatuajes
WHERE estado_cita IN ('completado', 'en_proceso')
ORDER BY rentabilidad_por_hora_usd DESC;