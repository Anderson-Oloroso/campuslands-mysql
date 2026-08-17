-- DDL: Tabla para practicar la cláusula WHERE en Dibujo Digital
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_dibujo;

CREATE TABLE proyectos_dibujo (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_proyecto VARCHAR(15) NOT NULL UNIQUE,
    artista_nombre VARCHAR(100) NOT NULL,
    software ENUM('Photoshop', 'Procreate', 'Clip Studio Paint', 'Krita', 'Blender') NOT NULL,
    estilo ENUM('Concept Art', 'Ilustración Editorial', 'Anime/Manga', 'Pixel Art', 'Realismo') NOT NULL,
    tiempo_horas DECIMAL(5,2) NOT NULL CHECK (tiempo_horas > 0.00),
    costo_licencia_usd DECIMAL(8,2) NOT NULL CHECK (costo_licencia_usd >= 0.00),
    estado ENUM('en_proceso', 'completado', 'pausado') NOT NULL DEFAULT 'en_proceso',
    fecha_inicio DATE NOT NULL
) ENGINE=InnoDB;
