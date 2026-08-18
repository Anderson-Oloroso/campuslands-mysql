-- Campuslands MySQL - basico ejercicio-048
-- Tema: viajes y turismo (PRIMARY KEY)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS paquetes_turisticos;

CREATE TABLE paquetes_turisticos (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paquete VARCHAR(90) NOT NULL,
    id_destino INT NOT NULL,
    duracion_dias INT NOT NULL,
    precio_por_persona DECIMAL(8,2) NOT NULL,
    cupos_maximos INT NOT NULL,
    nivel_dificultad ENUM('Facil','Moderado','Exigente') DEFAULT 'Facil',
    incluye_vuelo ENUM('Si','No') DEFAULT 'Si'
);
