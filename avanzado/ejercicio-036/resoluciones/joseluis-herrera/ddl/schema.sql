CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_maxima_kmh INT NOT NULL,
    precio_usd DECIMAL(15, 2) NOT NULL,
    color VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_autos_anio
        CHECK (anio BETWEEN 2000 AND 2030),

    CONSTRAINT chk_autos_potencia
        CHECK (potencia_hp > 0),

    CONSTRAINT chk_autos_velocidad
        CHECK (velocidad_maxima_kmh > 0),

    CONSTRAINT chk_autos_precio
        CHECK (precio_usd > 0),

    CONSTRAINT chk_autos_estado
        CHECK (estado IN ('disponible', 'vendido', 'reservado'))
);

-- Indices relacionados con las consultas que se analizaran
-- mediante EXPLAIN.
CREATE INDEX idx_autos_estado
    ON autos_hiperdeportivos (estado);

CREATE INDEX idx_autos_marca
    ON autos_hiperdeportivos (marca);

CREATE INDEX idx_autos_potencia
    ON autos_hiperdeportivos (potencia_hp);

CREATE INDEX idx_autos_velocidad
    ON autos_hiperdeportivos (velocidad_maxima_kmh);

CREATE INDEX idx_autos_precio
    ON autos_hiperdeportivos (precio_usd);