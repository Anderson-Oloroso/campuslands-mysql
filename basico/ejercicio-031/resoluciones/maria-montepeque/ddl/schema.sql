-- Campuslands MySQL - basico ejercicio 031
-- Resolucion: maria-montepeque
-- Tema: torneo esports MOBA
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_moba_basico;

CREATE TABLE equipos_moba_basico (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(120) NOT NULL UNIQUE,
  region ENUM('LATAM','NA','EU','KR','CN') NOT NULL,
  ranking_actual INT NOT NULL,
  victorias INT NOT NULL DEFAULT 0,
  derrotas INT NOT NULL DEFAULT 0,
  fecha_fundacion DATE NOT NULL,
  CONSTRAINT chk_equipos_moba_basico_ranking CHECK (ranking_actual > 0),
  CONSTRAINT chk_equipos_moba_basico_victorias CHECK (victorias >= 0),
  CONSTRAINT chk_equipos_moba_basico_derrotas CHECK (derrotas >= 0)
);
