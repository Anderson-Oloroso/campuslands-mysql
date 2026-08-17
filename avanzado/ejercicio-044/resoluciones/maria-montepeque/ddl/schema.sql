-- Campuslands MySQL - avanzado ejercicio 044
-- Resolucion: maria-montepeque
-- Tema: saga de ciencia ficcion
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP EVENT IF EXISTS ev_finalizar_transmisiones_avanzado;
DROP TABLE IF EXISTS auditoria_transmisiones_avanzado;
DROP TABLE IF EXISTS transmisiones_avanzado;

CREATE TABLE transmisiones_avanzado (
  id_transmision INT AUTO_INCREMENT PRIMARY KEY,
  episodio VARCHAR(150) NOT NULL,
  temporada INT NOT NULL,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  estado ENUM('programada','en_vivo','finalizada') NOT NULL DEFAULT 'programada',
  CONSTRAINT chk_transmisiones_avanzado_temporada CHECK (temporada > 0),
  CONSTRAINT chk_transmisiones_avanzado_fechas CHECK (fecha_fin > fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE auditoria_transmisiones_avanzado (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  id_transmision INT NOT NULL,
  accion VARCHAR(80) NOT NULL,
  ejecutado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ===================================================================
-- Event Scheduler: revisa cada hora si alguna transmision ya termino
-- (fecha_fin < NOW()) y la marca como 'finalizada', dejando rastro en
-- la auditoria. Nadie tiene que acordarse de correr esto a mano.
--
-- El INSERT en la auditoria va ANTES del UPDATE, y usando el estado
-- viejo ('programada'/'en_vivo') como condicion: asi cada transmision
-- se registra en la auditoria una sola vez, la primera vez que el
-- evento la encuentra vencida. En las siguientes ejecuciones ya no
-- calificara para el INSERT porque su estado ya sera 'finalizada'.
-- ===================================================================
DELIMITER $$

CREATE EVENT ev_finalizar_transmisiones_avanzado
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
  INSERT INTO auditoria_transmisiones_avanzado (id_transmision, accion)
  SELECT id_transmision, 'finalizada automaticamente por el event scheduler'
  FROM transmisiones_avanzado
  WHERE estado IN ('programada', 'en_vivo') AND fecha_fin < NOW();

  UPDATE transmisiones_avanzado
  SET estado = 'finalizada'
  WHERE estado IN ('programada', 'en_vivo') AND fecha_fin < NOW();
END$$

DELIMITER ;
