CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla si ya existe para asegurar una ejecución limpia desde cero
DROP TABLE IF EXISTS ranking_battle_royale;

-- Creación de la tabla principal aplicando tipos de datos estrictos y profesionales
CREATE TABLE ranking_battle_royale (
  id INT AUTO_INCREMENT PRIMARY KEY,
  jugador_nickname VARCHAR(60) NOT NULL UNIQUE,
  plataforma ENUM('PC', 'PlayStation', 'Xbox', 'Mobile') NOT NULL,
  partidas_jugadas INT UNSIGNED NOT NULL DEFAULT 0,
  victorias INT UNSIGNED NOT NULL DEFAULT 0,
  eliminaciones INT UNSIGNED NOT NULL DEFAULT 0,
  precision_tiro DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  puntos_ranking INT NOT NULL DEFAULT 0,
  fecha_ultimo_registro DATE NOT NULL,
  estado_cuenta ENUM('activo', 'suspendido', 'veterano') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_victorias_validas CHECK (victorias <= partidas_jugadas),
  CONSTRAINT chk_precision CHECK (precision_tiro >= 0.00 AND precision_tiro <= 100.00),
  CONSTRAINT chk_puntos CHECK (puntos_ranking >= 0)
);