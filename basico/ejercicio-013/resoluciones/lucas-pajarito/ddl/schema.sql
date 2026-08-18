-- Campuslands MySQL - basico ejercicio 013
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS catalogo_peliculas_miedo;

USE catalogo_peliculas_miedo;

CREATE TABLE categoria(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE directores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogo_peliculas(
    id INT AUTO_INCREMENT,
    titulo_pelicula VARCHAR(120) NOT NULL,
    id_categoria INT NOT NULL,
    id_director INT NOT NULL,
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    anio_publicacion DATE NOT NULL,

    PRIMARY KEY (id, anio_publicacion)
)
PARTITION BY RANGE (YEAR(anio_publicacion)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pfuturo VALUES LESS THAN MAXVALUE
);