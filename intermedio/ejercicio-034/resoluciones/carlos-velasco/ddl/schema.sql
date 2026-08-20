CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id_moto INT UNSIGNED AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT UNSIGNED NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'vendida', 'mantenimiento') NOT NULL DEFAULT 'disponible',

    PRIMARY KEY (id_moto),
    CHECK (cilindrada > 0),
    CHECK (anio BETWEEN 2000 AND 2030),
    CHECK (precio >= 0)
);