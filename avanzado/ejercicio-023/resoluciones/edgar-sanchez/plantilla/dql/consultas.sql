SHOW GRANTS FOR 'rol_director_estudio';
SHOW GRANTS FOR 'rol_arquitecto_senior';
SHOW GRANTS FOR 'rol_cliente_visor';

SHOW GRANTS FOR 'usr_carlos_director'@'localhost';
SHOW GRANTS FOR 'usr_ana_senior'@'localhost';
SHOW GRANTS FOR 'usr_cliente_consulta'@'localhost';

SELECT 
    p.proyecto_id,
    p.nombre_proyecto,
    c.nombre_empresa AS cliente,
    a.nombre_arquitecto AS director_lider,
    p.tipo_edificacion,
    p.presupuesto_usd,
    p.estado_proyecto
FROM proyectos_arquitectura p
INNER JOIN clientes_estudio c ON p.cliente_id = c.cliente_id
INNER JOIN arquitectos_3d a ON p.arquitecto_lider_id = a.arquitecto_id
ORDER BY p.proyecto_id ASC;

SELECT 
    r.render_id,
    p.nombre_proyecto,
    r.titulo_vista,
    r.tipo_vista,
    r.motor_render,
    r.tiempo_render_minutos,
    rev.observaciones,
    rev.aprobado
FROM renders_arquitectonicos r
INNER JOIN proyectos_arquitectura p ON r.proyecto_id = p.proyecto_id
LEFT JOIN revisiones_render rev ON r.render_id = rev.render_id
ORDER BY r.render_id ASC;