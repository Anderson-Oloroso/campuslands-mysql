CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TRIGGER IF EXISTS trg_registrar_salto;

DROP TABLE IF EXISTS auditoria_saltos;
DROP TABLE IF EXISTS saltos;

CREATE TABLE saltos (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    nivel_experiencia VARCHAR(30) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    altura_salida_metros INT UNSIGNED NOT NULL,
    duracion_segundos INT UNSIGNED NOT NULL,
    fecha_salto DATE NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'programado',
    puntuacion DECIMAL(5,2) NOT NULL,
    CONSTRAINT chk_nivel_experiencia
        CHECK (nivel_experiencia IN ('principiante', 'intermedio', 'avanzado')),
    CONSTRAINT chk_altura_salida
        CHECK (altura_salida_metros BETWEEN 1000 AND 6000),
    CONSTRAINT chk_duracion
        CHECK (duracion_segundos > 0),
    CONSTRAINT chk_puntuacion
        CHECK (puntuacion BETWEEN 0 AND 100),
    CONSTRAINT chk_estado
        CHECK (estado IN ('programado', 'completado', 'cancelado'))
);

CREATE TABLE auditoria_saltos (
    id_auditoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_salto INT UNSIGNED NOT NULL,
    accion VARCHAR(30) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_auditoria_salto
        FOREIGN KEY (id_salto)
        REFERENCES saltos(id_salto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DELIMITER //

CREATE TRIGGER trg_registrar_salto
AFTER INSERT ON saltos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_saltos (id_salto, accion)
    VALUES (NEW.id_salto, 'SALTO REGISTRADO');
END//

DELIMITER ;