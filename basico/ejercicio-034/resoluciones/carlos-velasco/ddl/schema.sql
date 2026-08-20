CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id_moto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    cilindrada_cc INT UNSIGNED NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'reservada', 'vendida', 'mantenimiento')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_motos_cilindrada
        CHECK (cilindrada_cc > 0),

    CONSTRAINT chk_motos_anio
        CHECK (anio BETWEEN 2000 AND 2026),

    CONSTRAINT chk_motos_precio
        CHECK (precio >= 0),

    CONSTRAINT uq_moto
        UNIQUE (marca, modelo, anio)
);