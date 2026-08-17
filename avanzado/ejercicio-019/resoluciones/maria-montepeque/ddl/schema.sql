-- Campuslands MySQL - avanzado ejercicio 019
-- Resolucion: maria-montepeque
-- Tema: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS bitacora_saltos_avanzado;
DROP TABLE IF EXISTS saltos_avanzado;
DROP TABLE IF EXISTS instructores_avanzado;

CREATE TABLE instructores_avanzado (
  id_instructor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  licencia VARCHAR(20) NOT NULL UNIQUE,
  total_saltos INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE saltos_avanzado (
  id_salto INT AUTO_INCREMENT PRIMARY KEY,
  id_instructor INT NOT NULL,
  alumno VARCHAR(120) NOT NULL,
  tipo_salto ENUM('tandem','solo','formacion','estilo_libre') NOT NULL,
  altura_metros INT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_salto DATE NOT NULL,
  estado ENUM('completado','cancelado','reprogramado') NOT NULL DEFAULT 'reprogramado',
  CONSTRAINT fk_saltos_avanzado_instructor FOREIGN KEY (id_instructor) REFERENCES instructores_avanzado (id_instructor),
  CONSTRAINT chk_saltos_avanzado_altura CHECK (altura_metros > 0),
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
-- del instructor (suma si pasa a completado, resta si deja de estarlo)
-- y registra el cambio en la bitacora.
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
