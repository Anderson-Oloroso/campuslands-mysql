-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO firmas_arquitectura (nombre_firma, pais_sede, ciudad_sede) VALUES
('Gensler Spatial', 'Estados Unidos', 'San Francisco'),
('Foster + Partners Viz', 'Reino Unido', 'Londres'),
('Zaha Hadid Virtual', 'Reino Unido', 'Londres');

INSERT INTO clientes_arquitectura (nombre_cliente, correo, telefono) VALUES
('Desarrollos Inmobiliarios Futura', 'contacto@futura.com', '+502 2222-1000'),
('Corporación Plaza Central', 'proyectos@plazacentral.com', '+502 2222-2000'),
('Inversiones Urbanas', 'info@inversionesurbanas.com', '+1 305 555-4000');

INSERT INTO arquitectos_3d (firma_id, nombre_arquitecto, correo, especialidad_render) VALUES
(1, 'Rodrigo Fuentes', 'rodrigo.fuentes@gensler.com', 'ArchViz Exterior'),
(1, 'Lorena Gómez', 'lorena.gomez@gensler.com', 'ArchViz Interior'),
(2, 'William Thorne', 'william.thorne@foster.com', 'BIM 3D'),
(3, 'Sophia Rossi', 'sophia.rossi@zaha.com', 'Recorridos Virtuales');

INSERT INTO proyectos_3d (cliente_id, arquitecto_id, nombre_proyecto, tipo_uso, area_construccion_m2, presupuesto_render_usd, fecha_entrega) VALUES
(1, 1, 'Torre Panorama', 'Residencial', 15000.00, 8500.00, '2026-09-15'),
(1, 2, 'Lobby Residencial Panorama', 'Residencial', 450.00, 3200.00, '2026-09-30'),
(2, 3, 'Centro Comercial Metropolis', 'Comercial', 35000.00, 18000.00, '2026-10-20'),
(3, 4, 'Masterplan Distrito Innovación', 'Urbanístico', 80000.00, 25000.00, '2026-11-01');

INSERT INTO entregables_render (proyecto_id, tipo_formato, resolucion_px, duracion_segundos) VALUES
(1, 'Renders 4K', '3840x2160', 0),
(1, 'Video 360', '3840x2160', 120),
(2, 'Renders 4K', '3840x2160', 0),
(3, 'VR Tour', '7680x4320', 0),
(4, 'Plano 3D Interactive', '3840x2160', 300);