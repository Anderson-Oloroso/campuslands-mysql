CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS cursos;

CREATE TABLE cursos (
    id_curso INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    modalidad VARCHAR(20) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('activo', 'inactivo', 'pendiente') NOT NULL DEFAULT 'activo',
    fecha_inicio DATE NOT NULL,

    CONSTRAINT chk_curso_precio
        CHECK (precio >= 0)
);