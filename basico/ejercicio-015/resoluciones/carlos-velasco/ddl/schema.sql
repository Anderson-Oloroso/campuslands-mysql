-- Campuslands MySQL - Básico Ejercicio 015
-- Tema: Relaciones simples

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS videojuegos;
DROP TABLE IF EXISTS categorias;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE videojuegos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    plataforma VARCHAR(60) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    estado ENUM('Disponible','Prestado') NOT NULL DEFAULT 'Disponible',
    categoria_id INT NOT NULL,

    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
);