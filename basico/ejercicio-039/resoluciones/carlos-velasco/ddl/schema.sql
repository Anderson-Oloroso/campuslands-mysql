CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE peleadores (
    id_peleador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_edad
        CHECK (edad BETWEEN 18 AND 45),

    CONSTRAINT chk_victorias
        CHECK (victorias >= 0),

    CONSTRAINT chk_derrotas
        CHECK (derrotas >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activo', 'inactivo', 'retirado'))
);