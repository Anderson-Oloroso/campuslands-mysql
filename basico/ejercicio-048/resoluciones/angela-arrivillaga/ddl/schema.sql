CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    precio DECIMAL(9, 2) NOT NULL,
    duracion_dias INT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('disponible', 'agotado', 'en_oferta') DEFAULT 'disponible',
    CONSTRAINT chk_precio_turismo CHECK (precio > 0),
    CONSTRAINT chk_duracion_turismo CHECK (duracion_dias > 0),
    CONSTRAINT chk_calificacion_turismo CHECK (calificacion BETWEEN 0 AND 10)
);