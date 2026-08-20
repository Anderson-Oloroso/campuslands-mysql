CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;

CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    puntaje DECIMAL(4,2) NOT NULL,
    estado ENUM('disponible', 'prestado') NOT NULL DEFAULT 'disponible',
    fecha_lanzamiento DATE NOT NULL,
    CONSTRAINT chk_videojuegos_precio CHECK (precio >= 0),
    CONSTRAINT chk_videojuegos_puntaje CHECK (puntaje BETWEEN 0 AND 10),
    INDEX idx_videojuegos_estado (estado),
    INDEX idx_videojuegos_genero (genero),
    INDEX idx_videojuegos_puntaje (puntaje),
    INDEX idx_videojuegos_estado_puntaje (estado, puntaje)
);