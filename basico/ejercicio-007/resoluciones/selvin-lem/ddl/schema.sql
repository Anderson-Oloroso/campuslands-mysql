CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS liga_futbol_posiciones;

CREATE TABLE liga_futbol_posiciones (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
  partidos_jugados TINYINT UNSIGNED NOT NULL DEFAULT 0,
  puntos SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  goles_favor SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  goles_contra SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  fecha_ultimo_partido DATE NOT NULL,
  estado ENUM('activo','sancionado') NOT NULL DEFAULT 'activo'
);