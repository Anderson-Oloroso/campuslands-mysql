USE estudio_tatuajes_db;

INSERT INTO estilos_tatuaje (nombre_estilo, descripcion_estilo) VALUES
('Neo-Traditional', 'Lineas gruesas, colores vibrantes y disenos ornamentales modernos'),
('Blackwork & Dark', 'Trazos negros intensos, sombras profundas y estetica oscura'),
('Fine Line Minimalista', 'Lineas extremadamente finas, delicadas y de gran precision'),
('Anime & Pop Culture', 'Estilo inspirado en animacion japonesa, videojuegos y cultura geek');

INSERT INTO tatuajes_studio (codigo_tatuaje, nombre_diseno, id_estilo, precio_estimado, tiempo_horas, estado_diseno) VALUES
('TAT-001', 'Pantera Neo-Traditional con Rosas', 1, 350.00, 5, 'disponible'),
('TAT-002', 'Daga Orlada Estilo Neo-Traditional', 1, 280.00, 4, 'reservado'),
('TAT-003', 'Manga Completa Blackwork Gotico', 2, 850.00, 14, 'disponible'),
('TAT-004', 'Geometria Sagrada Blackwork Minimal', 2, 400.00, 6, 'completado'),
('TAT-005', 'Constelacion y Luna Fine Line', 3, 150.00, 2, 'disponible'),
('TAT-006', 'Mariposa Delicada Fine Line', 3, 120.00, 2, 'disponible'),
('TAT-007', 'Jinx Arcane Portrait Anime', 4, 500.00, 8, 'reservado'),
('TAT-008', 'Hollow Knight Shade Core Anime', 4, 320.00, 5, 'completado');