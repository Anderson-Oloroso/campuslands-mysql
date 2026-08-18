-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO artistas_dibujo (nombre_artista, nickname, correo, fecha_registro) VALUES
('Sofía Ramírez', 'SofiArt', 'sofia.ramirez@email.com', '2026-01-15'),
('Gabriel Fuentes', 'GaboDraws', 'gabriel.fuentes@email.com', '2026-02-10'),
('Valeria Gómez', 'ValeSketch', 'valeria.gomez@email.com', '2026-03-05');

INSERT INTO software_dibujo (nombre_software, desarrollador, licencia_tipo) VALUES
('Clip Studio Paint', 'Celsys', 'Pago Único'),
('Procreate', 'Savage Interactive', 'Pago Único'),
('Krita', 'Krita Foundation', 'Gratuito');

INSERT INTO ilustraciones (artista_id, software_id, titulo_ilustracion, ancho_px, alto_px, resolucion_dpi, horas_trabajo, fecha_creacion) VALUES
(1, 1, 'Atardecer Cyberpunk', 3840, 2160, 300, 12.50, '2026-04-10'),
(1, 2, 'Retrato de Fantasía', 2048, 2048, 300, 6.00, '2026-05-02'),
(2, 3, 'Guardián del Bosque', 4000, 3000, 350, 18.00, '2026-06-15'),
(3, 2, 'Gato Cósmico', 2048, 2048, 300, 4.50, '2026-07-01');

INSERT INTO ilustracion_etiquetas (ilustracion_id, nombre_etiqueta) VALUES
(1, 'Cyberpunk'),
(1, 'Sci-Fi'),
(1, 'Neon'),
(2, 'Fantasía'),
(2, 'Retrato'),
(3, 'Naturaleza'),
(3, 'Criaturas'),
(3, 'Fantasía'),
(4, 'Animales'),
(4, 'Espacio');

INSERT INTO ilustracion_paleta_colores (ilustracion_id, codigo_hex) VALUES
(1, '#FF0055'),
(1, '#00FFFF'),
(1, '#1A0033'),
(2, '#F3E5AB'),
(2, '#8B0000'),
(3, '#2E8B57'),
(3, '#8B4513'),
(4, '#4B0082'),
(4, '#FFD700');