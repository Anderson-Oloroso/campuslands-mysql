CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_3d;
DROP TABLE IF EXISTS arquitectos_3d;

CREATE TABLE arquitectos_3d (
    id_arquitecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_arquitectos_experiencia
        CHECK (experiencia_anios <= 60)
);

CREATE TABLE proyectos_arquitectura_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(150) NOT NULL,
    tipo_proyecto VARCHAR(80) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    estado ENUM('planificado', 'en_progreso', 'finalizado') NOT NULL,
    id_arquitecto INT UNSIGNED NOT NULL,

    CONSTRAINT chk_proyectos_presupuesto
        CHECK (presupuesto > 0),

    CONSTRAINT fk_proyectos_arquitectos
        FOREIGN KEY (id_arquitecto)
        REFERENCES arquitectos_3d(id_arquitecto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_proyectos_estado
    ON proyectos_arquitectura_3d(estado);

CREATE INDEX idx_proyectos_ciudad
    ON proyectos_arquitectura_3d(ciudad);

CREATE INDEX idx_proyectos_arquitecto
    ON proyectos_arquitectura_3d(id_arquitecto);


DROP ROLE IF EXISTS 'rol_arquitectura_lectura';
DROP ROLE IF EXISTS 'rol_arquitectura_editor';
DROP ROLE IF EXISTS 'rol_arquitectura_admin';

CREATE ROLE 'rol_arquitectura_lectura';
CREATE ROLE 'rol_arquitectura_editor';
CREATE ROLE 'rol_arquitectura_admin';

GRANT SELECT
ON campuslands_mysql.*
TO 'rol_arquitectura_lectura';

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.*
TO 'rol_arquitectura_editor';

GRANT ALL PRIVILEGES
ON campuslands_mysql.*
TO 'rol_arquitectura_admin';