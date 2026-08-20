CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS actualizar_estado_misiones;

DROP TABLE IF EXISTS bitacora_eventos;
DROP TABLE IF EXISTS misiones;

CREATE TABLE misiones (
    id_mision INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    puntaje DECIMAL(5,2) NOT NULL,
    estado ENUM('programada', 'activa', 'finalizada') NOT NULL DEFAULT 'programada',
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    CONSTRAINT chk_misiones_nivel CHECK (nivel BETWEEN 1 AND 10),
    CONSTRAINT chk_misiones_puntaje CHECK (puntaje BETWEEN 0 AND 100),
    CONSTRAINT chk_misiones_fechas CHECK (fecha_fin > fecha_inicio)
);

CREATE TABLE bitacora_eventos (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL,
    fecha_ejecucion DATETIME NOT NULL,
    misiones_actualizadas INT NOT NULL DEFAULT 0
);

SET GLOBAL event_scheduler = ON;

CREATE EVENT actualizar_estado_misiones
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE misiones
    SET estado = CASE
        WHEN NOW() >= fecha_fin THEN 'finalizada'
        WHEN NOW() >= fecha_inicio THEN 'activa'
        ELSE 'programada'
    END
    WHERE estado <> CASE
        WHEN NOW() >= fecha_fin THEN 'finalizada'
        WHEN NOW() >= fecha_inicio THEN 'activa'
        ELSE 'programada'
    END;

    INSERT INTO bitacora_eventos (
        nombre_evento,
        fecha_ejecucion,
        misiones_actualizadas
    )
    VALUES (
        'actualizar_estado_misiones',
        NOW(),
        ROW_COUNT()
    );
END;