-- Campuslands MySQL - intermedio ejercicio 011
-- Tematica: pingpong
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidos_pingpong;

CREATE TABLE partidos_pingpong (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_local VARCHAR(80) NOT NULL,
  jugador_visitante VARCHAR(80) NOT NULL,
  sets_local TINYINT NOT NULL,
  sets_visitante TINYINT NOT NULL,
  sede VARCHAR(80) NOT NULL,
  fecha_partido DATE NOT NULL,
  CONSTRAINT chk_sets_local CHECK (sets_local BETWEEN 0 AND 3),
  CONSTRAINT chk_sets_visitante CHECK (sets_visitante BETWEEN 0 AND 3),
  CONSTRAINT chk_sin_empate CHECK (sets_local <> sets_visitante)
);
