CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vw_resumen_proyectos;
DROP VIEW IF EXISTS vw_participaciones_animacion;

DROP TABLE IF EXISTS participaciones;
DROP TABLE IF EXISTS animadores;
DROP TABLE IF EXISTS proyectos;

CREATE TABLE proyectos (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estudio VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    estado ENUM('planificacion', 'produccion', 'finalizado') NOT NULL DEFAULT 'planificacion',

    CONSTRAINT chk_presupuesto_positivo
        CHECK (presupuesto >= 0)
);

CREATE TABLE animadores (
    id_animador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(60) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,

    CONSTRAINT chk_experiencia_valida
        CHECK (experiencia_anios <= 60)
);

CREATE TABLE participaciones (
    id_proyecto INT UNSIGNED NOT NULL,
    id_animador INT UNSIGNED NOT NULL,
    rol VARCHAR(60) NOT NULL,
    horas_trabajadas DECIMAL(8,2) NOT NULL,

    PRIMARY KEY (id_proyecto, id_animador),

    CONSTRAINT fk_participaciones_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos(id_proyecto)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_participaciones_animador
        FOREIGN KEY (id_animador)
        REFERENCES animadores(id_animador)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_horas_positivas
        CHECK (horas_trabajadas > 0)
);


CREATE VIEW vw_participaciones_animacion AS
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    p.estudio,
    p.estado AS estado_proyecto,
    a.id_animador,
    a.nombre AS animador,
    a.especialidad,
    a.experiencia_anios,
    pa.rol,
    pa.horas_trabajadas
FROM participaciones AS pa
INNER JOIN proyectos AS p
    ON pa.id_proyecto = p.id_proyecto
INNER JOIN animadores AS a
    ON pa.id_animador = a.id_animador;


CREATE VIEW vw_resumen_proyectos AS
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    p.estudio,
    p.estado,
    p.presupuesto,
    COUNT(pa.id_animador) AS total_animadores,
    COALESCE(SUM(pa.horas_trabajadas), 0) AS horas_totales,
    COALESCE(AVG(a.experiencia_anios), 0) AS experiencia_promedio
FROM proyectos AS p
LEFT JOIN participaciones AS pa
    ON p.id_proyecto = pa.id_proyecto
LEFT JOIN animadores AS a
    ON pa.id_animador = a.id_animador
GROUP BY
    p.id_proyecto,
    p.nombre,
    p.estudio,
    p.estado,
    p.presupuesto;