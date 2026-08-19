USE campuslands_mysql;

INSERT INTO cursos_academia
(nombre, categoria, nivel, precio, estado, informacion)
VALUES
(
    'Fundamentos de Programacion',
    'Programacion',
    'basico',
    450.00,
    'activo',
    '{
        "instructor": "Laura Gomez",
        "duracion_horas": 40,
        "modalidad": "presencial",
        "tecnologias": ["Python", "Pseudocodigo"],
        "requisitos": ["Logica basica"],
        "cupo": 30
    }'
),
(
    'HTML y CSS',
    'Desarrollo Web',
    'basico',
    380.00,
    'activo',
    '{
        "instructor": "Carlos Mendez",
        "duracion_horas": 35,
        "modalidad": "virtual",
        "tecnologias": ["HTML", "CSS"],
        "requisitos": [],
        "cupo": 35
    }'
),
(
    'JavaScript Inicial',
    'Desarrollo Web',
    'basico',
    520.00,
    'activo',
    '{
        "instructor": "Sofia Torres",
        "duracion_horas": 45,
        "modalidad": "virtual",
        "tecnologias": ["JavaScript", "DOM"],
        "requisitos": ["HTML", "CSS"],
        "cupo": 30
    }'
),
(
    'Bases de Datos MySQL',
    'Bases de Datos',
    'intermedio',
    650.00,
    'activo',
    '{
        "instructor": "Jose Ramirez",
        "duracion_horas": 50,
        "modalidad": "presencial",
        "tecnologias": ["MySQL", "SQL"],
        "requisitos": ["Logica basica"],
        "cupo": 25
    }'
),
(
    'Python para Backend',
    'Programacion',
    'intermedio',
    720.00,
    'activo',
    '{
        "instructor": "Andres Herrera",
        "duracion_horas": 55,
        "modalidad": "virtual",
        "tecnologias": ["Python", "FastAPI", "SQL"],
        "requisitos": ["Python basico", "SQL basico"],
        "cupo": 25
    }'
),
(
    'Git y GitHub',
    'Herramientas',
    'basico',
    300.00,
    'inactivo',
    '{
        "instructor": "Diego Castillo",
        "duracion_horas": 25,
        "modalidad": "virtual",
        "tecnologias": ["Git", "GitHub"],
        "requisitos": [],
        "cupo": 40
    }'
),
(
    'React JS',
    'Desarrollo Web',
    'intermedio',
    850.00,
    'activo',
    '{
        "instructor": "Valentina Ruiz",
        "duracion_horas": 60,
        "modalidad": "presencial",
        "tecnologias": ["React", "JavaScript", "HTML", "CSS"],
        "requisitos": ["JavaScript", "HTML", "CSS"],
        "cupo": 25
    }'
),
(
    'Node.js',
    'Backend',
    'intermedio',
    780.00,
    'activo',
    '{
        "instructor": "Camila Vargas",
        "duracion_horas": 55,
        "modalidad": "virtual",
        "tecnologias": ["Node.js", "JavaScript", "Express"],
        "requisitos": ["JavaScript"],
        "cupo": 25
    }'
),
(
    'Arquitectura de Software',
    'Ingenieria',
    'avanzado',
    950.00,
    'inactivo',
    '{
        "instructor": "Miguel Santos",
        "duracion_horas": 48,
        "modalidad": "presencial",
        "tecnologias": ["UML", "Docker", "Microservicios"],
        "requisitos": ["Programacion", "Bases de Datos"],
        "cupo": 20
    }'
),
(
    'TypeScript Avanzado',
    'Desarrollo Web',
    'avanzado',
    900.00,
    'activo',
    '{
        "instructor": "Daniela Perez",
        "duracion_horas": 50,
        "modalidad": "virtual",
        "tecnologias": ["TypeScript", "JavaScript", "Node.js"],
        "requisitos": ["JavaScript"],
        "cupo": 20
    }'
);