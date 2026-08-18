CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS inscripciones;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
    id_estudiante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE cursos (
    id_curso INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    nivel ENUM('basico', 'intermedio', 'avanzado') NOT NULL,
    duracion_horas INT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_curso_duracion
        CHECK (duracion_horas > 0)
);

CREATE TABLE inscripciones (
    id_estudiante INT UNSIGNED NOT NULL,
    id_curso INT UNSIGNED NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    progreso DECIMAL(5, 2) NOT NULL DEFAULT 0.00,
    estado ENUM('en_curso', 'completado', 'cancelado') NOT NULL DEFAULT 'en_curso',

    PRIMARY KEY (id_estudiante, id_curso),

    CONSTRAINT fk_inscripciones_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante),

    CONSTRAINT fk_inscripciones_curso
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso),

    CONSTRAINT chk_inscripciones_progreso
        CHECK (progreso BETWEEN 0 AND 100)
);