-- Campuslands MySQL - basico ejercicio 021
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE ilustraciones_digitales (
    id_ilustracion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    software ENUM('Procreate', 'Photoshop', 'Clip Studio Paint', 'Krita') NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    horas_trabajo DECIMAL(5,1) NOT NULL CHECK (horas_trabajo > 0),
    es_encargo BOOLEAN DEFAULT FALSE,
    precio DECIMAL(8,2) DEFAULT 0.00,
    fecha_creacion DATE NOT NULL
);
