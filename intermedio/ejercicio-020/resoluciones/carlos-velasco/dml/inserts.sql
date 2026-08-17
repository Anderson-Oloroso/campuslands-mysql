USE campuslands_mysql;

INSERT INTO tatuajes (
    nombre_cliente,
    nombre_artista,
    estilo,
    zona_cuerpo,
    precio,
    duracion_horas,
    fecha_cita,
    estado
) VALUES
    ('Carlos Ramírez', 'Alejandro Ruiz', 'Realismo', 'Brazo', 850.00, 4.50, '2026-09-02', 'reservado'),
    ('Laura Gómez', 'Valentina Cruz', 'Minimalista', 'Muñeca', 300.00, 2.00, '2026-09-05', 'reservado'),
    ('Andrés López', 'Miguel Torres', 'Blackwork', 'Espalda', 1200.00, 6.00, '2026-09-08', 'reservado'),
    ('Sofía Martínez', 'Alejandro Ruiz', 'Realismo', 'Pierna', 950.00, 5.00, '2026-08-20', 'realizado'),
    ('Daniel Hernández', 'Valentina Cruz', 'Geométrico', 'Pecho', 700.00, 3.50, '2026-08-25', 'realizado'),
    ('María Pérez', 'Miguel Torres', 'Blackwork', 'Brazo', 600.00, 3.00, '2026-09-12', 'reservado'),
    ('Jorge Morales', 'Alejandro Ruiz', 'Tradicional', 'Hombro', 500.00, 2.50, '2026-09-15', 'reservado'),
    ('Valeria Castillo', 'Valentina Cruz', 'Minimalista', 'Costilla', 450.00, 2.50, '2026-09-18', 'reservado'),
    ('Diego Torres', 'Miguel Torres', 'Realismo', 'Pecho', 1100.00, 5.50, '2026-08-30', 'cancelado'),
    ('Ana González', 'Alejandro Ruiz', 'Floral', 'Antebrazo', 550.00, 3.00, '2026-09-22', 'reservado'),
    ('Fernando Ruiz', 'Miguel Torres', 'Blackwork', 'Pierna', 900.00, 4.50, '2026-10-01', 'realizado'),
    ('Paola Méndez', 'Valentina Cruz', 'Geométrico', 'Espalda', 780.00, 4.00, '2026-10-05', 'reservado');