-- Campuslands MySQL - basico ejercicio 032
-- Resolucion: maria-montepeque
-- Tema: ranking battle royale
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_br_basico;

-- Tipos de datos usados a proposito: ENUM, INT, SMALLINT UNSIGNED,
-- BOOLEAN, DATE, DATETIME y TEXT, cada uno elegido por lo que
-- realmente representa el dato.
CREATE TABLE jugadores_br_basico (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(60) NOT NULL UNIQUE,
  plataforma ENUM('PC','PS5','Xbox','Mobile') NOT NULL,
  kills_totales INT NOT NULL DEFAULT 0,
  partidas_jugadas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  tiene_pase_battle BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_registro DATE NOT NULL,
  ultima_conexion DATETIME NOT NULL,
  bio TEXT NULL,
  CONSTRAINT chk_jugadores_br_basico_kills CHECK (kills_totales >= 0)
);
