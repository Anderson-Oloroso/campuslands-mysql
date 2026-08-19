CREATE DATABASE IF NOT EXISTS biblioteca_gamer_db;
USE biblioteca_gamer_db;

CREATE TABLE plataformas_gaming (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL
);

CREATE TABLE videojuegos (
    id_videojuego INT PRIMARY KEY AUTO_INCREMENT,
    codigo_juego VARCHAR(20) NOT NULL UNIQUE,
    titulo_juego VARCHAR(100) NOT NULL,
    id_plataforma INT,
    precio DECIMAL(6,2) NOT NULL,
    horas_jugadas INT NOT NULL DEFAULT 0,
    estado_juego ENUM('completado', 'jugando', 'pendiente', 'abandonado') DEFAULT 'pendiente',
    FOREIGN KEY (id_plataforma) REFERENCES plataformas_gaming(id_plataforma),
    CONSTRAINT chk_precio_juego CHECK (precio >= 0.00),
    CONSTRAINT chk_horas_jugadas CHECK (horas_jugadas >= 0)
);