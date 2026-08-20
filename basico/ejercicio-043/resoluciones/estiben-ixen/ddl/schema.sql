-- Campuslands MySQL - basico ejercicio-043
-- Tema: catalogo de peliculas de miedo (filtros por estado)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_terror;

CREATE TABLE peliculas_terror (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_director INT NOT NULL,
    subgenero ENUM('Sobrenatural','Slasher','Psicologico','Gore','Monstruos','Cosmico') NOT NULL,
    duracion_min INT NOT NULL,
    presupuesto_millones DECIMAL(6,2) NOT NULL,
    taquilla_millones DECIMAL(6,2) NOT NULL,
    clasificacion_edad ENUM('PG-13','R','NC-17') NOT NULL,
    estreno_anio INT NOT NULL
);
