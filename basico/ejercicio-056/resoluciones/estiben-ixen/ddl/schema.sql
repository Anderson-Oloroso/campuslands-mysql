-- Campuslands MySQL - basico ejercicio-056
-- Tema: videojuego RPG (validaciones simples)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS heroes_rpg;

CREATE TABLE heroes_rpg (
    id_heroe INT AUTO_INCREMENT PRIMARY KEY,
    nombre_heroe VARCHAR(60) NOT NULL UNIQUE,
    id_clase INT NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    puntos_vida INT NOT NULL,
    puntos_mana INT NOT NULL,
    oro_acumulado INT NOT NULL DEFAULT 0,
    gremio VARCHAR(60) NOT NULL DEFAULT 'Sin Gremio'
);
