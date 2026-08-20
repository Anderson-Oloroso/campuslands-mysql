CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE fabricantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fabricante_id INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    velocidad_maxima_kmh INT NOT NULL,
    precio_millones DECIMAL(5, 2) NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    estado ENUM('en_produccion', 'limitado', 'prototipo') DEFAULT 'en_produccion',
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id),
    INDEX idx_velocidad (velocidad_maxima_kmh),
    INDEX idx_estado (estado)
);