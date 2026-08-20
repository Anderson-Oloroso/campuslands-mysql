-- ============================================================
-- Ejercicio 019 - Triggers para paracaidismo
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: paracaidistas
-- ------------------------------------------------------------
CREATE TABLE paracaidistas (
    id_paracaidista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel_experiencia ENUM(
        'principiante',
        'intermedio',
        'avanzado'
    ) NOT NULL,
    saltos_realizados INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_paracaidistas_saltos
        CHECK (saltos_realizados >= 0)
);

-- ------------------------------------------------------------
-- Tabla: equipos
-- ------------------------------------------------------------
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    disponibilidad INT NOT NULL DEFAULT 1,
    estado ENUM('disponible', 'mantenimiento', 'inactivo')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_equipos_disponibilidad
        CHECK (disponibilidad >= 0)
);

-- ------------------------------------------------------------
-- Tabla: saltos
-- ------------------------------------------------------------
CREATE TABLE saltos (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    id_paracaidista INT NOT NULL,
    id_equipo INT NOT NULL,
    fecha_salto DATETIME NOT NULL,
    altura_metros INT NOT NULL,
    duracion_segundos INT NOT NULL,
    estado ENUM(
        'programado',
        'realizado',
        'cancelado'
    ) NOT NULL DEFAULT 'programado',

    CONSTRAINT fk_saltos_paracaidista
        FOREIGN KEY (id_paracaidista)
        REFERENCES paracaidistas(id_paracaidista),

    CONSTRAINT fk_saltos_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES equipos(id_equipo),

    CONSTRAINT chk_saltos_altura
        CHECK (altura_metros > 0),

    CONSTRAINT chk_saltos_duracion
        CHECK (duracion_segundos > 0)
);

-- ------------------------------------------------------------
-- Tabla: auditoria_saltos
-- ------------------------------------------------------------
CREATE TABLE auditoria_saltos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_salto INT NOT NULL,
    estado_anterior VARCHAR(20) NOT NULL,
    estado_nuevo VARCHAR(20) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_auditoria_salto
        FOREIGN KEY (id_salto)
        REFERENCES saltos(id_salto)
);

-- ------------------------------------------------------------
-- Índices
-- ------------------------------------------------------------
CREATE INDEX idx_paracaidistas_estado
    ON paracaidistas(estado);

CREATE INDEX idx_equipos_estado
    ON equipos(estado);

CREATE INDEX idx_saltos_fecha
    ON saltos(fecha_salto);

CREATE INDEX idx_saltos_estado
    ON saltos(estado);

CREATE INDEX idx_auditoria_salto
    ON auditoria_saltos(id_salto);


-- ============================================================
-- TRIGGERS
-- ============================================================

DELIMITER $$

-- ------------------------------------------------------------
-- Trigger 1
-- Antes de registrar un salto, valida que el equipo exista
-- en estado disponible y tenga disponibilidad.
-- ------------------------------------------------------------
CREATE TRIGGER trg_validar_equipo_salto
BEFORE INSERT ON saltos
FOR EACH ROW
BEGIN
    DECLARE v_disponibilidad INT;
    DECLARE v_estado VARCHAR(20);

    SELECT
        disponibilidad,
        estado
    INTO
        v_disponibilidad,
        v_estado
    FROM equipos
    WHERE id_equipo = NEW.id_equipo;

    IF v_estado IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El equipo indicado no existe';
    END IF;

    IF v_estado <> 'disponible' OR v_disponibilidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'El equipo no esta disponible para realizar el salto';
    END IF;
END $$


-- ------------------------------------------------------------
-- Trigger 2
-- Después de registrar un salto realizado, descuenta una
-- unidad de disponibilidad y aumenta el contador de saltos
-- del paracaidista.
-- ------------------------------------------------------------
CREATE TRIGGER trg_actualizar_salto_realizado
AFTER INSERT ON saltos
FOR EACH ROW
BEGIN
    IF NEW.estado = 'realizado' THEN

        UPDATE equipos
        SET disponibilidad = disponibilidad - 1
        WHERE id_equipo = NEW.id_equipo;

        UPDATE paracaidistas
        SET saltos_realizados = saltos_realizados + 1
        WHERE id_paracaidista = NEW.id_paracaidista;

    END IF;
END $$


-- ------------------------------------------------------------
-- Trigger 3
-- Cuando cambia el estado de un salto, guarda automáticamente
-- el estado anterior y el nuevo estado en la auditoría.
-- ------------------------------------------------------------
CREATE TRIGGER trg_auditar_cambio_estado_salto
AFTER UPDATE ON saltos
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN

        INSERT INTO auditoria_saltos (
            id_salto,
            estado_anterior,
            estado_nuevo,
            fecha_cambio
        )
        VALUES (
            NEW.id_salto,
            OLD.estado,
            NEW.estado,
            CURRENT_TIMESTAMP
        );

    END IF;
END $$

DELIMITER ;