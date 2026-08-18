USE campuslands_mysql;

INSERT INTO peleadores
    (nombre, categoria, peso_kg, estado, fecha_registro)
VALUES
    ('Diego Morales', 'Peso ligero', 70.50, 'activo', '2026-01-15'),
    ('Carlos Ramirez', 'Peso ligero', 69.80, 'activo', '2026-01-18'),
    ('Mateo Castillo', 'Peso welter', 77.20, 'activo', '2026-01-22'),
    ('Andres Herrera', 'Peso welter', 76.90, 'activo', '2026-02-02'),
    ('Luis Mendoza', 'Peso medio', 83.40, 'activo', '2026-02-10'),
    ('Jorge Salazar', 'Peso medio', 84.10, 'activo', '2026-02-14'),
    ('Kevin Torres', 'Peso pesado', 96.50, 'activo', '2026-02-20'),
    ('Daniel Vargas', 'Peso pesado', 98.30, 'inactivo', '2026-02-25'),
    ('Miguel Rojas', 'Peso ligero', 71.10, 'activo', '2026-03-01'),
    ('Sebastian Leon', 'Peso welter', 75.80, 'activo', '2026-03-05');


INSERT INTO combates
    (id_peleador_a, id_peleador_b, fecha_combate, categoria, estado, resultado)
VALUES
    (1, 2, '2026-04-10', 'Peso ligero', 'finalizado', 'Diego Morales'),
    (3, 4, '2026-04-17', 'Peso welter', 'programado', NULL),
    (5, 6, '2026-04-24', 'Peso medio', 'programado', NULL),
    (7, 8, '2026-05-01', 'Peso pesado', 'cancelado', NULL),
    (9, 1, '2026-05-08', 'Peso ligero', 'programado', NULL),
    (10, 3, '2026-05-15', 'Peso welter', 'en_curso', NULL),
    (2, 9, '2026-05-22', 'Peso ligero', 'programado', NULL),
    (4, 10, '2026-05-29', 'Peso welter', 'finalizado', 'Sebastian Leon');