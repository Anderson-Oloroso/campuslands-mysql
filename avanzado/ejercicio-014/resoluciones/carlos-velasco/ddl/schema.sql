CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS ev_actualizar_misiones;

DROP TABLE IF EXISTS bitacora_eventos;
DROP TABLE IF EXISTS misiones;


CREATE TABLE misiones (
    id_mision INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    planeta_origen VARCHAR(100) NOT NULL,
    comandante VARCHAR(100) NOT NULL,
    nivel_riesgo ENUM('bajo', 'medio', 'alto', 'critico') NOT NULL,
    estado ENUM('programada', 'en_curso', 'finalizada', 'cancelada')
        NOT NULL DEFAULT 'programada',
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,

    CONSTRAINT uq_misiones_nombre
        UNIQUE (nombre),

    CONSTRAINT chk_misiones_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 3),

    CONSTRAINT chk_misiones_fechas
        CHECK (fecha_fin >= fecha_inicio)
);


CREATE TABLE bitacora_eventos (
    id_bitacora BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_mision INT UNSIGNED NOT NULL,
    accion VARCHAR(100) NOT NULL,
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_bitacora_mision
        FOREIGN KEY (id_mision)
        REFERENCES misiones(id_mision)
);


-- ============================================================
-- Habilitar Event Scheduler.
-- Requiere privilegios administrativos en MySQL.
-- ============================================================

SET GLOBAL event_scheduler = ON;


-- ============================================================
-- EVENT SCHEDULER
--
-- Cada minuto busca misiones cuya fecha de finalizacion
-- ya paso y que aun no hayan sido finalizadas o canceladas.
-- ============================================================

DELIMITER $$

CREATE EVENT ev_actualizar_misiones
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN

    INSERT INTO bitacora_eventos (
        id_mision,
        accion
    )
    SELECT
        id_mision,
        'Mision finalizada automaticamente'
    FROM misiones
    WHERE fecha_fin <= NOW()
      AND estado IN ('programada', 'en_curso');

    UPDATE misiones
    SET estado = 'finalizada'
    WHERE fecha_fin <= NOW()
      AND estado IN ('programada', 'en_curso');

END$$

DELIMITER ;