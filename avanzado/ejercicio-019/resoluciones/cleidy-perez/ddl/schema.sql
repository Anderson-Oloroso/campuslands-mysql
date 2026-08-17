-- Campuslands MySQL - avanzado ejercicio 019
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS escuela_paracaidismo;
USE escuela_paracaidismo;

DROP TABLE IF EXISTS saltos;

CREATE TABLE paracaidistas (
    paracaidista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel_experiencia VARCHAR(50) NOT NULL -- 'Principiante', 'Intermedio', 'Avanzado'
);

CREATE TABLE instructores (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    saltos_certificados INT NOT NULL
);