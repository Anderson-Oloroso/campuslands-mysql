USE campuslands_mysql;

INSERT INTO participantes (
    codigo_inscripcion,
    nombre,
    apellido,
    categoria,
    distancia_km,
    tiempo_minutos,
    estado,
    fecha_registro
) VALUES
('CU-2026-001', 'Carlos', 'Mendez', 'juvenil', 5.00, 28.50, 'finalizo', '2026-01-15'),
('CU-2026-002', 'Laura', 'Gomez', 'juvenil', 5.00, 31.20, 'finalizo', '2026-01-15'),
('CU-2026-003', 'Diego', 'Ramirez', 'adulto', 10.00, 52.40, 'finalizo', '2026-02-10'),
('CU-2026-004', 'Ana', 'Lopez', 'adulto', 10.00, 58.70, 'finalizo', '2026-02-10'),
('CU-2026-005', 'Miguel', 'Castillo', 'adulto', 10.00, 61.30, 'finalizo', '2026-02-10'),
('CU-2026-006', 'Sofia', 'Hernandez', 'senior', 5.00, 34.80, 'finalizo', '2026-03-05'),
('CU-2026-007', 'Jorge', 'Perez', 'senior', 10.00, 65.20, 'finalizo', '2026-03-05'),
('CU-2026-008', 'Ricardo', 'Morales', 'adulto', 10.00, 70.50, 'retirado', '2026-03-05');