-- Campuslands MySQL - intermedio ejercicio-013
-- Tema: catalogo de peliculas de miedo (tablas puente)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_terror;
DROP TABLE IF EXISTS directores_terror;

CREATE TABLE directores_terror (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL UNIQUE,
    nacionalidad VARCHAR(40) NOT NULL,
    premios_obtenidos INT NOT NULL DEFAULT 0
);

CREATE TABLE peliculas_terror (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_director INT NOT NULL,
    subgenero ENUM('Sobrenatural','Slasher','Psicologico','Gore','Monstruos','Cosmico') NOT NULL,
    duracion_min INT NOT NULL,
    presupuesto_millones DECIMAL(6,2) NOT NULL,
    taquilla_millones DECIMAL(6,2) NOT NULL,
    clasificacion_edad ENUM('PG-13','R','NC-17') NOT NULL,
    estreno_anio INT NOT NULL,
    FOREIGN KEY (id_director) REFERENCES directores_terror(id_director) ON DELETE CASCADE
);
