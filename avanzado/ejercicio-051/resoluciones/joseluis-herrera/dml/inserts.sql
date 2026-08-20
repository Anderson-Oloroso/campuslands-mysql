USE campuslands_mysql;

INSERT INTO dibujos (
    titulo,
    artista,
    tecnica,
    categoria,
    nivel_dificultad,
    precio,
    estado,
    fecha_creacion
) VALUES
('Ciudad Nocturna', 'Laura Gomez', 'Digital Painting', 'Paisaje', 'avanzado', 450.00, 'vendido', '2026-01-15'),
('Bosque Encantado', 'Carlos Ramirez', 'Ilustracion', 'Fantasia', 'intermedio', 280.00, 'disponible', '2026-02-03'),
('Retrato Cyberpunk', 'Sofia Martinez', 'Digital Painting', 'Retrato', 'avanzado', 520.00, 'reservado', '2026-02-18'),
('Gato Espacial', 'Daniel Torres', 'Pixel Art', 'Animales', 'basico', 120.00, 'disponible', '2026-03-05'),
('Guerrera de Fantasia', 'Laura Gomez', 'Ilustracion', 'Personaje', 'avanzado', 390.00, 'vendido', '2026-03-20'),
('Paisaje Montañoso', 'Carlos Ramirez', 'Acuarela Digital', 'Paisaje', 'intermedio', 240.00, 'disponible', '2026-04-11'),
('Robot Explorador', 'Sofia Martinez', 'Pixel Art', 'Ciencia Ficcion', 'intermedio', 180.00, 'vendido', '2026-05-02'),
('Dragon Rojo', 'Daniel Torres', 'Ilustracion', 'Fantasia', 'avanzado', 600.00, 'reservado', '2026-05-19'),
('Retrato Floral', 'Laura Gomez', 'Digital Painting', 'Retrato', 'intermedio', 310.00, 'disponible', '2026-06-07'),
('Astronauta Perdido', 'Sofia Martinez', 'Digital Painting', 'Ciencia Ficcion', 'avanzado', 480.00, 'vendido', '2026-06-22');