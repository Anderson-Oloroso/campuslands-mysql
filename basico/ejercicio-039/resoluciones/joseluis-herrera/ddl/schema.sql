CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peleadores;

CREATE TABLE peleadores (
    id_peleador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    derrotas INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_peleadores_edad CHECK (edad BETWEEN 16 AND 50),
    CONSTRAINT chk_peleadores_peso CHECK (peso > 0),
    CONSTRAINT chk_peleadores_victorias CHECK (victorias >= 0),
    CONSTRAINT chk_peleadores_derrotas CHECK (derrotas >= 0)
);