CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_3d;

CREATE TABLE proyectos_arquitectura_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado ENUM('planificado', 'en_revision', 'aprobado', 'finalizado') NOT NULL DEFAULT 'planificado',
    fecha_entrega DATE NOT NULL,

    CONSTRAINT chk_presupuesto_positivo
        CHECK (presupuesto >= 0)
);