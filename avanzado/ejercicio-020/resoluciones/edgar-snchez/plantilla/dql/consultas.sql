EXPLAIN SELECT 
    c.cita_id,
    c.fecha_cita,
    c.estado_cita,
    cl.nombre_cliente,
    t.apodo AS tatuador
FROM citas_tatuajes c
INNER JOIN clientes_estudio cl ON c.cliente_id = cl.cliente_id
INNER JOIN tatuadores t ON c.tatuador_id = t.tatuador_id
WHERE c.fecha_cita >= '2026-08-01 00:00:00' AND c.estado_cita = 'Programada';

EXPLAIN SELECT 
    c.cita_id,
    c.fecha_cita,
    c.zona_cuerpo,
    c.costo_total,
    cl.nombre_cliente
FROM citas_tatuajes c
INNER JOIN clientes_estudio cl ON c.cliente_id = cl.cliente_id
WHERE c.tatuador_id = 1
ORDER BY c.fecha_cita DESC;

EXPLAIN SELECT 
    d.diseno_id,
    d.nombre_diseno,
    d.estilo,
    d.precio_estimado,
    t.apodo AS artista_creador
FROM disenos_catalogo d
INNER JOIN tatuadores t ON d.tatuador_id = t.tatuador_id
WHERE d.estilo = 'Realismo / Blackwork' AND d.precio_estimado <= 250.00;

SELECT 
    c.cita_id,
    c.fecha_cita,
    cl.nombre_cliente,
    cl.telefono,
    t.nombre_tatuador,
    t.apodo,
    COALESCE(d.nombre_diseno, 'Diseño Personalizado') AS diseno,
    c.zona_cuerpo,
    c.duracion_horas,
    c.costo_total,
    c.estado_cita
FROM citas_tatuajes c
INNER JOIN clientes_estudio cl ON c.cliente_id = cl.cliente_id
INNER JOIN tatuadores t ON c.tatuador_id = t.tatuador_id
LEFT JOIN disenos_catalogo d ON c.diseno_id = d.diseno_id
ORDER BY c.fecha_cita ASC;