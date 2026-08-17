DROP DATABASE IF EXISTS academia_puente_db;
CREATE DATABASE academia_puente_db;
USE academia_puente_db;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(60) NOT NULL,
    correo VARCHAR(60) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_estado_estudiante CHECK (estado IN ('Activo', 'Inactivo'))
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_costo_curso CHECK (costo >= 0.00)
);

CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado_inscripcion VARCHAR(20) NOT NULL,
    CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_inscripcion_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    CONSTRAINT chk_estado_inscripcion CHECK (estado_inscripcion IN ('Cursando', 'Completado', 'Retirado'))
);
