USE sci_fi_saga_db;

-- 1. Consultar la vista simple de misiones activas (en curso o planificadas) ordenadas por nivel de peligrosidad descendente
SELECT * 
FROM vw_misiones_activas
ORDER BY nivel_peligrosidad DESC;

-- 2. Consultar la vista simple de resumen por facción para evaluar estadísticas de operaciones espaciales
SELECT * 
FROM vw_resumen_facciones
ORDER BY total_misiones DESC;

-- 3. Consulta analítica cruzando tablas base para obtener el Top 3 de misiones más peligrosas y prolongadas de la saga
SELECT m.codigo_mision, m.nombre_mision, f.nombre_faccion AS faccion, m.nivel_peligrosidad, m.duracion_meses, m.estado_mision
FROM misiones_espaciales m
JOIN facciones_estelares f ON m.id_faccion = f.id_faccion
ORDER BY m.nivel_peligrosidad DESC, m.duracion_meses DESC
LIMIT 3;

-- 4. Reporte filtrado de misiones con estado 'completada' agrupadas y ordenadas por duración
SELECT m.codigo_mision, m.nombre_mision, f.nombre_faccion AS faccion, m.duracion_meses, m.nivel_peligrosidad
FROM misiones_espaciales m
JOIN facciones_estelares f ON m.id_faccion = f.id_faccion
WHERE m.estado_mision = 'completada'
ORDER BY m.duracion_meses DESC;

-- 5. Análisis estadístico global agrupado por estado de la misión evaluando cantidad de registros y nivel de riesgo medio
SELECT m.estado_mision, COUNT(*) AS cantidad_misiones, ROUND(AVG(m.nivel_peligrosidad), 1) AS riesgo_promedio, SUM(m.duracion_meses) AS duracion_acumulada_meses
FROM misiones_espaciales m
GROUP BY m.estado_mision
ORDER BY cantidad_misiones DESC;