-- Campuslands MySQL - avanzado ejercicio 018
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS agencia_viajes;
USE agencia_viajes;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS paquetes_turisticos;
DROP TABLE IF EXISTS turistas;

CREATE TABLE turistas (
    turista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);
