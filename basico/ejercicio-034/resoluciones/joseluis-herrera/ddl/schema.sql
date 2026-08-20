CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id_moto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_cilindrada
        CHECK (cilindrada > 0),

    CONSTRAINT chk_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('disponible', 'vendida', 'reservada'))
);