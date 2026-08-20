-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;


SELECT 
    i.inspeccion_id,
    p.nombre_proyecto,
    s.nombre_soldador,
    s.codigo_certificacion,
    t.proceso_siglas AS proceso,
    i.longitud_junta_cm,
    i.resultado_inspeccion,
    i.costo_inspeccion_usd
FROM inspecciones_soldadura i
INNER JOIN proyectos_estrucutras p ON i.proyecto_id = p.proyecto_id
INNER JOIN soldadores s ON i.soldador_id = s.soldador_id
INNER JOIN tipos_soldadura t ON i.tipo_id = t.tipo_id
ORDER BY i.fecha_inspeccion DESC;

SELECT 
    s.soldador_id,
    s.nombre_soldador,
    s.nivel_experiencia,
    COUNT(i.inspeccion_id) AS total_inspecciones,
    SUM(CASE WHEN i.resultado_inspeccion = 'Aprobado' THEN 1 ELSE 0 END) AS juntas_aprobadas,
    SUM(CASE WHEN i.resultado_inspeccion != 'Aprobado' THEN 1 ELSE 0 END) AS juntas_con_fallas,
    COALESCE(SUM(i.longitud_junta_cm), 0.00) AS total_longitud_soldada_cm
FROM soldadores s
LEFT JOIN inspecciones_soldadura i ON s.soldador_id = i.soldador_id
GROUP BY s.soldador_id, s.nombre_soldador, s.nivel_experiencia
ORDER BY juntas_aprobadas DESC;