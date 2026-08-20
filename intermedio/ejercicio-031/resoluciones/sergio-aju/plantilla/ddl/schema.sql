CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS jugadores_moba;
DROP TABLE IF EXISTS equipos_moba;

-- 1. Tabla Padre: Equipos del Torneo MOBA
CREATE TABLE equipos_moba (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
  region VARCHAR(60) NOT NULL,
  tag_abreviado VARCHAR(10) NOT NULL UNIQUE,
  puntos_liga INT NOT NULL DEFAULT 0,
  estado_equipo ENUM('activo', 'eliminado', 'clasificado') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_puntos_liga_moba CHECK (puntos_liga >= 0)
);

-- 2. Tabla Hija: Jugadores (Relación Uno a Muchos con Equipos)
CREATE TABLE jugadores_moba (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(80) NOT NULL UNIQUE,
  nombre_real VARCHAR(100) NOT NULL,
  rol ENUM('Top Laner', 'Jungler', 'Mid Laner', 'ADC', 'Support') NOT NULL,
  equipo_id INT NOT NULL,
  asesinatos_totales INT NOT NULL DEFAULT 0,
  muertes_totales INT NOT NULL DEFAULT 0,
  asistencias_totales INT NOT NULL DEFAULT 0,
  CONSTRAINT fk_jugador_equipo FOREIGN KEY (equipo_id) REFERENCES equipos_moba(id) ON DELETE RESTRICT,
  CONSTRAINT chk_asesinatos CHECK (asesinatos_totales >= 0),
  CONSTRAINT chk_muertes CHECK (muertes_totales >= 0),
  CONSTRAINT chk_asistencias CHECK (asistencias_totales >= 0)
);