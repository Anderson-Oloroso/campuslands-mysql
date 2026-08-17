DROP DATABASE IF EXISTS db_hiperdeportivos;
CREATE DATABASE db_hiperdeportivos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_hiperdeportivos;

CREATE TABLE hiperdeportivos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    velocidad_maxima_kmh INT UNSIGNED NOT NULL,
    precio_millones_usd DECIMAL(5,2) NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible',
    CONSTRAINT chk_estado CHECK (estado IN ('Disponible', 'Agotado', 'Prototipo')),
    CONSTRAINT chk_velocidad CHECK (velocidad_maxima_kmh > 300)
) ENGINE=InnoDB;