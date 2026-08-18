-- Campuslands MySQL - basico ejercicio-040
-- Tema: carreras urbanas (COUNT y SUM)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS vehiculos_tuning;

CREATE TABLE vehiculos_tuning (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(60) NOT NULL,
    id_piloto INT NOT NULL,
    traccion ENUM('RWD','AWD','FWD') NOT NULL,
    potencia_hp INT NOT NULL,
    oxido_nitroso ENUM('Si','No') DEFAULT 'Si',
    carreras_ganadas INT NOT NULL DEFAULT 0,
    valor_tuning DECIMAL(8,2) NOT NULL
);
