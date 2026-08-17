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

CREATE TABLE saltos (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    instructor_id INT NOT NULL,
    altitud_pies INT NOT NULL,
    tipo_salto VARCHAR(50) NOT NULL, -- 'Tándem', 'Solo AFF', 'Formación'
    precio DECIMAL(10, 2) NOT NULL,
    fecha_salto DATE NOT NULL,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(paracaidista_id),
    FOREIGN KEY (instructor_id) REFERENCES instructores(instructor_id)
);