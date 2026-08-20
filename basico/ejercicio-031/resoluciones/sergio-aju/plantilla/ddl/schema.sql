CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla si ya existe para asegurar una ejecución limpia desde cero
DROP TABLE IF EXISTS equipos_moba;

-- Creación de la tabla principal de equipos participantes en el torneo MOBA
CREATE TABLE equipos_moba (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
  region VARCHAR(60) NOT NULL,
  tag_abreviado VARCHAR(10) NOT NULL UNIQUE,
  partidos_jugados INT NOT NULL DEFAULT 0,
  partidos_ganados INT NOT NULL DEFAULT 0,
  partidos_perdidos INT NOT NULL DEFAULT 0,
  puntos_liga INT NOT NULL DEFAULT 0,
  estado_equipo ENUM('activo', 'eliminado', 'clasificado') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_partidos_jugados CHECK (partidos_jugados >= 0),
  CONSTRAINT chk_partidos_ganados CHECK (partidos_ganados >= 0),
  CONSTRAINT chk_partidos_perdidos CHECK (partidos_perdidos >= 0),
  CONSTRAINT chk_puntos_liga CHECK (puntos_liga >= 0)
);