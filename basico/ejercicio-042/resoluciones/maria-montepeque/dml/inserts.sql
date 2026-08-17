-- Datos de practica: canciones de una playlist musical.
USE campuslands_mysql;

INSERT INTO canciones_basico (titulo, artista, genero, duracion_seg, anio_lanzamiento, reproducciones, favorita) VALUES
('Luces de la Ciudad', 'Mateo Rivas', 'pop', 210, 2023, 15400, TRUE),
('Corazon de Acero', 'Banda Sonora', 'rock', 245, 2020, 9800, FALSE),
('Ritmo Tropical', 'Santi Belmonte', 'reggaeton', 195, 2024, 22300, TRUE),
('Noche Electrica', 'DJ Nico', 'electronica', 230, 2022, 18700, FALSE),
('Improvisacion Azul', 'Cuarteto Andino', 'jazz', 280, 2019, 3200, FALSE),
('Sinfonia del Amanecer', 'Orquesta Filarmonica', 'clasica', 320, 2018, 2100, TRUE),
('Verano Sin Ti', 'Mateo Rivas', 'pop', 200, 2024, 25600, TRUE),
('Cadenas Rotas', 'Banda Sonora', 'rock', 260, 2021, 7400, FALSE),
('Fiesta en la Playa', 'Santi Belmonte', 'reggaeton', 205, 2023, 19800, FALSE);
