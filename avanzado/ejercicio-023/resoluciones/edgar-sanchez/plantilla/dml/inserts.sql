INSERT INTO arquitectos_3d (nombre_arquitecto, especialidad, correo, nivel_acceso) VALUES
('Carlos Mendoza', 'Visualización Exterior', 'carlos.mendoza@arch3d.com', 'Director'),
('Ana Lucía Gómez', 'Diseño de Interiores 3D', 'ana.gomez@arch3d.com', 'Senior'),
('David Morales', 'Modelado BIM / Estructuras', 'david.morales@arch3d.com', 'Junior');

INSERT INTO clientes_estudio (nombre_empresa, contacto_principal, correo, telefono) VALUES
('Desarrollos Urbanos S.A.', 'Ing. Roberto Silva', 'rsilva@urbanos.com', '555123456'),
('Inmobiliaria El Bosque', 'Arq. Maria Torres', 'mtorres@elbosque.com', '555987654');

INSERT INTO proyectos_arquitectura (cliente_id, arquitecto_lider_id, nombre_proyecto, tipo_edificacion, presupuesto_usd, estado_proyecto) VALUES
(1, 1, 'Torre Residencial Altavista', 'Rascacielos / Residencial', 450000.00, 'En Renderizado'),
(2, 2, 'Centro Comercial Paseo Real', 'Comercial', 280000.00, 'En Diseño');

INSERT INTO renders_arquitectonicos (proyecto_id, titulo_vista, tipo_vista, motor_render, resolucion, tiempo_render_minutos) VALUES
(1, 'Vista Fachada Principal Atardecer', 'Exterior', 'V-Ray 6', '3840x2160', 145),
(1, 'Penthouse Sala de Estar', 'Interior', 'Corona Renderer', '3840x2160', 90),
(2, 'Plataforma de Comidas General', 'Interior', 'Unreal Engine 5', '1920x1080', 45);

INSERT INTO revisiones_render (render_id, fecha_revision, observaciones, aprobado) VALUES
(1, '2026-08-15 11:00:00', 'Ajustar la iluminación de acento en la entrada principal.', FALSE),
(2, '2026-08-16 16:30:00', 'Texturas de madera aprobadas. Ajustar reflexión del cristal.', TRUE);


DROP ROLE IF EXISTS 'rol_director_estudio';
DROP ROLE IF EXISTS 'rol_arquitecto_senior';
DROP ROLE IF EXISTS 'rol_cliente_visor';

CREATE ROLE 'rol_director_estudio';
CREATE ROLE 'rol_arquitecto_senior';
CREATE ROLE 'rol_cliente_visor';

GRANT ALL PRIVILEGES ON *.* TO 'rol_director_estudio' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE ON proyectos_arquitectura TO 'rol_arquitecto_senior';
GRANT SELECT, INSERT, UPDATE ON renders_arquitectonicos TO 'rol_arquitecto_senior';
GRANT SELECT, INSERT, UPDATE ON revisiones_render TO 'rol_arquitecto_senior';
GRANT SELECT ON arquitectos_3d TO 'rol_arquitecto_senior';
GRANT SELECT ON clientes_estudio TO 'rol_arquitecto_senior';

GRANT SELECT ON proyectos_arquitectura TO 'rol_cliente_visor';
GRANT SELECT ON renders_arquitectonicos TO 'rol_cliente_visor';
GRANT SELECT ON revisiones_render TO 'rol_cliente_visor';

DROP USER IF EXISTS 'usr_carlos_director'@'localhost';
DROP USER IF EXISTS 'usr_ana_senior'@'localhost';
DROP USER IF EXISTS 'usr_cliente_consulta'@'localhost';

CREATE USER 'usr_carlos_director'@'localhost' IDENTIFIED BY 'DirectorPass2026!';
CREATE USER 'usr_ana_senior'@'localhost' IDENTIFIED BY 'SeniorPass2026!';
CREATE USER 'usr_cliente_consulta'@'localhost' IDENTIFIED BY 'ClientPass2026!';

GRANT 'rol_director_estudio' TO 'usr_carlos_director'@'localhost';
GRANT 'rol_arquitecto_senior' TO 'usr_ana_senior'@'localhost';
GRANT 'rol_cliente_visor' TO 'usr_cliente_consulta'@'localhost';

SET DEFAULT ROLE ALL TO 
    'usr_carlos_director'@'localhost',
    'usr_ana_senior'@'localhost',
    'usr_cliente_consulta'@'localhost';

FLUSH PRIVILEGES;