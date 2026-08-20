-- Campuslands MySQL - avanzado ejercicio 049
-- Triggers para Centro de Paracaidismo / Skydive Center

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS auditoria_equipos;
DROP TABLE IF EXISTS saltos;
DROP TABLE IF EXISTS equipos;
DROP TABLE IF EXISTS paracaidistas;

-- Tabla de Paracaidistas
CREATE TABLE paracaidistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    licencia ENUM('A', 'B', 'C', 'D') NOT NULL DEFAULT 'A', -- A: Principiante, D: Master/Instrucción
    total_saltos INT NOT NULL DEFAULT 0,
    minutos_caida_libre INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'suspendido', 'retirado') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_saltos_positivos CHECK (total_saltos >= 0)
) ENGINE=InnoDB;

-- Tabla de Equipos / Paracaídas (Rig)
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_modelo VARCHAR(50) NOT NULL UNIQUE,
    tamano_principal_sqft INT NOT NULL,
    estado ENUM('operativo', 'mantenimiento', 'retirado') NOT NULL DEFAULT 'operativo',
    fecha_ultima_inspeccion DATE NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla de Registro de Saltos (Jumps Log)
CREATE TABLE saltos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    equipo_id INT NOT NULL,
    altitud_pies INT NOT NULL, -- Ej. 10000, 14000, 18000
    segundos_caida_libre INT NOT NULL,
    tipo_salto ENUM('Tándem', 'Solo', 'Formación', 'AFF') NOT NULL,
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_altitud_minima CHECK (altitud_pies >= 3000)
) ENGINE=InnoDB;

-- Tabla de Auditoría de Mantenimiento de Equipos
CREATE TABLE auditoria_equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    estado_anterior VARCHAR(30) NOT NULL,
    estado_nuevo VARCHAR(30) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================================================================
-- TRIGGERS / DISPARADORES
-- ============================================================================

DELIMITER //

-- Trigger 1: Validar requerimiento de altitud por licencia antes de registrar salto (BEFORE INSERT)
CREATE TRIGGER trg_validar_altitud_licencia
BEFORE INSERT ON saltos
FOR EACH ROW
BEGIN
    DECLARE v_licencia VARCHAR(5);
    DECLARE v_estado_paracaidista VARCHAR(20);

    SELECT licencia, estado INTO v_licencia, v_estado_paracaidista
    FROM paracaidistas
    WHERE id = NEW.paracaidista_id;

    -- Regla de negocio 1: El paracaidista debe estar activo
    IF v_estado_paracaidista != 'activo' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El paracaidista no está activo para realizar saltos.';
    END IF;

    -- Regla de negocio 2: Saltos de alta altitud (> 15,000 ft) requieren Licencia C o D
    IF NEW.altitud_pies > 15000 AND v_licencia NOT IN ('C', 'D') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de Seguridad: Saltos superiores a 15,000 pies requieren Licencia C o D.';
    END IF;
END //

-- Trigger 2: Actualizar bitácora de acumulación del paracaidista tras un salto exitoso (AFTER INSERT)
CREATE TRIGGER trg_actualizar_estadisticas_paracaidista
AFTER INSERT ON saltos
FOR EACH ROW
BEGIN
    UPDATE paracaidistas
    SET total_saltos = total_saltos + 1,
        minutos_caida_libre = minutos_caida_libre + FLOOR(NEW.segundos_caida_libre / 60)
    WHERE id = NEW.paracaidista_id;
END //

-- Trigger 3: Registrar historial de cambios de estado en equipos (AFTER UPDATE)
CREATE TRIGGER trg_auditar_cambio_estado_equipo
AFTER UPDATE ON equipos
FOR EACH ROW
BEGIN
    IF OLD.estado != NEW.estado THEN
        INSERT INTO auditoria_equipos (equipo_id, estado_anterior, estado_nuevo)
        VALUES (NEW.id, OLD.estado, NEW.estado);
    END IF;
END //

DELIMITER ;