USE campuslands_mysql;

INSERT INTO estudiantes (
    nombre,
    email,
    estado,
    perfil_academico
) VALUES
(
    'Carlos Mendoza',
    'carlos.mendoza@academia.tech',
    'activo',
    '{
        "nivel": "intermedio",
        "edad": 21,
        "ciudad": "Ciudad de Guatemala",
        "habilidades": ["JavaScript", "MySQL", "Git"],
        "promedio": 89.5,
        "curso_actual": "Backend con Node.js"
    }'
),
(
    'Ana Lopez',
    'ana.lopez@academia.tech',
    'activo',
    '{
        "nivel": "avanzado",
        "edad": 24,
        "ciudad": "Quetzaltenango",
        "habilidades": ["Python", "SQL", "Docker"],
        "promedio": 94.2,
        "curso_actual": "Ingenieria de Datos"
    }'
),
(
    'Diego Ramirez',
    'diego.ramirez@academia.tech',
    'activo',
    '{
        "nivel": "basico",
        "edad": 19,
        "ciudad": "Escuintla",
        "habilidades": ["HTML", "CSS", "JavaScript"],
        "promedio": 82.7,
        "curso_actual": "Fundamentos Web"
    }'
),
(
    'Sofia Castillo',
    'sofia.castillo@academia.tech',
    'activo',
    '{
        "nivel": "avanzado",
        "edad": 26,
        "ciudad": "Ciudad de Guatemala",
        "habilidades": ["Java", "MySQL", "Docker"],
        "promedio": 91.8,
        "curso_actual": "Arquitectura de Software"
    }'
),
(
    'Mateo Herrera',
    'mateo.herrera@academia.tech',
    'inactivo',
    '{
        "nivel": "intermedio",
        "edad": 22,
        "ciudad": "Antigua Guatemala",
        "habilidades": ["JavaScript", "Node.js", "MongoDB"],
        "promedio": 86.4,
        "curso_actual": "Backend con Node.js"
    }'
),
(
    'Valeria Torres',
    'valeria.torres@academia.tech',
    'activo',
    '{
        "nivel": "avanzado",
        "edad": 23,
        "ciudad": "Mixco",
        "habilidades": ["Python", "SQL", "Power BI"],
        "promedio": 96.1,
        "curso_actual": "Analisis de Datos"
    }'
),
(
    'Luis Garcia',
    'luis.garcia@academia.tech',
    'activo',
    '{
        "nivel": "intermedio",
        "edad": 25,
        "ciudad": "Villa Nueva",
        "habilidades": ["PHP", "MySQL", "Git"],
        "promedio": 84.9,
        "curso_actual": "Desarrollo Backend"
    }'
),
(
    'Camila Reyes',
    'camila.reyes@academia.tech',
    'activo',
    '{
        "nivel": "avanzado",
        "edad": 22,
        "ciudad": "Ciudad de Guatemala",
        "habilidades": ["TypeScript", "Node.js", "Docker"],
        "promedio": 93.6,
        "curso_actual": "Desarrollo Full Stack"
    }'
);