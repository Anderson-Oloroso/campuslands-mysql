CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura;

CREATE TABLE proyectos_arquitectura (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    arquitecto VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    area_m2 DECIMAL(10, 2) NOT NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_entrega DATE NOT NULL,
    CONSTRAINT chk_area_proyecto CHECK (area_m2 > 0),
    CONSTRAINT chk_presupuesto_proyecto CHECK (presupuesto > 0),
    CONSTRAINT chk_estado_proyecto CHECK (
        estado IN ('diseno', 'revision', 'aprobado', 'finalizado')
    )
);

DROP ROLE IF EXISTS 'arquitectura_lector';
DROP ROLE IF EXISTS 'arquitectura_gestor';

CREATE ROLE 'arquitectura_lector';
CREATE ROLE 'arquitectura_gestor';

GRANT SELECT
ON campuslands_mysql.*
TO 'arquitectura_lector';

GRANT SELECT, INSERT, UPDATE, DELETE
ON campuslands_mysql.*
TO 'arquitectura_gestor';