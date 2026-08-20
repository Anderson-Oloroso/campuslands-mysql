



SELECT 
    p.paracaidista_id,
    p.nombre_paracaidista,
    p.licencia_numero,
    p.nivel_experiencia,
    p.total_saltos_registrados
FROM paracaidistas p
ORDER BY p.paracaidista_id ASC;

SELECT 
    eq.equipo_id,
    eq.codigo_equipo,
    eq.marca_modelo,
    eq.tipo_paracaidas,
    eq.saltos_acumulados_equipo,
    eq.estado_equipo
FROM equipos_paracaidismo eq
ORDER BY eq.equipo_id ASC;

SELECT 
    s.salto_id,
    s.codigo_salto,
    p.nombre_paracaidista,
    eq.codigo_equipo,
    z.nombre_zona,
    s.altitud_salto_pies,
    s.tiempo_caida_libre_seg,
    s.modalidad
FROM saltos_realizados s
INNER JOIN paracaidistas p ON s.paracaidista_id = p.paracaidista_id
INNER JOIN equipos_paracaidismo eq ON s.equipo_id = eq.equipo_id
INNER JOIN zonas_salto z ON s.zona_id = z.zona_id
ORDER BY s.salto_id ASC;

SELECT 
    b.auditoria_id,
    b.salto_id,
    b.paracaidista_id,
    b.equipo_id,
    b.accion_realizada,
    b.detalle_auditoria,
    b.fecha_registro
FROM bitacora_auditoria_saltos b
ORDER BY b.auditoria_id ASC;