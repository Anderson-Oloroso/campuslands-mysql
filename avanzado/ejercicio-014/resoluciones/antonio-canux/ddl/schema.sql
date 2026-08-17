-- Campuslands MySQL - avanzado ejercicio 014
-- Contexto: Modulo de datos para saga de ciencia ficcion (Event Scheduler).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET GLOBAL event_scheduler = 'ON';

DROP EVENT IF EXISTS evt_avanz_014_recarga_escudos;
DROP EVENT IF EXISTS evt_avanz_014_auditoria_flota;
DROP TABLE IF EXISTS avanzado_ejercicio_014_auditoria;
DROP TABLE IF EXISTS avanzado_ejercicio_014_flota;

CREATE TABLE avanzado_ejercicio_014_flota (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nave VARCHAR(100) NOT NULL,
  faccion ENUM('Imperio', 'Rebelion', 'Independiente') NOT NULL,
  estado ENUM('Operativa', 'Critica', 'Destruida') DEFAULT 'Operativa',
  nivel_escudos INT NOT NULL DEFAULT 100,
  CONSTRAINT chk_avanz_014_escudos CHECK (nivel_escudos >= 0 AND nivel_escudos <= 100)
);

CREATE TABLE avanzado_ejercicio_014_auditoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  naves_operativas INT NOT NULL,
  naves_criticas INT NOT NULL,
  fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- EVENTO 1: Tarea recurrente a corto plazo (Cada minuto)
CREATE EVENT evt_avanz_014_recarga_escudos
ON SCHEDULE EVERY 1 MINUTE
DO
  UPDATE avanzado_ejercicio_014_flota
  SET nivel_escudos = LEAST(nivel_escudos + 10, 100)
  WHERE estado = 'Operativa' AND nivel_escudos < 100;

-- EVENTO 2: Tarea programada a largo plazo (Diaria)
CREATE EVENT evt_avanz_014_auditoria_flota
ON SCHEDULE EVERY 1 DAY STARTS (CURRENT_DATE + INTERVAL 1 DAY)
DO
  INSERT INTO avanzado_ejercicio_014_auditoria (naves_operativas, naves_criticas)
  SELECT 
    SUM(CASE WHEN estado = 'Operativa' THEN 1 ELSE 0 END),
    SUM(CASE WHEN estado = 'Critica' THEN 1 ELSE 0 END)
  FROM avanzado_ejercicio_014_flota;