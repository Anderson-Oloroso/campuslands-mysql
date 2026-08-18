CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;

CREATE TABLE videojuegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'prestado', 'mantenimiento') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_videojuego_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_videojuego_puntaje
        CHECK (puntaje >= 0 AND puntaje <= 10)
);