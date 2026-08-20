CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    anio YEAR NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_motos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_motos_estado
        CHECK (estado IN ('disponible', 'vendida', 'mantenimiento')),

    CONSTRAINT chk_motos_anio
        CHECK (anio BETWEEN 2000 AND 2030)
);