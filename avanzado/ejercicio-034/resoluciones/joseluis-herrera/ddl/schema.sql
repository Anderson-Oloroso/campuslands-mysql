CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_motos_before_insert;
DROP TRIGGER IF EXISTS trg_motos_before_update;
DROP TRIGGER IF EXISTS trg_motos_after_insert;

DROP TABLE IF EXISTS auditoria_motos;
DROP TABLE IF EXISTS motos;

CREATE TABLE motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    anio YEAR NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_motos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_motos_estado
        CHECK (estado IN ('disponible', 'vendida', 'mantenimiento')),

    CONSTRAINT chk_motos_anio
        CHECK (anio BETWEEN 2000 AND 2030)
);

CREATE TABLE auditoria_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    accion VARCHAR(20) NOT NULL,
    fecha_evento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    detalle VARCHAR(255) NOT NULL,

    CONSTRAINT fk_auditoria_moto
        FOREIGN KEY (moto_id)
        REFERENCES motos(id)
        ON DELETE CASCADE
);

DELIMITER $$

CREATE TRIGGER trg_motos_before_insert
BEFORE INSERT ON motos
FOR EACH ROW
BEGIN
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El precio de la moto debe ser mayor que cero';
    END IF;

    IF NEW.anio < 2000 OR NEW.anio > 2030 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El año de la moto debe estar entre 2000 y 2030';
    END IF;
END$$


CREATE TRIGGER trg_motos_before_update
BEFORE UPDATE ON motos
FOR EACH ROW
BEGIN
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El precio de la moto debe ser mayor que cero';
    END IF;

    IF NEW.anio < 2000 OR NEW.anio > 2030 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El año de la moto debe estar entre 2000 y 2030';
    END IF;
END$$


CREATE TRIGGER trg_motos_after_insert
AFTER INSERT ON motos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_motos (
        moto_id,
        accion,
        detalle
    )
    VALUES (
        NEW.id,
        'INSERT',
        CONCAT(
            'Moto registrada: ',
            NEW.marca,
            ' ',
            NEW.modelo,
            ' - precio: ',
            NEW.precio
        )
    );
END$$

DELIMITER ;