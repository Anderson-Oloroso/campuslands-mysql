CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_maxima_kmh INT NOT NULL,
    precio_usd DECIMAL(15, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_autos_potencia
        CHECK (potencia_hp > 0),

    CONSTRAINT chk_autos_velocidad
        CHECK (velocidad_maxima_kmh > 0),

    CONSTRAINT chk_autos_precio
        CHECK (precio_usd > 0),

    CONSTRAINT chk_autos_estado
        CHECK (estado IN ('disponible', 'vendido', 'reservado')),

    CONSTRAINT chk_autos_anio
        CHECK (anio BETWEEN 2000 AND 2030)
);