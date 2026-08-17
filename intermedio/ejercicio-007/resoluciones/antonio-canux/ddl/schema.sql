-- Campuslands MySQL - intermedio ejercicio 007
-- Contexto: Modulo de datos para liga de futbol (Normalizacion 2FN).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_007_rendimiento;
DROP TABLE IF EXISTS intermedio_ejercicio_007_partidos;
DROP TABLE IF EXISTS intermedio_ejercicio_007_jugadores;

CREATE TABLE intermedio_ejercicio_007_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  posicion VARCHAR(50) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_007_partidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jornada INT NOT NULL,
  rival VARCHAR(100) NOT NULL,
  fecha DATE NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_007_rendimiento (
  jugador_id INT NOT NULL,
  partido_id INT NOT NULL,
  minutos_jugados INT NOT NULL DEFAULT 0,
  goles INT NOT NULL DEFAULT 0,
  PRIMARY KEY (jugador_id, partido_id),
  FOREIGN KEY (jugador_id) REFERENCES intermedio_ejercicio_007_jugadores(id),
  FOREIGN KEY (partido_id) REFERENCES intermedio_ejercicio_007_partidos(id)
);