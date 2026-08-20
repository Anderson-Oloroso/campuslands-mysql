USE estudio_tatuajes_db;

-- 1. Listado completo de citas de tatuaje relacionando codigo, cliente, artista, estilo, costo y estado operativo
SELECT c.codigo_cita, c.nombre_cliente, c.nombre_artista, e.nombre_estilo AS estilo, c.costo_estimado, c.duracion_horas, c.estado_cita
FROM citas_tatuajes c
JOIN estilos_tatuaje e ON c.id_estilo = e.id_estilo
ORDER BY c.fecha_cita DESC;

-- 2. Conteo de citas, costo promedio e ingresos acumulados agrupados por cada estilo de tatuaje
SELECT e.nombre_estilo AS estilo, COUNT(c.id_cita) AS total_citas, ROUND(AVG(c.costo_estimado), 2) AS costo_promedio, SUM(c.costo_estimado) AS ingresos_totales
FROM estilos_tatuaje e
LEFT JOIN citas_tatuajes c ON e.id_estilo = c.id_estilo
GROUP BY e.id_estilo, e.nombre_estilo
ORDER BY ingresos_totales DESC;

-- 3. Citas de tatuaje que se encuentran con estado 'programada' o 'en_proceso' ordenadas por costo estimado de manera ascendente
SELECT c.codigo_cita, c.nombre_cliente, c.nombre_artista, e.nombre_estilo AS estilo, c.costo_estimado, c.fecha_cita, c.estado_cita
FROM citas_tatuajes c
JOIN estilos_tatuaje e ON c.id_estilo = e.id_estilo
WHERE c.estado_cita IN ('programada', 'en_proceso')
ORDER BY c.costo_estimado ASC;

-- 4. Top 5 de citas o piezas de tatuaje mas costosas registradas en el estudio
SELECT c.codigo_cita, c.nombre_cliente, c.nombre_artista, e.nombre_estilo AS estilo, c.costo_estimado, c.duracion_horas, c.estado_cita
FROM citas_tatuajes c
JOIN estilos_tatuaje e ON c.id_estilo = e.id_estilo
ORDER BY c.costo_estimado DESC
LIMIT 5;

-- 5. Analisis de productividad y rendimiento agrupado por artista residente calculando el total de horas invertidas y la facturacion estimada
SELECT c.nombre_artista, COUNT(c.id_cita) AS citas_asignadas, SUM(c.duracion_horas) AS horas_totales_trabajo, SUM(c.costo_estimado) AS facturacion_estimada_artista
FROM citas_tatuajes c
GROUP BY c.nombre_artista
ORDER BY facturacion_estimada_artista DESC;