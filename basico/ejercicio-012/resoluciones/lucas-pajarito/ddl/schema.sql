-- Campuslands MySQL - basico ejercicio 012
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_012;


CREATE TABLE artistas(
  id VARCHAR(80) PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL
);

CREATE TABLE categorias_12(
  id VARCHAR(80) PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL
);

CREATE TABLE basico_ejercicio_012 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  id_categoria VARCHAR(80) NOT NULL,
  tiempo_reproduccion DECIMAL(10,2) NOT NULL,
  id_artista VARCHAR(80) NOT NULL,

  constraint fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias_12(id),
  constraint fk_artista FOREIGN KEY (id_artista) REFERENCES artistas(id), 
  constraint fk_tiempo_reproduccion CHECK (tiempo_reproduccion > 0)
);
