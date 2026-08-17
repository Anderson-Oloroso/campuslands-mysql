-- Campuslands MySQL - intermedio ejercicio 032
-- Resolucion: maria-montepeque
-- Tema: ranking battle royale
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_br_intermedio;
DROP TABLE IF EXISTS jugadores_intermedio;

CREATE TABLE jugadores_intermedio (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(60) NOT NULL UNIQUE,
  plataforma ENUM('PC','PS5','Xbox','Mobile') NOT NULL
);

CREATE TABLE partidas_br_intermedio (
  id_partida INT AUTO_INCREMENT PRIMARY KEY,
  id_jugador INT NOT NULL,
  posicion_final INT NOT NULL,
  kills INT NOT NULL DEFAULT 0,
  damage_total INT NOT NULL DEFAULT 0,
  fecha DATETIME NOT NULL,
  CONSTRAINT fk_partidas_br_intermedio_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores_intermedio (id_jugador),
  CONSTRAINT chk_partidas_br_intermedio_posicion CHECK (posicion_final > 0),
  CONSTRAINT chk_partidas_br_intermedio_kills CHECK (kills >= 0)
);
