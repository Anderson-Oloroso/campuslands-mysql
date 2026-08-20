-- Campuslands MySQL - basico ejercicio-046
-- Tema: restaurante de comida urbana (CREATE TABLE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS platillos_urbanos;

CREATE TABLE platillos_urbanos (
    id_platillo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_platillo VARCHAR(80) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(6,2) NOT NULL,
    tiempo_preparacion_min INT NOT NULL DEFAULT 15,
    calorias INT NOT NULL,
    es_vegetariano ENUM('Si','No') DEFAULT 'No',
    disponible ENUM('Si','No') DEFAULT 'Si'
);
