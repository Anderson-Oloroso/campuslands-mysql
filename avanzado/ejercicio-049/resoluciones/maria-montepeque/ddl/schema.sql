-- Campuslands MySQL - avanzado ejercicio 049
-- Resolucion: maria-montepeque
-- Tema: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.
--
-- IMPORTANTE: crear triggers requiere que el binlog confie en quien
-- los crea. Con el docker-compose de este repo, el usuario 'campus'
-- no tiene privilegio SUPER y log_bin_trust_function_creators viene
-- en OFF, asi que CREATE TRIGGER falla con ERROR 1419. Ver README.md
-- para el detalle y el fix (ejecutar una vez como root):
--   mysql -u root -proot123 -e "SET GLOBAL log_bin_trust_function_creators = 1;"

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS bitacora_saltos_avanzado;
DROP TABLE IF EXISTS saltos_avanzado;
DROP TABLE IF EXISTS instructores_avanzado;

CREATE TABLE instructores_avanzado (
  id_instructor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  especialidad ENUM('tandem','estabilidad','formacion','free_fly','precision') NOT NULL,
  total_saltos INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE saltos_avanzado (
  id_salto INT AUTO_INCREMENT PRIMARY KEY,
  id_instructor INT NOT NULL,
  paracaidista VARCHAR(80) NOT NULL,
  tipo_salto ENUM('tandem','estabilidad','formacion','free_fly','precision') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  estado ENUM('completado','en_proceso','cancelado') NOT NULL DEFAULT 'en_proceso',
  CONSTRAINT fk_saltos_avanzado_instructor FOREIGN KEY (id_instructor) REFERENCES instructores_avanzado (id_instructor),
  CONSTRAINT chk_saltos_avanzado_costo CHECK (costo > 0)
) ENGINE=InnoDB;

CREATE TABLE bitacora_saltos_avanzado (
  id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
  id_salto INT NOT NULL,
  accion ENUM('insertado','actualizado') NOT NULL,
  detalle VARCHAR(255) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ===================================================================
-- Trigger 1: al registrar un salto, si queda 'completado' suma 1 al
-- contador del instructor y deja rastro en la bitacora.
-- ===================================================================
DROP TRIGGER IF EXISTS trg_saltos_avanzado_after_insert;

DELIMITER $$

CREATE TRIGGER trg_saltos_avanzado_after_insert
AFTER INSERT ON saltos_avanzado
FOR EACH ROW
BEGIN
  IF NEW.estado = 'completado' THEN
    UPDATE instructores_avanzado
    SET total_saltos = total_saltos + 1
    WHERE id_instructor = NEW.id_instructor;
  END IF;

  INSERT INTO bitacora_saltos_avanzado (id_salto, accion, detalle)
  VALUES (NEW.id_salto, 'insertado', CONCAT('Salto registrado con estado ', NEW.estado));
END$$

DELIMITER ;

-- ===================================================================
-- Trigger 2: cuando cambia el estado de un salto, ajusta el contador
-- del instructor y registra el cambio en la bitacora.
-- ===================================================================
DROP TRIGGER IF EXISTS trg_saltos_avanzado_after_update;

DELIMITER $$

CREATE TRIGGER trg_saltos_avanzado_after_update
AFTER UPDATE ON saltos_avanzado
FOR EACH ROW
BEGIN
  IF OLD.estado <> NEW.estado THEN
    IF NEW.estado = 'completado' AND OLD.estado <> 'completado' THEN
      UPDATE instructores_avanzado
      SET total_saltos = total_saltos + 1
      WHERE id_instructor = NEW.id_instructor;
    ELSEIF OLD.estado = 'completado' AND NEW.estado <> 'completado' THEN
      UPDATE instructores_avanzado
      SET total_saltos = total_saltos - 1
      WHERE id_instructor = NEW.id_instructor;
    END IF;

    INSERT INTO bitacora_saltos_avanzado (id_salto, accion, detalle)
    VALUES (NEW.id_salto, 'actualizado', CONCAT('Estado cambio de ', OLD.estado, ' a ', NEW.estado));
  END IF;
END$$

DELIMITER ;
