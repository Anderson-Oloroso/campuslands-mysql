USE campuslands_mysql;

INSERT INTO arquitectos_3d (
    nombre,
    especialidad,
    experiencia_anios,
    estado
) VALUES
('Laura Mendoza', 'Modelado arquitectónico', 8, 'activo'),
('Daniel Herrera', 'Visualización 3D', 5, 'activo'),
('Sofia Ramirez', 'Diseño sostenible', 10, 'activo'),
('Mateo Castillo', 'Urbanismo digital', 7, 'activo'),
('Valentina Cruz', 'Renderizado arquitectónico', 6, 'activo'),
('Andres Molina', 'Diseño residencial', 12, 'activo'),
('Camila Torres', 'Arquitectura comercial', 4, 'activo'),
('Nicolas Vargas', 'Modelado BIM', 9, 'inactivo');


INSERT INTO proyectos_arquitectura_3d (
    nombre_proyecto,
    tipo_proyecto,
    ciudad,
    presupuesto,
    fecha_inicio,
    estado,
    id_arquitecto
) VALUES
('Torre Horizonte', 'Edificio corporativo', 'Ciudad de Guatemala', 850000.00, '2026-01-15', 'en_progreso', 1),
('Residencias Aurora', 'Complejo residencial', 'Antigua Guatemala', 620000.00, '2026-02-10', 'en_progreso', 6),
('Centro Comercial Nova', 'Centro comercial', 'Ciudad de Guatemala', 1250000.00, '2025-11-20', 'en_progreso', 7),
('Museo Forma', 'Museo', 'Quetzaltenango', 480000.00, '2025-08-05', 'finalizado', 3),
('Parque Digital', 'Espacio público', 'Mixco', 310000.00, '2026-03-12', 'planificado', 4),
('Villa Mediterranea', 'Residencia', 'Antigua Guatemala', 275000.00, '2025-06-18', 'finalizado', 6),
('Campus Innovacion', 'Campus educativo', 'Ciudad de Guatemala', 980000.00, '2026-01-28', 'en_progreso', 2),
('Galeria Central', 'Galeria comercial', 'Escuintla', 395000.00, '2026-04-02', 'planificado', 5),
('Hotel Mirador', 'Hotel', 'Panajachel', 760000.00, '2025-10-14', 'finalizado', 3),
('Distrito Verde', 'Complejo urbano', 'Mixco', 1100000.00, '2026-02-25', 'en_progreso', 4);