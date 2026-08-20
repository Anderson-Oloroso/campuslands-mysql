USE campuslands_mysql;

INSERT INTO clientes
    (nombre, telefono, correo)
VALUES
    ('Constructora Horizonte', '5551-1001', 'contacto@horizonte.com'),
    ('Grupo Urbano Maya', '5551-1002', 'proyectos@urbanomaya.com'),
    ('Inversiones Central', '5551-1003', 'info@inversionescentral.com'),
    ('Desarrollos del Valle', '5551-1004', 'contacto@desarrollosvalle.com');

INSERT INTO arquitectos
    (nombre, especialidad, experiencia_anios)
VALUES
    ('Ana Martinez', 'Arquitectura residencial', 8),
    ('Carlos Ramirez', 'Arquitectura comercial', 10),
    ('Laura Gomez', 'Diseño sostenible', 6),
    ('Diego Herrera', 'Modelado 3D', 7),
    ('Sofia Morales', 'Urbanismo', 12);

INSERT INTO proyectos_arquitectura
    (nombre, tipo_proyecto, presupuesto, estado, fecha_inicio, cliente_id, arquitecto_id)
VALUES
    ('Casa Moderna', 'Residencial', 45000.00, 'planificado', '2026-01-10', 1, 1),
    ('Torre Empresarial', 'Comercial', 120000.00, 'en_progreso', '2026-01-15', 2, 2),
    ('Villa Minimalista', 'Residencial', 65000.00, 'planificado', '2026-01-25', 1, 3),
    ('Centro Cultural', 'Publico', 85000.00, 'en_progreso', '2026-02-05', 3, 5),
    ('Edificio Inteligente', 'Comercial', 150000.00, 'planificado', '2026-02-18', 2, 4),
    ('Complejo Deportivo', 'Deportivo', 95000.00, 'pausado', '2026-03-01', 4, 5),
    ('Casa Ecologica', 'Residencial', 55000.00, 'finalizado', '2026-03-12', 3, 3),
    ('Museo Digital', 'Publico', 110000.00, 'en_progreso', '2026-03-20', 4, 4);