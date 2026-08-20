USE campuslands_mysql;

INSERT INTO tatuajes (
    nombre_cliente,
    nombre_artista,
    estilo,
    zona_cuerpo,
    precio,
    fecha_tatuaje,
    estado
) VALUES
('Carlos Mendoza', 'Valentina Ruiz', 'Realismo', 'Brazo', 850.00, '2026-07-02', 'completado'),
('Laura Castillo', 'Diego Torres', 'Minimalista', 'Muñeca', 320.00, '2026-07-05', 'completado'),
('Andres Ramirez', 'Valentina Ruiz', 'Blackwork', 'Espalda', 1200.00, '2026-07-10', 'completado'),
('Sofia Herrera', 'Mateo Gomez', 'Floral', 'Hombro', 600.00, '2026-07-15', 'agendado'),
('Daniel Morales', 'Diego Torres', 'Geometrico', 'Antebrazo', 750.00, '2026-07-18', 'completado'),
('Camila Perez', 'Mateo Gomez', 'Realismo', 'Pierna', 1450.00, '2026-07-22', 'agendado'),
('Juan Lopez', 'Valentina Ruiz', 'Tradicional', 'Pecho', 980.00, '2026-07-25', 'cancelado'),
('Maria Gonzalez', 'Diego Torres', 'Minimalista', 'Costillas', 450.00, '2026-07-28', 'completado'),
('Sebastian Ortiz', 'Mateo Gomez', 'Blackwork', 'Pantorrilla', 1100.00, '2026-08-02', 'completado'),
('Natalia Vargas', 'Valentina Ruiz', 'Floral', 'Espalda', 700.00, '2026-08-05', 'agendado');