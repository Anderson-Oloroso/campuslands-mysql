-- Campuslands MySQL - avanzado ejercicio 034
-- Resolucion: maria-montepeque
-- Tema: garaje de motos
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

DROP TABLE IF EXISTS bitacora_servicios_avanzado;
DROP TABLE IF EXISTS servicios_avanzado;
DROP TABLE IF EXISTS mecanicos_avanzado;

CREATE TABLE mecanicos_avanzado (
  id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  especialidad ENUM('motor','frenos','electrico','carroceria','general') NOT NULL,
  total_servicios INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE servicios_avanzado (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  id_mecanico INT NOT NULL,
  moto_marca VARCHAR(60) NOT NULL,
  tipo_servicio ENUM('mantenimiento','reparacion','cambio_aceite','revision_general','personalizacion') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_servicio DATE NOT NULL,
  estado ENUM('completado','en_proceso','cancelado') NOT NULL DEFAULT 'en_proceso',
  CONSTRAINT fk_servicios_avanzado_mecanico FOREIGN KEY (id_mecanico) REFERENCES mecanicos_avanzado (id_mecanico),
  CONSTRAINT chk_servicios_avanzado_costo CHECK (costo > 0)
) ENGINE=InnoDB;

CREATE TABLE bitacora_servicios_avanzado (
  id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
  id_servicio INT NOT NULL,
  accion ENUM('insertado','actualizado') NOT NULL,
  detalle VARCHAR(255) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ===================================================================
-- Trigger 1: al registrar un servicio, si queda 'completado' suma 1 al
-- contador del mecanico y deja rastro en la bitacora.
-- ===================================================================
DROP TRIGGER IF EXISTS trg_servicios_avanzado_after_insert;

DELIMITER $$

CREATE TRIGGER trg_servicios_avanzado_after_insert
AFTER INSERT ON servicios_avanzado
FOR EACH ROW
BEGIN
  IF NEW.estado = 'completado' THEN
    UPDATE mecanicos_avanzado
    SET total_servicios = total_servicios + 1
    WHERE id_mecanico = NEW.id_mecanico;
  END IF;

  INSERT INTO bitacora_servicios_avanzado (id_servicio, accion, detalle)
  VALUES (NEW.id_servicio, 'insertado', CONCAT('Servicio registrado con estado ', NEW.estado));
END$$

DELIMITER ;

-- ===================================================================
-- Trigger 2: cuando cambia el estado de un servicio, ajusta el
-- contador del mecanico y registra el cambio en la bitacora.
-- ===================================================================
DROP TRIGGER IF EXISTS trg_servicios_avanzado_after_update;

DELIMITER $$

CREATE TRIGGER trg_servicios_avanzado_after_update
AFTER UPDATE ON servicios_avanzado
FOR EACH ROW
BEGIN
  IF OLD.estado <> NEW.estado THEN
    IF NEW.estado = 'completado' AND OLD.estado <> 'completado' THEN
      UPDATE mecanicos_avanzado
      SET total_servicios = total_servicios + 1
      WHERE id_mecanico = NEW.id_mecanico;
    ELSEIF OLD.estado = 'completado' AND NEW.estado <> 'completado' THEN
      UPDATE mecanicos_avanzado
      SET total_servicios = total_servicios - 1
      WHERE id_mecanico = NEW.id_mecanico;
    END IF;

    INSERT INTO bitacora_servicios_avanzado (id_servicio, accion, detalle)
    VALUES (NEW.id_servicio, 'actualizado', CONCAT('Estado cambio de ', OLD.estado, ' a ', NEW.estado));
  END IF;
END$$

DELIMITER ;
