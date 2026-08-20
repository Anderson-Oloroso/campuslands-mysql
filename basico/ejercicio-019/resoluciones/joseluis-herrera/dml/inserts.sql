USE campuslands_mysql;

INSERT INTO saltos
    (
        nombre_participante,
        modalidad,
        altura_salto,
        precio,
        fecha_salto,
        estado
    )
VALUES
    ('Carlos Méndez', 'Tándem', 10000, 1800.00, '2026-08-01', 'Completado'),
    ('Ana López', 'Tándem', 12000, 2200.00, '2026-08-02', 'Completado'),
    ('Luis García', 'Individual', 10000, 1500.00, '2026-08-03', 'Programado'),
    ('María Pérez', 'Tándem', 14000, 2600.00, '2026-08-04', 'Completado'),
    ('Sofía Ramírez', 'Individual', 12000, 1900.00, '2026-08-05', 'Programado'),
    ('Diego Hernández', 'Tándem', 10000, 1800.00, '2026-08-06', 'Cancelado'),
    ('Laura Castillo', 'Individual', 14000, 2300.00, '2026-08-07', 'Completado'),
    ('Jorge Morales', 'Tándem', 12000, 2200.00, '2026-08-08', 'Programado'),
    ('Valeria Torres', 'Tándem', 10000, 1800.00, '2026-08-09', 'Completado'),
    ('Andrés Ramírez', 'Individual', 14000, 2300.00, '2026-08-10', 'Programado');