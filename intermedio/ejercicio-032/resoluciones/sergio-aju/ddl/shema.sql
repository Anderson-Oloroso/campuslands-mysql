CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS jugadores_royale;
DROP TABLE IF EXISTS clanes_royale;

-- 1. Tabla Padre: Clanes del Battle Royale (Incluyendo un clan sin jugadores para probar el LEFT JOIN)
CREATE TABLE clanes_royale (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_clan VARCHAR(80) NOT NULL UNIQUE,
  tag_clan VARCHAR(10) NOT NULL UNIQUE,
  nivel_clan INT UNSIGNED NOT NULL DEFAULT 1,
  fecha_creacion DATE NOT NULL,
  CONSTRAINT chk_nivel_clan CHECK (nivel_clan >= 1)
);

-- 2. Tabla Hija: Jugadores (Relación Uno a Muchos con Clanes, permitiendo nulos para jugadores sin clan)
CREATE TABLE jugadores_royale (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_nickname VARCHAR(60) NOT NULL UNIQUE,
  clan_id INT DEFAULT NULL,
  partidas_jugadas INT UNSIGNED NOT NULL DEFAULT 0,
  victorias INT UNSIGNED NOT NULL DEFAULT 0,
  eliminaciones INT UNSIGNED NOT NULL DEFAULT 0,
  puntos_ranking INT NOT NULL DEFAULT 0,
  estado_cuenta ENUM('activo', 'suspendido', 'veterano') NOT NULL DEFAULT 'activo',
  CONSTRAINT fk_jugador_clan FOREIGN KEY (clan_id) REFERENCES clanes_royale(id) ON DELETE SET NULL,
  CONSTRAINT chk_victorias_royale CHECK (victorias <= partidas_jugadas),
  CONSTRAINT chk_puntos_royale CHECK (puntos_ranking >= 0)
);