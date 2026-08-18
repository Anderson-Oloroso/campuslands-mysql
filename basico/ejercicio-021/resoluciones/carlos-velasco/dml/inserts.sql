USE campuslands_mysql;

INSERT INTO proyectos_digitales (
    nombre_proyecto,
    artista,
    tecnica,
    categoria,
    precio,
    horas_trabajo,
    fecha_entrega,
    estado
) VALUES
    ('Retrato de Luna', 'Carlos Méndez', 'Ilustración', 'Retrato', 450.00, 8.00, '2026-09-02', 'finalizado'),
    ('Ciudad Futurista', 'Laura Gómez', 'Digital Painting', 'Concept Art', 850.00, 15.00, '2026-09-05', 'en_proceso'),
    ('Guerrero Samurai', 'Andrés López', 'Ilustración', 'Personaje', 650.00, 12.00, '2026-09-08', 'en_proceso'),
    ('Bosque Encantado', 'Sofía Martínez', 'Digital Painting', 'Paisaje', 700.00, 10.00, '2026-08-20', 'finalizado'),
    ('Mascota Corporativa', 'Daniel Hernández', 'Vectorial', 'Branding', 300.00, 5.00, '2026-08-25', 'finalizado'),
    ('Dragón Oriental', 'María Pérez', 'Ilustración', 'Fantasia', 920.00, 18.00, '2026-09-12', 'pendiente'),
    ('Logo Minimalista', 'Jorge Morales', 'Vectorial', 'Branding', 250.00, 4.00, '2026-09-15', 'pendiente'),
    ('Retrato Familiar', 'Valeria Castillo', 'Ilustración', 'Retrato', 550.00, 9.00, '2026-09-18', 'en_proceso'),
    ('Nave Espacial', 'Diego Torres', 'Concept Art', 'Ciencia Ficcion', 1100.00, 20.00, '2026-08-30', 'cancelado'),
    ('Princesa Medieval', 'Ana González', 'Digital Painting', 'Personaje', 780.00, 14.00, '2026-09-22', 'pendiente'),
    ('Paisaje Montañoso', 'Fernando Ruiz', 'Digital Painting', 'Paisaje', 600.00, 9.00, '2026-10-01', 'finalizado'),
    ('Iconos para App', 'Paola Méndez', 'Vectorial', 'UI', 380.00, 6.00, '2026-10-05', 'en_proceso');