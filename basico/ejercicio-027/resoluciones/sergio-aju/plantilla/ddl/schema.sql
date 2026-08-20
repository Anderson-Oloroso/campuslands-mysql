CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS misiones_aventura;

CREATE TABLE misiones_aventura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_mision VARCHAR(120) NOT NULL,
  region VARCHAR(80) NOT NULL,
  dificultad ENUM('Facil', 'Medio', 'Dificil', 'Legendario') NOT NULL,
  recompensa_oro DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('pendiente', 'en_progreso', 'completada', 'bloqueada') NOT NULL DEFAULT 'pendiente',
  fecha_limite DATE DEFAULT NULL,
  CONSTRAINT chk_recompensa_positiva CHECK (recompensa_oro >= 0.00)
);