CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    puntaje DECIMAL(5,2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CHECK (puntaje >= 0 AND puntaje <= 100)
);

CREATE TABLE estudiante_curso (
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,

    PRIMARY KEY (id_estudiante, id_curso),

    CONSTRAINT fk_estudiante_curso_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_estudiante_curso_curso
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);