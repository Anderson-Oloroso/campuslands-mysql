-- Campuslands MySQL - avanzado ejercicio-027
-- Tema: videojuego de accion y aventura (window functions)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_accion_aventura;
DROP TABLE IF EXISTS artefactos_magicos;
DROP TABLE IF EXISTS reinos_aventura;

CREATE TABLE reinos_aventura (
    id_reino INT AUTO_INCREMENT PRIMARY KEY,
    nombre_reino VARCHAR(60) NOT NULL UNIQUE,
    clima_dominante ENUM('Bosque Elfico','Tierras Altas Nevadas','Volcanico Arido','Ruinas Sumergidas','Desierto Maldito') NOT NULL,
    nivel_peligro INT NOT NULL DEFAULT 1
);

CREATE TABLE artefactos_magicos (
    id_artefacto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artefacto VARCHAR(70) NOT NULL UNIQUE,
    id_reino INT NOT NULL,
    tipo_artefacto ENUM('Espada Ancestral','Amuleto Mistico','Escudo Divino','Tomo de Poder','Arco Legendario') NOT NULL,
    poder_ataque INT NOT NULL DEFAULT 0,
    poder_defensa INT NOT NULL DEFAULT 0,
    durabilidad INT NOT NULL DEFAULT 100,
    es_legendario ENUM('Si','No') DEFAULT 'Si',
    FOREIGN KEY (id_reino) REFERENCES reinos_aventura(id_reino) ON DELETE CASCADE
);
