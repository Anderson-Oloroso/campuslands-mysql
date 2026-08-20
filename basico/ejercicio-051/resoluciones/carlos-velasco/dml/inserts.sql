USE campuslands_mysql;

INSERT INTO dibujos (
    titulo,
    artista,
    estilo,
    programa,
    resolucion,
    horas_trabajo,
    precio,
    estado,
    fecha_creacion
) VALUES
    ('Guardian del Bosque', 'Laura Martinez', 'Fantasia', 'Photoshop', '3840x2160', 18.50, 450.00, 'finalizado', '2026-01-10'),
    ('Ciudad Neon', 'Carlos Herrera', 'Cyberpunk', 'Krita', '2560x1440', 12.00, 320.00, 'finalizado', '2026-01-18'),
    ('Retrato Lunar', 'Sofia Ramirez', 'Realismo', 'Procreate', '3000x3000', 15.75, 380.00, 'en_proceso', '2026-01-25'),
    ('Dragon Ancestral', 'Diego Morales', 'Fantasia', 'Clip Studio', '4000x3000', 24.00, 600.00, 'finalizado', '2026-02-03'),
    ('Paisaje de Montana', 'Valentina Cruz', 'Paisaje', 'Photoshop', '3840x2160', 10.50, 250.00, 'finalizado', '2026-02-11'),
    ('Guerrero Espacial', 'Andres Lopez', 'Ciencia Ficcion', 'Krita', '2560x1440', 20.00, 520.00, 'en_proceso', '2026-02-19'),
    ('Gato Astronauta', 'Laura Martinez', 'Ilustracion', 'Procreate', '2048x2048', 7.25, 180.00, 'borrador', '2026-03-01'),
    ('Princesa del Hielo', 'Sofia Ramirez', 'Fantasia', 'Clip Studio', '3000x4000', 16.00, 410.00, 'finalizado', '2026-03-08'),
    ('Ciudad del Futuro', 'Carlos Herrera', 'Cyberpunk', 'Photoshop', '3840x2160', 14.50, 390.00, 'en_proceso', '2026-03-15'),
    ('Samurai Rojo', 'Diego Morales', 'Anime', 'Krita', '3000x2000', 11.00, 290.00, 'finalizado', '2026-03-22');