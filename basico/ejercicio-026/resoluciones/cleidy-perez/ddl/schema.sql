-- Campuslands MySQL - basico ejercicio 026
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE personajes_rpg (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL UNIQUE,
    clase ENUM('Guerrero', 'Mago', 'Arquero', 'Pícaro') NOT NULL,
    nivel INT DEFAULT 1 CHECK (nivel BETWEEN 1 AND 100),
    puntos_vida INT DEFAULT 100 CHECK (puntos_vida >= 0),
    puntos_mana INT DEFAULT 50 CHECK (puntos_mana >= 0),
    oro DECIMAL(10,2) DEFAULT 0.00 CHECK (oro >= 0.00),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);
