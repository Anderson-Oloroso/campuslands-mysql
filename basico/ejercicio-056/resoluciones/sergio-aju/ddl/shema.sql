CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS personajes_rpg;

-- Creación de la tabla con validaciones estrictas de integridad
CREATE TABLE personajes_rpg (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_personaje VARCHAR(15) NOT NULL UNIQUE,
  nombre_personaje VARCHAR(50) NOT NULL,
  clase_personaje ENUM('Guerrero', 'Mago', 'Arquero', 'Clerigo', 'Asesino') NOT NULL,
  nivel_actual INT NOT NULL DEFAULT 1,
  puntos_vida DECIMAL(6,1) NOT NULL,
  fuerza_ataque DECIMAL(5,1) NOT NULL,
  estado_juego ENUM('activo', 'inactivo', 'bloqueado') NOT NULL DEFAULT 'activo',
  
  -- Validaciones de lógica de juego (restricciones CHECK)
  CONSTRAINT chk_nivel_positivo CHECK (nivel_actual > 0 AND nivel_actual <= 100),
  CONSTRAINT chk_vida_positiva CHECK (puntos_vida > 0.0),
  CONSTRAINT chk_fuerza_positiva CHECK (fuerza_ataque >= 0.0)
);