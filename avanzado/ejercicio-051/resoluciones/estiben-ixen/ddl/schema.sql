-- Campuslands MySQL - avanzado ejercicio-051
-- Tema: dibujo digital (EXPLAIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_dibujo_digital;
DROP TABLE IF EXISTS obras_digitales;
DROP TABLE IF EXISTS ilustradores_digitales;

CREATE TABLE ilustradores_digitales (
    id_ilustrador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(60) NOT NULL UNIQUE,
    software_preferido ENUM('Photoshop','Procreate','Clip Studio Paint','Krita','Blender Grease Pencil') NOT NULL,
    seguidores INT NOT NULL DEFAULT 0
);

CREATE TABLE obras_digitales (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_ilustrador INT NOT NULL,
    estilo ENUM('Concept Art','Anime/Manga','Splash Art','Pixel Art','Retrato Semirrealista') NOT NULL,
    cantidad_capas INT NOT NULL,
    ancho_px INT NOT NULL,
    alto_px INT NOT NULL,
    precio_comision DECIMAL(7,2) NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_ilustrador) REFERENCES ilustradores_digitales(id_ilustrador) ON DELETE CASCADE
);
