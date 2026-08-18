CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    motor VARCHAR(80) NOT NULL,
    potencia_cv INT UNSIGNED NOT NULL,
    velocidad_maxima_kmh DECIMAL(6, 2) NOT NULL,
    precio_usd DECIMAL(15, 2) NOT NULL,
    estado ENUM('disponible', 'reservado', 'vendido') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_anio
        CHECK (anio BETWEEN 2000 AND 2100),

    CONSTRAINT chk_potencia
        CHECK (potencia_cv > 0),

    CONSTRAINT chk_velocidad
        CHECK (velocidad_maxima_kmh > 0),

    CONSTRAINT chk_precio
        CHECK (precio_usd > 0)
);

CREATE INDEX idx_autos_marca
    ON autos_hiperdeportivos (marca);

CREATE INDEX idx_autos_estado
    ON autos_hiperdeportivos (estado);

CREATE INDEX idx_autos_precio
    ON autos_hiperdeportivos (precio_usd);

CREATE INDEX idx_autos_potencia
    ON autos_hiperdeportivos (potencia_cv);