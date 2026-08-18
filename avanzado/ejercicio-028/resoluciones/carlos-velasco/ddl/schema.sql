-- ============================================================
-- Ejercicio 028 - JSON en MySQL
-- Tematica: Academia Tech
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
    id_estudiante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    datos_academicos JSON NOT NULL,
    
    CONSTRAINT chk_datos_academicos_json
        CHECK (JSON_VALID(datos_academicos))
) ENGINE = InnoDB;