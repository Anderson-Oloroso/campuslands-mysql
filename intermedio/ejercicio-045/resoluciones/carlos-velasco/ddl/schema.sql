CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;

CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'prestado', 'mantenimiento') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_puntuacion
        CHECK (puntuacion BETWEEN 0.0 AND 10.0)
);