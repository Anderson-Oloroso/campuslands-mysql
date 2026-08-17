-- Campuslands MySQL - avanzado ejercicio 007
-- Contexto: Modulo de datos para liga de futbol (Vistas Avanzadas).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_resumen_equipos;
DROP VIEW IF EXISTS vw_metricas_jugadores;
DROP TABLE IF EXISTS avanzado_ejercicio_007_estadisticas;
DROP TABLE IF EXISTS avanzado_ejercicio_007_jugadores;
DROP TABLE IF EXISTS avanzado_ejercicio_007_equipos;

CREATE TABLE avanzado_ejercicio_007_equipos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  fundacion INT NOT NULL
);

CREATE TABLE avanzado_ejercicio_007_jugadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  equipo_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  posicion ENUM('Portero', 'Defensa', 'Mediocampista', 'Delantero') NOT NULL,
  FOREIGN KEY (equipo_id) REFERENCES avanzado_ejercicio_007_equipos(id)
);

CREATE TABLE avanzado_ejercicio_007_estadisticas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_id INT NOT NULL UNIQUE,
  partidos_jugados INT NOT NULL DEFAULT 0,
  goles INT NOT NULL DEFAULT 0,
  asistencias INT NOT NULL DEFAULT 0,
  tarjetas_amarillas INT NOT NULL DEFAULT 0,
  FOREIGN KEY (jugador_id) REFERENCES avanzado_ejercicio_007_jugadores(id)
);