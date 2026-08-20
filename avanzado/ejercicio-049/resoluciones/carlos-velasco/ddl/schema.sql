CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TRIGGER IF EXISTS tr_registrar_salto;

DROP TABLE IF EXISTS auditoria_saltos;
DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    nivel_experiencia VARCHAR(30) NOT NULL,
    fecha_salto DATE NOT NULL,
    altura_salto_metros INT UNSIGNED NOT NULL,
    duracion_caida_segundos INT UNSIGNED NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    estado ENUM('programado', 'realizado', 'cancelado') NOT NULL DEFAULT 'programado',

    CONSTRAINT chk_altura_salto
        CHECK (altura_salto_metros > 0),

    CONSTRAINT chk_duracion_caida
        CHECK (duracion_caida_segundos > 0)
);

CREATE TABLE auditoria_saltos (
    id_auditoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_salto INT UNSIGNED NOT NULL,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    accion VARCHAR(30) NOT NULL,
    fecha_auditoria DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_auditoria_salto
        FOREIGN KEY (id_salto)
        REFERENCES saltos_paracaidismo(id_salto)
);

DELIMITER $$

CREATE TRIGGER tr_registrar_salto
AFTER INSERT ON saltos_paracaidismo
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_saltos (
        id_salto,
        nombre_paracaidista,
        accion
    )
    VALUES (
        NEW.id_salto,
        NEW.nombre_paracaidista,
        'SALTO REGISTRADO'
    );
END$$

DELIMITER ;