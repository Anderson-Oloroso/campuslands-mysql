-- Campuslands MySQL - basico ejercicio-044
-- Tema: saga de ciencia ficcion (fechas basicas)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS naves_espaciales;

CREATE TABLE naves_espaciales (
    id_nave INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nave VARCHAR(70) NOT NULL,
    clase ENUM('Caza Ligero','Corbeta','Fragata','Destructor','Crucero de Batalla','Nave Insignia') NOT NULL,
    id_faccion INT NOT NULL,
    tripulacion_max INT NOT NULL,
    velocidad_curvatura DECIMAL(4,2) NOT NULL,
    nivel_escudos INT NOT NULL DEFAULT 100,
    estado_operativo ENUM('Activo','En Mantenimiento','Destruida') DEFAULT 'Activo'
);
