use estudio_tatuajes_db;

insert into tatuadores (nombre_completo, especialidad, anios_experiencia, estado_laboral) values
('Jinx Master', 'Neo-Traditional', 7, 'activo'),
('Vi Cutter', 'Blackwork', 5, 'activo'),
('Ekko Chrono', 'Cyberpunk', 4, 'activo'),
('Caitlyn Kiramman', 'Fine Line', 6, 'activo'),
('Jayce Talis', 'Realism', 8, 'activo'),
('Viktor Machine', 'Geometric', 9, 'activo'),
('Heimerdinger Yordle', 'Watercolor', 12, 'descanso'),
('Mel Medarda', 'Ornamental', 5, 'activo');

insert into clientes (nombre_cliente, correo_electronico, telefono, fecha_registro) values
('Angela Arrivillaga', 'angela.arrivillaga@campus.com', '+50231112233', '2026-01-15 10:00:00'),
('Iker Dahinten', 'iker.dahinten@campus.com', '+50232223344', '2026-02-10 11:30:00'),
('Allison Vargas', 'allison.vargas@campus.com', '+50233334455', '2026-03-05 14:15:00'),
('Cleidy Mosquera', 'cleidy.mosquera@campus.com', '+50234445566', '2026-04-12 09:45:00'),
('Anderson Perez', 'anderson.perez@campus.com', '+50235556677', '2026-05-20 16:20:00'),
('Evelin Romero', 'evelin.romero@campus.com', '+50236667788', '2026-06-01 13:10:00'),
('Carlos Mendoza', 'carlos.mendoza@campus.com', '+50237778899', '2026-06-18 11:00:00'),
('Sam Drake', 'sam.drake@campus.com', '+50238889900', '2026-07-02 15:30:00');

insert into citas_tatuaje (id_cliente, id_tatuador, estilo_tatuaje, precio_estimado, estado_cita, fecha_cita) values
(1, 1, 'Neo-Traditional Sleeve', 450.00, 'completada', '2026-06-20 10:00:00'),
(2, 2, 'Blackwork Abstract', 300.00, 'completada', '2026-06-22 14:00:00'),
(3, 3, 'Cyberpunk Neon Details', 600.00, 'programada', '2026-09-01 11:30:00'),
(4, 4, 'Fine Line Floral', 250.00, 'programada', '2026-09-05 09:00:00'),
(5, 5, 'Portrait Realism', 850.00, 'completada', '2026-07-10 12:00:00'),
(6, 6, 'Sacred Geometry', 400.00, 'programada', '2026-09-12 15:00:00'),
(7, 1, 'Neo-Traditional Panther', 350.00, 'completada', '2026-07-25 10:30:00'),
(8, 3, 'Cyberpunk Sleeve', 750.00, 'programada', '2026-09-20 13:00:00');