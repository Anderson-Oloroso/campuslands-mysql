USE arquitectura_3d_3fn_db;

-- Insercion de Clientes
INSERT INTO clientes (nombre_cliente, email, pais) VALUES
('Inmobiliaria del Sur', 'contacto@inmosur.com', 'Guatemala'),
('Constructora Habitat', 'proyectos@habitat.com', 'Mexico'),
('Desarrollos Urbanos SA', 'info@desarrollos.com', 'Colombia'),
('Grupo Arquitectura Viva', 'admin@arqviva.com', 'Costa Rica');

-- Insercion de Estudios de Renderizado
INSERT INTO estudios_render (nombre_estudio, especialidad, tarifa_base_m2) VALUES
('Pixel Arch 3D', 'Exterior y Paisajismo', 120.00),
('V-Ray Studio', 'Interiorismo de Lujo', 150.00),
('BIM & Render Tech', 'Estructuras Complejas', 180.00),
('Lumina Visuals', 'Animacion y Recorridos', 200.00);

-- Insercion de 8 Proyectos 3D
INSERT INTO proyectos_3d (id_cliente, id_estudio, nombre_proyecto, m2_superficie, costo_total_usd, estado, fecha_inicio) VALUES
(1, 1, 'Torre Mirador Altavista', 1500.00, 180000.00, 'entregado', '2026-01-10'),
(2, 2, 'Penthouse Zona Rosa', 320.00, 48000.00, 'en_render', '2026-01-20'),
(3, 3, 'Centro Logistico Norte', 4500.00, 810000.00, 'en_diseno', '2026-02-01'),
(1, 4, 'Video Recorrido Condominio', 800.00, 160000.00, 'en_render', '2026-02-15'),
(4, 2, 'Restaurante Gourmet Loft', 250.00, 37500.00, 'entregado', '2026-03-01'),
(2, 1, 'Plaza Comercial San Jose', 2200.00, 264000.00, 'en_diseno', '2026-03-05'),
(3, 4, 'Masterplan Parque Industrial', 6000.00, 1200000.00, 'entregado', '2026-03-10'),
(4, 3, 'Modulo Hospitalario 3D', 1800.00, 324000.00, 'cancelado', '2026-03-12');
