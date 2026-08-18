-- Campuslands MySQL - intermedio ejercicio-026
-- Tema: videojuego RPG (CHECK)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS heroes_rpg;
DROP TABLE IF EXISTS clases_personaje_rpg;

CREATE TABLE clases_personaje_rpg (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(50) NOT NULL UNIQUE,
    atributo_principal ENUM('Fuerza','Destreza','Inteligencia','Fe','Vitalidad') NOT NULL,
    rol_combate ENUM('Tanque','DPS Fisico','DPS Magico','Sanador/Support') NOT NULL
);

CREATE TABLE heroes_rpg (
    id_heroe INT AUTO_INCREMENT PRIMARY KEY,
    nombre_heroe VARCHAR(60) NOT NULL UNIQUE,
    id_clase INT NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    puntos_vida INT NOT NULL,
    puntos_mana INT NOT NULL,
    oro_acumulado INT NOT NULL DEFAULT 0,
    gremio VARCHAR(60) NOT NULL DEFAULT 'Sin Gremio',
    FOREIGN KEY (id_clase) REFERENCES clases_personaje_rpg(id_clase) ON DELETE CASCADE
);
