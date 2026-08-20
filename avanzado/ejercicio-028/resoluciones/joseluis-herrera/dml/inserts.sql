USE campuslands_mysql;

INSERT INTO estudiantes (
    nombre,
    email,
    estado,
    perfil_json
) VALUES
(
    'Ana Martinez',
    'ana.martinez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'edad', 22,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('SQL', 'Python', 'Git'),
        'horas_estudio', 18,
        'certificaciones', JSON_ARRAY('SQL Fundamentals')
    )
),
(
    'Carlos Ramirez',
    'carlos.ramirez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'edad', 25,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('JavaScript', 'Node.js', 'MySQL'),
        'horas_estudio', 25,
        'certificaciones', JSON_ARRAY('Backend Development', 'MySQL Advanced')
    )
),
(
    'Laura Gomez',
    'laura.gomez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'edad', 21,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('HTML', 'CSS', 'JavaScript'),
        'horas_estudio', 15,
        'certificaciones', JSON_ARRAY('Web Development')
    )
),
(
    'Miguel Torres',
    'miguel.torres@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'edad', 27,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('Python', 'Django', 'PostgreSQL'),
        'horas_estudio', 30,
        'certificaciones', JSON_ARRAY('Python Backend')
    )
),
(
    'Sofia Herrera',
    'sofia.herrera@campuslands.com',
    'inactivo',
    JSON_OBJECT(
        'nivel', 'basico',
        'edad', 20,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('HTML', 'CSS'),
        'horas_estudio', 8,
        'certificaciones', JSON_ARRAY()
    )
),
(
    'Daniel Lopez',
    'daniel.lopez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'edad', 23,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('SQL', 'MySQL', 'Git'),
        'horas_estudio', 20,
        'certificaciones', JSON_ARRAY('Database Fundamentals')
    )
),
(
    'Valentina Castro',
    'valentina.castro@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'edad', 26,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('React', 'JavaScript', 'Node.js'),
        'horas_estudio', 28,
        'certificaciones', JSON_ARRAY('Frontend Development', 'React Advanced')
    )
),
(
    'Andres Morales',
    'andres.morales@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'basico',
        'edad', 19,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('HTML', 'CSS', 'Git'),
        'horas_estudio', 10,
        'certificaciones', JSON_ARRAY('Web Fundamentals')
    )
);