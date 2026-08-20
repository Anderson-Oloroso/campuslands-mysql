CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS asignaciones_animacion;
DROP TABLE IF EXISTS proyectos_animacion;
DROP TABLE IF EXISTS animadores;

CREATE TABLE animadores (
    id_animador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,

    CONSTRAINT chk_experiencia_anios
        CHECK (experiencia_anios <= 50)
);

CREATE TABLE proyectos_animacion (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    software VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado ENUM('activo', 'finalizado', 'archivado') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_presupuesto
        CHECK (presupuesto >= 0)
);

CREATE TABLE asignaciones_animacion (
    id_proyecto INT UNSIGNED NOT NULL,
    id_animador INT UNSIGNED NOT NULL,
    horas_asignadas DECIMAL(6, 2) NOT NULL,

    PRIMARY KEY (id_proyecto, id_animador),

    CONSTRAINT fk_asignacion_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_animacion(id_proyecto),

    CONSTRAINT fk_asignacion_animador
        FOREIGN KEY (id_animador)
        REFERENCES animadores(id_animador),

    CONSTRAINT chk_horas_asignadas
        CHECK (horas_asignadas > 0)
);