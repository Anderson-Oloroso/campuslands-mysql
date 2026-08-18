CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes_academia;

CREATE TABLE estudiantes_academia (
    id_estudiante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    curso VARCHAR(100) NOT NULL,
    nivel VARCHAR(30) NOT NULL,
    progreso DECIMAL(5, 2) NOT NULL,
    estado ENUM('activo', 'inactivo', 'graduado') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_progreso
        CHECK (progreso BETWEEN 0 AND 100)
);