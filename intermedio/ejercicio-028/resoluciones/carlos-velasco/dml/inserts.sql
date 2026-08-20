USE campuslands_mysql;

INSERT INTO estudiantes (
    nombre_completo,
    email,
    ciudad,
    estado
) VALUES
    ('Carlos Mendoza', 'carlos.mendoza@campuslands.com', 'Ciudad de Guatemala', 'activo'),
    ('Laura Ramirez', 'laura.ramirez@campuslands.com', 'Quetzaltenango', 'activo'),
    ('Andres Lopez', 'andres.lopez@campuslands.com', 'Escuintla', 'activo'),
    ('Sofia Castillo', 'sofia.castillo@campuslands.com', 'Antigua Guatemala', 'activo'),
    ('Daniel Morales', 'daniel.morales@campuslands.com', 'Mixco', 'activo'),
    ('Valeria Gomez', 'valeria.gomez@campuslands.com', 'Villa Nueva', 'activo'),
    ('Mateo Herrera', 'mateo.herrera@campuslands.com', 'Chimaltenango', 'inactivo'),
    ('Camila Torres', 'camila.torres@campuslands.com', 'Ciudad de Guatemala', 'activo');


INSERT INTO cursos (
    nombre_curso,
    categoria,
    nivel,
    duracion_horas,
    estado
) VALUES
    ('JavaScript desde cero', 'Programacion', 'basico', 40, 'activo'),
    ('Node.js Backend', 'Programacion', 'intermedio', 50, 'activo'),
    ('MySQL y bases de datos', 'Bases de datos', 'intermedio', 45, 'activo'),
    ('Git y GitHub', 'Herramientas', 'basico', 25, 'activo'),
    ('Arquitectura de software', 'Desarrollo', 'avanzado', 60, 'activo'),
    ('Docker para desarrolladores', 'DevOps', 'intermedio', 35, 'activo');


INSERT INTO inscripciones (
    id_estudiante,
    id_curso,
    fecha_inscripcion,
    progreso,
    estado
) VALUES
    (1, 1, '2026-07-01', 85.00, 'en_curso'),
    (1, 2, '2026-07-05', 60.00, 'en_curso'),
    (1, 3, '2026-07-10', 100.00, 'completado'),
    (2, 1, '2026-07-02', 100.00, 'completado'),
    (2, 3, '2026-07-06', 72.00, 'en_curso'),
    (2, 4, '2026-07-08', 90.00, 'en_curso'),
    (3, 2, '2026-07-03', 45.00, 'en_curso'),
    (3, 6, '2026-07-12', 68.00, 'en_curso'),
    (4, 1, '2026-07-04', 95.00, 'en_curso'),
    (4, 5, '2026-07-09', 35.00, 'en_curso'),
    (5, 3, '2026-07-01', 100.00, 'completado'),
    (5, 4, '2026-07-11', 80.00, 'en_curso'),
    (6, 2, '2026-07-05', 88.00, 'en_curso'),
    (6, 5, '2026-07-15', 20.00, 'en_curso'),
    (8, 1, '2026-07-07', 55.00, 'en_curso');