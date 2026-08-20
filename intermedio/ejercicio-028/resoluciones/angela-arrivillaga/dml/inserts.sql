use academia_tech_db;

insert into estudiantes (documento_identidad, nombre_completo, correo_electronico, estado_estudiante) values
('1098765432', 'angela arrivillaga', 'angela.arrivillaga@campus.tech', 'activo'),
('1098123456', 'carlos perez', 'carlos.perez@campus.tech', 'activo'),
('1098654321', 'maria gomez', 'maria.gomez@campus.tech', 'graduado'),
('1098987654', 'anderson rodriguez', 'anderson.rodriguez@campus.tech', 'activo'),
('1098111222', 'allison vargas', 'allison.vargas@campus.tech', 'activo'),
('1098333444', 'iker dahinten', 'iker.dahinten@campus.tech', 'suspendido'),
('1098555666', 'cleidy martinez', 'cleidy.martinez@campus.tech', 'activo'),
('1098777888', 'evelin suarez', 'evelin.suarez@campus.tech', 'graduado');

insert into cursos (codigo_curso, nombre_curso, duracion_horas, costo_curso) values
('CRS-SQL', 'bases de datos relacionales mysql', 60, 250.00),
('CRS-PY', 'programacion orientada a objetos en python', 80, 300.00),
('CRS-WEB', 'desarrollo web frontend con html y css', 50, 200.00),
('CRS-GIT', 'control de versiones con git y github', 30, 150.00);

insert into estudiantes_cursos (id_estudiante, id_curso, fecha_inscripcion, calificacion_final, estado_inscripcion) values
(1, 1, '2026-02-01', 95.50, 'aprobado'),
(1, 2, '2026-03-01', 88.00, 'aprobado'),
(2, 1, '2026-02-05', 72.00, 'aprobado'),
(2, 3, '2026-03-10', null, 'cursando'),
(3, 2, '2026-01-15', 90.00, 'aprobado'),
(4, 4, '2026-04-01', 65.50, 'reprobado'),
(5, 1, '2026-02-01', 94.00, 'aprobado'),
(6, 3, '2026-03-05', null, 'cursando'),
(7, 2, '2026-02-20', 85.00, 'aprobado'),
(8, 4, '2026-01-20', 92.50, 'aprobado');