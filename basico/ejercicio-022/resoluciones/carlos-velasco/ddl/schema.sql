CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_animacion_3d;

CREATE TABLE proyectos_animacion_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    animador VARCHAR(100) NOT NULL,
    software VARCHAR(50) NOT NULL,
    duracion_segundos INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado ENUM('activo', 'finalizado', 'archivado') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_duracion_segundos
        CHECK (duracion_segundos > 0),

    CONSTRAINT chk_presupuesto
        CHECK (presupuesto >= 0)
);