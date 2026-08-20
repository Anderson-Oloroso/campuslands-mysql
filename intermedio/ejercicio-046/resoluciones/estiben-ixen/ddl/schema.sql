-- Campuslands MySQL - intermedio ejercicio-046
-- Tema: restaurante de comida urbana (INNER JOIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS platillos_urbanos;
DROP TABLE IF EXISTS categorias_menu;

CREATE TABLE categorias_menu (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE platillos_urbanos (
    id_platillo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_platillo VARCHAR(80) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(6,2) NOT NULL,
    tiempo_preparacion_min INT NOT NULL DEFAULT 15,
    calorias INT NOT NULL,
    es_vegetariano ENUM('Si','No') DEFAULT 'No',
    disponible ENUM('Si','No') DEFAULT 'Si',
    FOREIGN KEY (id_categoria) REFERENCES categorias_menu(id_categoria) ON DELETE CASCADE
);
