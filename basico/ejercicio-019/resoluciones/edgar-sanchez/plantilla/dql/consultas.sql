SELECT 
    s.salto_id,
    cs.nombre_centro,
    cp.nombre_completo AS cliente,
    ip.nombre_completo AS instructor,
    s.modalidad,
    s.altitud_pies,
    s.fecha_hora_salto,
    s.precio_usd
FROM saltos_paracaidismo s
INNER JOIN centros_salto cs ON s.centro_id = cs.centro_id
INNER JOIN clientes_paracaidistas cp ON s.cliente_id = cp.cliente_id
INNER JOIN instructores_paracaidismo ip ON s.instructor_id = ip.instructor_id
ORDER BY s.fecha_hora_salto DESC;

SELECT 
    ip.nombre_completo AS instructor,
    ip.licencia_uspa,
    COUNT(s.salto_id) AS total_saltos_realizados,
    SUM(s.precio_usd) AS total_facturado_usd
FROM instructores_paracaidismo ip
INNER JOIN saltos_paracaidismo s ON ip.instructor_id = s.instructor_id
GROUP BY ip.instructor_id, ip.nombre_completo, ip.licencia_uspa
ORDER BY total_saltos_realizados DESC;