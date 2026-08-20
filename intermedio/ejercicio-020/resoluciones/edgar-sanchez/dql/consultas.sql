-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    c.cita_id,
    cl.nombre_cliente,
    a.apodo_artistico AS artista,
    c.descripcion_disenio,
    c.zona_cuerpo,
    c.monto_total_usd,
    c.estado_cita
FROM citas_tatuajes c
INNER JOIN clientes_tatuajes cl ON c.cliente_id = cl.cliente_id
INNER JOIN artistas_tatuajes a ON c.artista_id = a.artista_id
WHERE c.monto_total_usd > (
    SELECT AVG(monto_total_usd) 
    FROM citas_tatuajes 
    WHERE estado_cita = 'Completada'
)
ORDER BY c.monto_total_usd DESC;

SELECT 
    a.artista_id,
    a.nombre_artista,
    a.apodo_artistico,
    a.estilo_principal,
    a.tarifa_por_hora_usd,
    (
        SELECT COUNT(c.cita_id) 
        FROM citas_tatuajes c 
        WHERE c.artista_id = a.artista_id AND c.estado_cita = 'Completada'
    ) AS citas_completadas,
    COALESCE((
        SELECT SUM(c.monto_total_usd) 
        FROM citas_tatuajes c 
        WHERE c.artista_id = a.artista_id AND c.estado_cita = 'Completada'
    ), 0.00) AS total_recaudado_usd
FROM artistas_tatuajes a
WHERE a.artista_id IN (
    SELECT DISTINCT artista_id 
    FROM citas_tatuajes 
    WHERE estado_cita = 'Completada'
)
ORDER BY total_recaudado_usd DESC;