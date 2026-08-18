CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id_auto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL,
    motor VARCHAR(80) NOT NULL,
    cilindros TINYINT UNSIGNED NOT NULL,
    potencia_hp SMALLINT UNSIGNED NOT NULL,
    velocidad_max_kmh SMALLINT UNSIGNED NOT NULL,
    precio_usd DECIMAL(15,2) NOT NULL,
    transmision VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_anio
        CHECK (anio BETWEEN 2000 AND 2030),

    CONSTRAINT chk_cilindros
        CHECK (cilindros > 0),

    CONSTRAINT chk_potencia
        CHECK (potencia_hp > 0),

    CONSTRAINT chk_velocidad
        CHECK (velocidad_max_kmh > 0),

    CONSTRAINT chk_precio
        CHECK (precio_usd > 0),

    CONSTRAINT chk_transmision
        CHECK (transmision IN ('automatica', 'manual')),

    CONSTRAINT chk_estado
        CHECK (estado IN ('disponible', 'vendido', 'reservado'))
);