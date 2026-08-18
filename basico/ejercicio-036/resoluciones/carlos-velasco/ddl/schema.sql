CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    potencia_hp INT UNSIGNED NOT NULL,
    velocidad_max_kmh INT UNSIGNED NOT NULL,
    precio_millones DECIMAL(10, 2) NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    estado ENUM('disponible', 'vendido', 'reservado')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_auto_potencia
        CHECK (potencia_hp > 0),

    CONSTRAINT chk_auto_velocidad
        CHECK (velocidad_max_kmh > 0),

    CONSTRAINT chk_auto_precio
        CHECK (precio_millones > 0),

    CONSTRAINT chk_auto_anio
        CHECK (anio BETWEEN 2000 AND 2026),

    CONSTRAINT uq_auto
        UNIQUE (marca, modelo, anio)
);