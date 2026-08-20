USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    nivel,
    estado,
    fecha_registro
) VALUES
    ('Carlos Mendoza', 'avanzado', 'activo', '2026-01-10'),
    ('Laura Ramirez', 'intermedio', 'activo', '2026-01-12'),
    ('Mateo Castillo', 'avanzado', 'activo', '2026-01-15'),
    ('Sofia Herrera', 'intermedio', 'activo', '2026-01-18'),
    ('Daniel Torres', 'principiante', 'activo', '2026-01-20'),
    ('Valentina Cruz', 'avanzado', 'activo', '2026-01-22'),
    ('Andres Morales', 'intermedio', 'inactivo', '2026-01-25'),
    ('Camila Vargas', 'principiante', 'activo', '2026-01-28');


INSERT INTO partidos (
    jugador1_id,
    jugador2_id,
    puntos_jugador1,
    puntos_jugador2,
    estado,
    fecha_partido
) VALUES
    (1, 2, 11, 7, 'finalizado', '2026-02-01'),
    (3, 4, 11, 9, 'finalizado', '2026-02-03'),
    (5, 6, 6, 11, 'finalizado', '2026-02-05'),
    (1, 3, 11, 8, 'finalizado', '2026-02-08'),
    (2, 4, 9, 11, 'finalizado', '2026-02-10'),
    (6, 1, 11, 8, 'finalizado', '2026-02-12'),
    (3, 5, 11, 5, 'finalizado', '2026-02-15'),
    (4, 6, 7, 11, 'finalizado', '2026-02-18'),
    (1, 5, 11, 4, 'finalizado', '2026-02-20'),
    (2, 6, 0, 0, 'programado', '2026-03-01');