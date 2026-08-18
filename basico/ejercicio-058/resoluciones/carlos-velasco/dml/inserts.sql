USE campuslands_mysql;

INSERT INTO cursos (
    nombre,
    categoria,
    instructor,
    modalidad,
    precio,
    estado,
    fecha_inicio
) VALUES
(
    'Fundamentos de Programacion',
    'Programacion',
    'Laura Martinez',
    'Presencial',
    350.00,
    'activo',
    '2026-09-01'
),
(
    'Desarrollo Web Frontend',
    'Desarrollo Web',
    'Carlos Ramirez',
    'Virtual',
    420.00,
    'activo',
    '2026-09-05'
),
(
    'Bases de Datos MySQL',
    'Bases de Datos',
    'Andres Castillo',
    'Presencial',
    390.00,
    'activo',
    '2026-09-10'
),
(
    'JavaScript Moderno',
    'Programacion',
    'Sofia Herrera',
    'Virtual',
    450.00,
    'pendiente',
    '2026-09-15'
),
(
    'Git y GitHub',
    'Herramientas',
    'Miguel Torres',
    'Virtual',
    280.00,
    'activo',
    '2026-09-20'
),
(
    'Introduccion a Docker',
    'DevOps',
    'Daniel Gomez',
    'Presencial',
    500.00,
    'pendiente',
    '2026-09-25'
),
(
    'Fundamentos de Linux',
    'Sistemas',
    'Ana Lopez',
    'Presencial',
    320.00,
    'inactivo',
    '2026-08-10'
),
(
    'Introduccion a Python',
    'Programacion',
    'Jorge Morales',
    'Virtual',
    380.00,
    'inactivo',
    '2026-08-15'
);