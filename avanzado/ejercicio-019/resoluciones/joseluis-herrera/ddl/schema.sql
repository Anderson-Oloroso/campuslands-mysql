CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_salto_after_insert;
DROP TRIGGER IF EXISTS trg_salto_before_update;

DROP TABLE IF EXISTS auditoria_saltos;
DROP TABLE IF EXISTS saltos;

CREATE TABLE saltos (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_participante VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_salto INT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_salto DATE NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Programado',

    CONSTRAINT chk_saltos_altura_positiva
        CHECK (altura_salto > 0),

    CONSTRAINT chk_saltos_precio_positivo
        CHECK (precio > 0),

    CONSTRAINT chk_saltos_estado
        CHECK (estado IN ('Programado', 'Completado', 'Cancelado'))
);

CREATE TABLE auditoria_saltos (
    id_auditoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_salto INT UNSIGNED NOT NULL,
    nombre_participante VARCHAR(100) NOT NULL,
    accion VARCHAR(30) NOT NULL,
    fecha_auditoria DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_auditoria_salto
        FOREIGN KEY (id_salto)
        REFERENCES saltos(id_salto)
);

DELIMITER $$

CREATE TRIGGER trg_salto_after_insert
AFTER INSERT ON saltos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_saltos (
        id_salto,
        nombre_participante,
        accion
    )
    VALUES (
        NEW.id_salto,
        NEW.nombre_participante,
        'INSERT'
    );
END$$

CREATE TRIGGER trg_salto_before_update
BEFORE UPDATE ON saltos
FOR EACH ROW
BEGIN
    IF OLD.estado = 'Completado'
       AND NEW.estado = 'Cancelado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Un salto completado no puede cambiar a cancelado';
    END IF;
END$$

DELIMITER ;