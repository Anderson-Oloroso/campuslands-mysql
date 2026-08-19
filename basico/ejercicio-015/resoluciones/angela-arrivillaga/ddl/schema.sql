CREATE DATABASE IF NOT EXISTS biblioteca_gamer_db;
USE biblioteca_gamer_db;

CREATE TABLE plataformas (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL,
    generacion INT NOT NULL,
    CONSTRAINT chk_generacion CHECK (generacion > 0)
);

CREATE TABLE videojuegos (
    id_juego INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    id_plataforma INT,
    genero VARCHAR(40) NOT NULL,
    precio DECIMAL(6,2) NOT NULL,
    estado_inventario ENUM('disponible', 'prestado', 'mantenimiento', 'agotado') DEFAULT 'disponible',
    FOREIGN KEY (id_plataforma) REFERENCES plataformas(id_plataforma),
    CONSTRAINT chk_precio CHECK (precio >= 0.00)
);