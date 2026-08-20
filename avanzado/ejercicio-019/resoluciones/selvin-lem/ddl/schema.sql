-- Campuslands MySQL - avanzado ejercicio 019
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Habilitar la creación de triggers/funciones con binary logging activo
SET GLOBAL log_bin_trust_function_creators = 1;

DROP TABLE IF EXISTS paracaidismo;

CREATE TABLE paracaidismo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_paracaidismo_validar_estado;

DELIMITER //
CREATE TRIGGER trg_paracaidismo_validar_estado
BEFORE INSERT ON paracaidismo
FOR EACH ROW
BEGIN
  IF NEW.puntaje < 40.00 THEN
    SET NEW.estado = 'revision';
  END IF;
END //
DELIMITER ;