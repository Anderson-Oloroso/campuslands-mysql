SELECT 
    c.cita_id,
    a.nombre_artistico AS artista,
    cl.nombre_completo AS cliente,
    c.estilo_diseño,
    c.zona_cuerpo,
    c.tamano_cm,
    c.costo_estimado_usd,
    c.fecha_hora_cita,
    c.estado_cita
FROM citas_tatuaje c
INNER JOIN artistas_tatuajes a ON c.artista_id = a.artista_id
INNER JOIN clientes_tatuajes cl ON c.cliente_id = cl.cliente_id
WHERE c.estado_cita = 'Completada'
ORDER BY c.fecha_hora_cita DESC;

SELECT 
    a.nombre_artistico AS artista,
    a.especialidad_estilo,
    COUNT(c.cita_id) AS total_citas_agendadas,
    SUM(c.costo_estimado_usd) AS proyeccion_ingresos_usd,
    ROUND(AVG(c.costo_estimado_usd), 2) AS costo_promedio_tatuaje
FROM artistas_tatuajes a
LEFT JOIN citas_tatuaje c ON a.artista_id = c.artista_id
GROUP BY a.artista_id, a.nombre_artistico, a.especialidad_estilo
ORDER BY proyeccion_ingresos_usd DESC;