-- ============================================================
-- Ejercicio 028 - Datos de prueba
-- ============================================================

USE campuslands_mysql;

INSERT INTO estudiantes (
    nombre,
    correo,
    estado,
    datos_academicos
)
VALUES
(
    'Ana Martinez',
    'ana.martinez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'promedio', 4.7,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('MySQL', 'JavaScript', 'Node.js')
    )
),
(
    'Carlos Ramirez',
    'carlos.ramirez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'promedio', 4.2,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('MySQL', 'JavaScript')
    )
),
(
    'Laura Gomez',
    'laura.gomez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'promedio', 4.9,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('Python', 'MySQL', 'Docker')
    )
),
(
    'Miguel Torres',
    'miguel.torres@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'basico',
        'promedio', 3.8,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('HTML', 'CSS', 'JavaScript')
    )
),
(
    'Sofia Herrera',
    'sofia.herrera@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'promedio', 4.5,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('Java', 'MySQL', 'Git')
    )
),
(
    'Diego Castillo',
    'diego.castillo@campuslands.com',
    'inactivo',
    JSON_OBJECT(
        'nivel', 'basico',
        'promedio', 3.4,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('HTML', 'CSS')
    )
),
(
    'Valentina Lopez',
    'valentina.lopez@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'avanzado',
        'promedio', 4.8,
        'modalidad', 'virtual',
        'tecnologias', JSON_ARRAY('Python', 'SQL', 'Docker')
    )
),
(
    'Andres Morales',
    'andres.morales@campuslands.com',
    'activo',
    JSON_OBJECT(
        'nivel', 'intermedio',
        'promedio', 4.0,
        'modalidad', 'presencial',
        'tecnologias', JSON_ARRAY('JavaScript', 'MySQL', 'Git')
    )
);