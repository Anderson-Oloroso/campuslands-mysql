-- DDL: Estructura relacional e índices para diagnóstico con EXPLAIN en Dibujo Digital
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ilustraciones_digitales;
DROP TABLE IF EXISTS artistas_digitales;

CREATE TABLE artistas_digitales (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_artista VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    software_principal ENUM('Photoshop', 'Procreate', 'Clip Studio Paint', 'Krita', 'Blender') NOT NULL,
    nivel_experiencia ENUM('Junior', 'Mid', 'Senior') NOT NULL DEFAULT 'Junior'
) ENGINE=InnoDB;

CREATE TABLE ilustraciones_digitales (
    ilustracion_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_ilustracion VARCHAR(15) NOT NULL UNIQUE,
    artista_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    estilo ENUM('Concept Art', 'Ilustración Editorial', 'Anime/Manga', 'Pixel Art', 'Realismo') NOT NULL,
    resolucion_px VARCHAR(20) NOT NULL,
    horas_trabajo DECIMAL(5,2) NOT NULL CHECK (horas_trabajo > 0.00),
    precio_usd DECIMAL(8,2) NOT NULL CHECK (precio_usd >= 0.00),
    estado ENUM('en_proceso', 'publicada', 'vendida') NOT NULL DEFAULT 'en_proceso',
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas_digitales(artista_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Índices optimizadores para análisis comparativo con EXPLAIN
CREATE INDEX idx_ilustraciones_estilo ON ilustraciones_digitales(estilo);
CREATE INDEX idx_artista_estado ON ilustraciones_digitales(artista_id, estado);
