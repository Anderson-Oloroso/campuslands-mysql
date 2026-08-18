CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    perfil_academico JSON NOT NULL,

    CONSTRAINT chk_perfil_json
        CHECK (JSON_VALID(perfil_academico))
);