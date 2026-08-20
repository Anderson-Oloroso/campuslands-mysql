-- Campuslands MySQL - avanzado ejercicio-040
-- Tema: carreras urbanas (backup logico)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_carreras_urbanas;
DROP TABLE IF EXISTS vehiculos_tuning;
DROP TABLE IF EXISTS pilotos_urbanos;

CREATE TABLE pilotos_urbanos (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    apodo VARCHAR(40) NOT NULL UNIQUE,
    nombre_real VARCHAR(70) NOT NULL,
    reputacion INT NOT NULL DEFAULT 100,
    estado ENUM('Activo','Buscado','Retirado') DEFAULT 'Activo'
);

CREATE TABLE vehiculos_tuning (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(60) NOT NULL,
    id_piloto INT NOT NULL,
    traccion ENUM('RWD','AWD','FWD') NOT NULL,
    potencia_hp INT NOT NULL,
    oxido_nitroso ENUM('Si','No') DEFAULT 'Si',
    carreras_ganadas INT NOT NULL DEFAULT 0,
    valor_tuning DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_piloto) REFERENCES pilotos_urbanos(id_piloto) ON DELETE CASCADE
);
