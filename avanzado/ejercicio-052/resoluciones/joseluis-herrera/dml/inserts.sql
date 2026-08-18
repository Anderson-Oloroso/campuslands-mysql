USE campuslands_mysql;

INSERT INTO artistas (
    nombre,
    especialidad,
    experiencia_anios
) VALUES
('Laura Gomez', 'Modelado 3D', 5),
('Carlos Ramirez', 'Animacion', 7),
('Sofia Martinez', 'Texturizado', 4),
('Daniel Torres', 'Rigging', 6),
('Valentina Ruiz', 'Iluminacion', 3);

INSERT INTO proyectos_3d (
    titulo,
    tipo_animacion,
    duracion_segundos,
    presupuesto,
    estado,
    fecha_entrega
) VALUES
('Guardianes del Espacio', 'Cinematica', 180, 4500.00, 'finalizado', '2026-03-15'),
('Ciudad Futurista', 'Cortometraje', 300, 7200.00, 'en_produccion', '2026-04-20'),
('Aventura Submarina', 'Cinematica', 240, 5800.00, 'finalizado', '2026-05-10'),
('Robot Perdido', 'Cortometraje', 120, 3200.00, 'pendiente', '2026-06-05'),
('Mundo Fantastico', 'Video Musical', 210, 4900.00, 'en_produccion', '2026-06-18'),
('Viaje a Marte', 'Cinematica', 360, 8500.00, 'finalizado', '2026-07-01'),
('Bosque Magico', 'Cortometraje', 150, 3800.00, 'pendiente', '2026-07-15'),
('Carrera Espacial', 'Video Musical', 90, 2700.00, 'finalizado', '2026-07-28');

INSERT INTO proyectos_artistas (
    id_proyecto,
    id_artista,
    rol,
    horas_trabajadas
) VALUES
(1, 1, 'Modelador', 40),
(1, 2, 'Animador', 55),
(2, 1, 'Modelador', 60),
(2, 4, 'Rigging', 35),
(3, 3, 'Texturizador', 45),
(3, 2, 'Animador', 50),
(4, 4, 'Rigging', 30),
(5, 1, 'Modelador', 48),
(5, 5, 'Iluminador', 32),
(6, 2, 'Animador', 70),
(6, 3, 'Texturizador', 50),
(7, 3, 'Texturizador', 38),
(8, 5, 'Iluminador', 25);