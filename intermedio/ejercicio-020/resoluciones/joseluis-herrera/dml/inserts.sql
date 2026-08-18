USE campuslands_mysql;

INSERT INTO tatuajes (
    nombre_cliente,
    nombre_tatuador,
    estilo,
    tamano_cm,
    precio,
    fecha_cita,
    estado
)
VALUES
    ('Carlos Méndez', 'Diego Vargas', 'Realismo', 18.50, 950.00, '2026-08-01', 'Completada'),
    ('Ana López', 'Laura Castillo', 'Minimalista', 8.00, 450.00, '2026-08-02', 'Completada'),
    ('Luis García', 'Diego Vargas', 'Geométrico', 12.00, 650.00, '2026-08-03', 'Programada'),
    ('María Pérez', 'Sofía Ramírez', 'Floral', 15.00, 800.00, '2026-08-04', 'Completada'),
    ('Jorge Morales', 'Laura Castillo', 'Minimalista', 6.50, 350.00, '2026-08-05', 'Programada'),
    ('Valeria Torres', 'Sofía Ramírez', 'Realismo', 20.00, 1200.00, '2026-08-06', 'Completada'),
    ('Andrés Herrera', 'Diego Vargas', 'Japonés', 22.00, 1400.00, '2026-08-07', 'Programada'),
    ('Sofía Morales', 'Laura Castillo', 'Floral', 10.00, 550.00, '2026-08-08', 'Cancelada'),
    ('Daniel Ramírez', 'Sofía Ramírez', 'Geométrico', 14.00, 750.00, '2026-08-09', 'Completada'),
    ('Paola Hernández', 'Diego Vargas', 'Japonés', 16.00, 1000.00, '2026-08-10', 'Programada'),
    ('Mateo Castillo', 'Laura Castillo', 'Realismo', 17.00, 900.00, '2026-08-11', 'Completada'),
    ('Gabriela Torres', 'Sofía Ramírez', 'Floral', 13.00, 700.00, '2026-08-12', 'Programada');