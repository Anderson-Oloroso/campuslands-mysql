-- Campuslands MySQL - avanzado ejercicio 011
-- Contexto: Modulo de datos para pingpong (Common Table Expressions - CTE).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_011_partidos;
DROP TABLE IF EXISTS avanzado_ejercicio_011_jugadores;

CREATE TABLE avanzado_ejercicio_011_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  ranking_mundial INT NOT NULL
);

CREATE TABLE avanzado_ejercicio_011_partidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador1_id INT NOT NULL,
  jugador2_id INT NOT NULL,
  sets_jugador1 INT NOT NULL DEFAULT 0,
  sets_jugador2 INT NOT NULL DEFAULT 0,
  fecha_partido DATE NOT NULL,
  FOREIGN KEY (jugador1_id) REFERENCES avanzado_ejercicio_011_jugadores(id) ON DELETE CASCADE,
  FOREIGN KEY (jugador2_id) REFERENCES avanzado_ejercicio_011_jugadores(id) ON DELETE CASCADE,
  CONSTRAINT chk_avanz_011_distintos CHECK (jugador1_id <> jugador2_id)
);