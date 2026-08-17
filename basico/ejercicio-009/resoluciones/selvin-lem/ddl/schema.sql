CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS kickboxing_peleadores;

CREATE TABLE kickboxing_peleadores (
  id_peleador INT AUTO_INCREMENT PRIMARY KEY,
  nombre_peleador VARCHAR(50) NOT NULL,
  categoria_peso VARCHAR(30) NOT NULL,
  victorias TINYINT UNSIGNED NOT NULL DEFAULT 0,
  derrotas TINYINT UNSIGNED NOT NULL DEFAULT 0,
  fecha_registro DATE NOT NULL,
  estado ENUM('activo','retirado','descalificado') NOT NULL DEFAULT 'activo'
);