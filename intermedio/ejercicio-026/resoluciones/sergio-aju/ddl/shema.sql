CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg_intermedio;

CREATE TABLE personajes_rpg_intermedio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_personaje VARCHAR(100) NOT NULL,
  clase ENUM('Guerrero', 'Mago', 'Arquero', 'Clerigo', 'Asesino') NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  experiencia DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  puntos_vida INT NOT NULL DEFAULT 100,
  estado ENUM('activo', 'inactivo', 'baneado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- Restricciones CHECK avanzadas para garantizar integridad de negocio
  CONSTRAINT chk_nivel_rango CHECK (nivel >= 1 AND nivel <= 100),
  CONSTRAINT chk_experiencia_positiva CHECK (experiencia >= 0.00),
  CONSTRAINT chk_puntos_vida CHECK (puntos_vida > 0 AND puntos_vida <= 1000)
);