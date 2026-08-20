USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS cursos_tech(
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    area VARCHAR(50) NOT NULL,
    duracion_semanas VARCHAR(100) NOT NULL,
    precio_curso DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS estudiantes_tech(
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT NOT NULL,
    nombre_estudiante VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    promedio_nota DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_estudiantes_tech_cursos_tech FOREIGN KEY (curso_id) REFERENCES cursos_tech(curso_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_cursos_tech(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
