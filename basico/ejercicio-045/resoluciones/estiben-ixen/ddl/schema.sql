-- Campuslands MySQL - basico ejercicio-045
-- Tema: biblioteca gamer (relaciones simples)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos_catalogo;

CREATE TABLE videojuegos_catalogo (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_estudio INT NOT NULL,
    genero ENUM('RPG','Accion','Aventura','Estrategia','Shooter','Simulacion','Soulslike') NOT NULL,
    metacritic_score INT NOT NULL,
    precio_usd DECIMAL(6,2) NOT NULL DEFAULT 59.99,
    horas_promedio_juego INT NOT NULL,
    lanzamiento_anio INT NOT NULL
);
