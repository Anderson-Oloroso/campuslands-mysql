CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS destinos;

CREATE TABLE destinos (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    duracion_dias INT NOT NULL,
    estado ENUM('disponible','completo') NOT NULL DEFAULT 'disponible',
    CONSTRAINT chk_precio CHECK (precio >= 0),
    CONSTRAINT chk_duracion CHECK (duracion_dias > 0)
);