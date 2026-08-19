use equipo_streaming_db;

insert into categorias_equipo (nombre_categoria, descripcion) values
('audio profesional', 'microfonos condenser, interfaces de audio y brazos articulados'),
('captura y video', 'camaras dslr, webcams 4k y tarjetas capturadoras hdmi'),
('iluminacion studio', 'paneles led rgb, aros de luz y difusores profesionales'),
('perifericos y control', 'stream decks, teclados mecanicos y paneles de macro'),
('soporte y conectividad', 'cables de alta velocidad, adaptadores y soportes de montaje');

insert into equipos_streaming (id_categoria, nombre_equipo, precio, stock, estado_operativo, fecha_adquisicion) values
(1, 'microfono shure sm7b vocal studio', 399.00, 8, 'disponible', '2026-01-15'),
(1, 'interfaz de audio elgato wave xlr', 159.99, 12, 'disponible', '2026-01-20'),
(2, 'camara sony mirrorless a6400 streaming kit', 899.50, 3, 'en_uso', '2026-02-10'),
(2, 'tarjeta capturadora elgato cam link 4k', 129.99, 15, 'disponible', '2026-02-15'),
(3, 'panel led loupedeck soft light rgb', 79.99, 20, 'disponible', '2026-03-01'),
(3, 'aro de luz led neo ring light 18 pulgadas', 49.99, 0, 'mantenimiento', '2026-03-10'),
(4, 'elgato stream deck mk.2 15 teclas', 149.99, 10, 'disponible', '2026-04-05'),
(4, 'panel de control macro custom tactile', 89.00, 4, 'en_uso', '2026-04-20'),
(5, 'cable hdmi 2.1 de alta velocidad 2m', 24.99, 35, 'disponible', '2026-05-01'),
(5, 'brazo articulado de escritorio para microfono', 35.50, 6, 'disponible', '2026-05-15');