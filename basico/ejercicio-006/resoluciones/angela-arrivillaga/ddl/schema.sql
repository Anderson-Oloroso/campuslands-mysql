CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    velocidad_maxima_kmh INT NOT NULL,
    precio_millones_usd DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'vendido', 'reservado') DEFAULT 'disponible',
    anio_lanzamiento YEAR NOT NULL,
    CONSTRAINT chk_velocidad CHECK (velocidad_maxima_kmh > 300)
);