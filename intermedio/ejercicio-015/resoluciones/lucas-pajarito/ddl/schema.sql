-- Campuslands MySQL - intermedio ejercicio 015
-- Ejecuta este archivo antes de inserts.sql.

-- Creación y selección de la Base de Datos
CREATE DATABASE IF NOT EXISTS basico_biblioteca_gamer;
USE basico_biblioteca_gamer;

-- Limpieza previa de tablas en orden inverso a sus dependencias
DROP TABLE IF EXISTS libreria_juegos_015;
DROP TABLE IF EXISTS juegos_015;
DROP TABLE IF EXISTS creadores_015;
DROP TABLE IF EXISTS categoria_juegos_015;

-- Creación de tablas principales
CREATE TABLE categoria_juegos_015 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE juegos_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    categoria_juego_015 INT NOT NULL,
    FOREIGN KEY (categoria_juego_015) REFERENCES categoria_juegos_015(id)
);

CREATE TABLE creadores_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE libreria_juegos_015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_juego INT NOT NULL,
    id_creador INT NOT NULL,
    cantidad_descargas INT NOT NULL CHECK(cantidad_descargas >= 0),
    FOREIGN KEY (id_juego) REFERENCES juegos_015(id),
    FOREIGN KEY (id_creador) REFERENCES creadores_015(id)
);