CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS futsal_jugadores;

CREATE TABLE futsal_jugadores (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre_jugador VARCHAR(50) NOT NULL,
  equipo VARCHAR(50) NOT NULL,
  goles_temporada SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  tarjetas_amarillas TINYINT UNSIGNED NOT NULL DEFAULT 0,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  estado ENUM('activo','lesionado','suspendido') NOT NULL DEFAULT 'activo'
);