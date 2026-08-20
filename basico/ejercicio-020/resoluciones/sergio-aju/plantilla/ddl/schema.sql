-- Campuslands MySQL - Básico Ejercicio 020
-- Temática: Estudio de Tatuajes (Uso de SELECT)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS disenos_tatuajes;

CREATE TABLE disenos_tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_diseno VARCHAR(120) NOT NULL,
    estilo VARCHAR(80) NOT NULL,
    duracion_estimada_horas DECIMAL(4,1) NOT NULL DEFAULT 1.0,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'reservado', 'inactivo') NOT NULL DEFAULT 'disponible'
);