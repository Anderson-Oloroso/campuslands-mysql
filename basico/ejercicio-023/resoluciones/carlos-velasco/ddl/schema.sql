CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_3d;

CREATE TABLE proyectos_arquitectura_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    arquitecto VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    estado ENUM('planificado', 'en_proceso', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'planificado',

    CONSTRAINT chk_presupuesto
        CHECK (presupuesto >= 0)
);