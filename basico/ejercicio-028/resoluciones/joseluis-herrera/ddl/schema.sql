CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    curso VARCHAR(50) NOT NULL,
    nivel VARCHAR(20) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    promedio DECIMAL(5,2) NOT NULL,

    CONSTRAINT chk_promedio
        CHECK (promedio BETWEEN 0 AND 100)
);