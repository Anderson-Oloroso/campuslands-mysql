CREATE DATABASE IF NOT EXISTS db_biblioteca_gamer;
USE db_biblioteca_gamer;

DROP TABLE IF EXISTS juegos;
DROP TABLE IF EXISTS plataformas;

CREATE TABLE plataformas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL,
    anio_lanzamiento INT NOT NULL
);

CREATE TABLE juegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    plataforma_id INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    precio DECIMAL(6,2) NOT NULL CHECK (precio >= 0),
    estado ENUM('Completado', 'Pendiente', 'Jugando') DEFAULT 'Pendiente',
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(id) ON DELETE CASCADE
);