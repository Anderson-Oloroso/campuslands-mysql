CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS platos;


CREATE TABLE platos (
    id_plato INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_platos_nombre
        UNIQUE (nombre),

    CONSTRAINT chk_platos_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 3),

    CONSTRAINT chk_platos_precio
        CHECK (precio > 0)
);