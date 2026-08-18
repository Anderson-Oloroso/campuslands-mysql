-- Campuslands MySQL - basico ejercicio-052
-- Tema: animacion 3D (ORDER BY)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_3d;

CREATE TABLE personajes_3d (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(70) NOT NULL,
    id_estudio INT NOT NULL,
    software_modelado ENUM('Maya','Blender','ZBrush','Houdini','Cinema 4D') NOT NULL,
    poligonos_count INT NOT NULL,
    tipo_rig ENUM('Bipedo Humanoide','Facial Avanzado','Criatura Cuadrupeda','Mecanico/Robot') NOT NULL,
    texturas_4k ENUM('Si','No') DEFAULT 'Si',
    costo_produccion DECIMAL(8,2) NOT NULL
);
