USE campuslands_mysql;

INSERT INTO saltos (
    nombre_participante,
    modalidad,
    altura_salto,
    precio,
    fecha_salto,
    experiencia_nivel,
    estado
) VALUES
    ('Carlos Ramírez', 'tandem', 10000, 250.00, '2026-09-05', 'principiante', 'programado'),
    ('Laura Gómez', 'tandem', 12000, 290.00, '2026-09-08', 'principiante', 'programado'),
    ('Andrés López', 'individual', 13000, 350.00, '2026-09-12', 'avanzado', 'programado'),
    ('Sofía Martínez', 'tandem', 10000, 250.00, '2026-08-20', 'principiante', 'realizado'),
    ('Daniel Hernández', 'curso', 14000, 520.00, '2026-09-18', 'intermedio', 'programado'),
    ('María Pérez', 'individual', 12000, 390.00, '2026-08-25', 'avanzado', 'realizado'),
    ('Jorge Morales', 'tandem', 10000, 250.00, '2026-09-22', 'principiante', 'programado'),
    ('Valeria Castillo', 'curso', 15000, 580.00, '2026-10-01', 'intermedio', 'programado'),
    ('Diego Torres', 'individual', 13000, 350.00, '2026-08-30', 'avanzado', 'cancelado'),
    ('Ana González', 'tandem', 11000, 270.00, '2026-10-05', 'principiante', 'programado');