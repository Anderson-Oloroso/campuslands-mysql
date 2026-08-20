USE campuslands_mysql;

INSERT INTO animadores (
    nombre,
    especialidad,
    experiencia_anios
) VALUES
('Carlos Mendoza', 'Modelado 3D', 5),
('Laura Castillo', 'Rigging', 7),
('Andres Ramirez', 'Animacion de personajes', 4),
('Sofia Torres', 'Texturizado', 6),
('Diego Herrera', 'Iluminacion 3D', 8),
('Valentina Cruz', 'Modelado 3D', 3);

INSERT INTO proyectos_animacion (
    titulo,
    software,
    presupuesto,
    fecha_entrega,
    estado
) VALUES
('Ciudad Futurista', 'Blender', 4500.00, '2026-01-20', 'finalizado'),
('Guardian del Bosque', 'Maya', 6200.00, '2026-02-05', 'finalizado'),
('Viaje Espacial', 'Blender', 7800.00, '2026-02-18', 'activo'),
('Robot Explorador', 'Cinema 4D', 3900.00, '2026-03-01', 'activo'),
('Criatura Marina', 'Maya', 5500.00, '2026-03-12', 'finalizado'),
('Batalla Galactica', 'Blender', 9500.00, '2026-03-25', 'activo'),
('Mundo Miniatura', 'Cinema 4D', 2800.00, '2026-04-03', 'archivado'),
('Dragones de Fuego', 'Maya', 8300.00, '2026-04-15', 'activo');

INSERT INTO asignaciones_animacion (
    id_proyecto,
    id_animador,
    horas_asignadas
) VALUES
(1, 1, 24.00),
(1, 4, 16.00),
(2, 2, 32.00),
(2, 5, 18.00),
(3, 3, 40.00),
(3, 1, 20.00),
(4, 4, 22.00),
(5, 5, 28.00),
(5, 2, 20.00),
(6, 3, 45.00),
(6, 1, 30.00),
(7, 4, 15.00),
(8, 2, 35.00),
(8, 3, 25.00);