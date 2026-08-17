-- Campuslands MySQL - basico ejercicio 041
-- Resolucion: maria-montepeque
-- Tema: pingpong
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong_basico;

CREATE TABLE jugadores_pingpong_basico (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  categoria ENUM('principiante','intermedio','avanzado','profesional') NOT NULL,
  ranking_puntos INT NOT NULL DEFAULT 1000,
  partidos_ganados INT NOT NULL DEFAULT 0,
  mano_dominante ENUM('derecha','izquierda') NOT NULL,
  estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_jugadores_pingpong_basico_ranking CHECK (ranking_puntos BETWEEN 0 AND 3000),
  CONSTRAINT chk_jugadores_pingpong_basico_partidos CHECK (partidos_ganados >= 0)
);
