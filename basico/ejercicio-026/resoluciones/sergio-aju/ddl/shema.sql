CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_personaje VARCHAR(100) NOT NULL,
  clase ENUM('Guerrero', 'Mago', 'Arquero', 'Clerigo', 'Asesino') NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  experiencia DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo', 'inactivo', 'baneado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_nivel_positivo CHECK (nivel >= 1),
  CONSTRAINT chk_experiencia_no_negativa CHECK (experiencia >= 0.00)
);