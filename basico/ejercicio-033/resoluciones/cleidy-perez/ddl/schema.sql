-- Campuslands MySQL - basico ejercicio 033
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS skins_shooter;

CREATE TABLE skins_shooter (
  id_skin INT AUTO_INCREMENT PRIMARY KEY,
  nombre_skin VARCHAR(120) NOT NULL,
  arma VARCHAR(80) NOT NULL,
  precio_puntos DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  fecha_lanzamiento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);