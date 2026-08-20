USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS cursos_tech(
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    area VARCHAR(50) NOT NULL,
    duracion_semanas VARCHAR(100) NOT NULL,
    precio_curso DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
