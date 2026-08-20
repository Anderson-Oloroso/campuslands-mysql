CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS misiones_aventura_avanzado;

CREATE TABLE misiones_aventura_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_mision VARCHAR(120) NOT NULL,
  region VARCHAR(80) NOT NULL,
  dificultad ENUM('Facil', 'Medio', 'Dificil', 'Legendario') NOT NULL,
  recompensa_oro DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  tiempo_estimado_min INT NOT NULL DEFAULT 30,
  estado ENUM('pendiente', 'en_progreso', 'completada', 'bloqueada') NOT NULL DEFAULT 'pendiente',
  fecha_limite DATE DEFAULT NULL,
  CONSTRAINT chk_recompensa_oro_avanzado CHECK (recompensa_oro >= 0.00),
  CONSTRAINT chk_tiempo_estimado_avanzado CHECK (tiempo_estimado_min > 0)
);