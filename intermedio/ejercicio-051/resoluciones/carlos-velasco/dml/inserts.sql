USE campuslands_mysql;

INSERT INTO ilustraciones (
    titulo,
    artista,
    tecnica,
    programa,
    formato,
    resolucion_ancho,
    resolucion_alto,
    estado
) VALUES
    ('Ciudad Nocturna', 'Ana Martinez', 'Lineart', 'Krita', 'PNG', 3000, 2000, 'finalizada'),
    ('Guardian del Bosque', 'Luis Herrera', 'Pintura digital', 'Photoshop', 'PSD', 4000, 3000, 'finalizada'),
    ('Retrato Futurista', 'Sofia Castillo', 'Retrato', 'Procreate', 'PNG', 2500, 3500, 'en_proceso'),
    ('Paisaje Lunar', 'Diego Ramirez', 'Concept art', 'Krita', 'PNG', 3840, 2160, 'finalizada'),
    ('Robot Explorador', 'Valeria Cruz', 'Concept art', 'Photoshop', 'PSD', 3200, 2400, 'en_proceso'),
    ('Flor Digital', 'Carlos Mendoza', 'Ilustracion plana', 'Procreate', 'PNG', 2000, 2000, 'finalizada'),
    ('Criatura Marina', 'Laura Torres', 'Pintura digital', 'Krita', 'PSD', 3600, 2400, 'borrador'),
    ('Caballero Medieval', 'Mateo Lopez', 'Lineart', 'Clip Studio', 'PNG', 3000, 4000, 'en_proceso'),
    ('Universo Abstracto', 'Gabriela Perez', 'Arte abstracto', 'Photoshop', 'JPG', 3840, 2160, 'finalizada'),
    ('Mascota Pixel', 'Andres Morales', 'Pixel art', 'Aseprite', 'PNG', 1600, 1600, 'borrador');