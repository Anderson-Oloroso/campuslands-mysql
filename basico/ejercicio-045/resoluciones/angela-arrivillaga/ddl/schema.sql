CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE plataformas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    empresa VARCHAR(50) NOT NULL
);

CREATE TABLE videojuegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma_id INT NOT NULL,
    precio DECIMAL(6, 2) NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('disponible', 'agotado', 'preventa') DEFAULT 'disponible',
    CONSTRAINT fk_videojuego_plataforma FOREIGN KEY (plataforma_id) REFERENCES plataformas(id),
    CONSTRAINT chk_precio CHECK (precio >= 0),
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 10)
);