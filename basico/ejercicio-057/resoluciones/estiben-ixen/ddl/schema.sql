-- Campuslands MySQL - basico ejercicio-057
-- Tema: videojuego de accion y aventura (modelado de entidad)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS artefactos_magicos;

CREATE TABLE artefactos_magicos (
    id_artefacto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artefacto VARCHAR(70) NOT NULL UNIQUE,
    id_reino INT NOT NULL,
    tipo_artefacto ENUM('Espada Ancestral','Amuleto Mistico','Escudo Divino','Tomo de Poder','Arco Legendario') NOT NULL,
    poder_ataque INT NOT NULL DEFAULT 0,
    poder_defensa INT NOT NULL DEFAULT 0,
    durabilidad INT NOT NULL DEFAULT 100,
    es_legendario ENUM('Si','No') DEFAULT 'Si'
);
