-- DDL: Estructura relacional 1:N entre Plataformas y Videojuegos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;
DROP TABLE IF EXISTS plataformas;

CREATE TABLE plataformas (
    plataforma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE videojuegos (
    juego_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    plataforma_id INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    precio_usd DECIMAL(6,2) NOT NULL CHECK (precio_usd >= 0.00),
    horas_jugadas INT NOT NULL DEFAULT 0 CHECK (horas_jugadas >= 0),
    FOREIGN KEY (plataforma_id) REFERENCES plataformas(plataforma_id) ON DELETE CASCADE
) ENGINE=InnoDB;
