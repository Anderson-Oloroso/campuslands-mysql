CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vista_carga_artistas;
DROP VIEW IF EXISTS vista_resumen_proyectos;

DROP TABLE IF EXISTS proyectos_artistas;
DROP TABLE IF EXISTS proyectos_3d;
DROP TABLE IF EXISTS artistas;

CREATE TABLE artistas (
    id_artista INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    experiencia_anios TINYINT UNSIGNED NOT NULL,
    CONSTRAINT chk_experiencia_artista CHECK (experiencia_anios >= 0)
);

CREATE TABLE proyectos_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo_animacion VARCHAR(50) NOT NULL,
    duracion_segundos INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_entrega DATE NOT NULL,
    CONSTRAINT chk_duracion_proyecto CHECK (duracion_segundos > 0),
    CONSTRAINT chk_presupuesto_proyecto CHECK (presupuesto > 0),
    CONSTRAINT chk_estado_proyecto CHECK (
        estado IN ('pendiente', 'en_produccion', 'finalizado')
    )
);

CREATE TABLE proyectos_artistas (
    id_proyecto INT UNSIGNED NOT NULL,
    id_artista INT UNSIGNED NOT NULL,
    rol VARCHAR(50) NOT NULL,
    horas_trabajadas INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_proyecto, id_artista),
    CONSTRAINT fk_proyecto_artista_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_3d(id_proyecto),
    CONSTRAINT fk_proyecto_artista_artista
        FOREIGN KEY (id_artista)
        REFERENCES artistas(id_artista),
    CONSTRAINT chk_horas_trabajadas CHECK (horas_trabajadas > 0)
);

CREATE VIEW vista_resumen_proyectos AS
SELECT
    p.id_proyecto,
    p.titulo,
    p.tipo_animacion,
    p.estado,
    p.presupuesto,
    COUNT(pa.id_artista) AS total_artistas,
    COALESCE(SUM(pa.horas_trabajadas), 0) AS horas_totales
FROM proyectos_3d AS p
LEFT JOIN proyectos_artistas AS pa
    ON p.id_proyecto = pa.id_proyecto
GROUP BY
    p.id_proyecto,
    p.titulo,
    p.tipo_animacion,
    p.estado,
    p.presupuesto;

CREATE VIEW vista_carga_artistas AS
SELECT
    a.id_artista,
    a.nombre,
    a.especialidad,
    COUNT(pa.id_proyecto) AS total_proyectos,
    COALESCE(SUM(pa.horas_trabajadas), 0) AS horas_totales,
    COALESCE(AVG(pa.horas_trabajadas), 0) AS promedio_horas
FROM artistas AS a
LEFT JOIN proyectos_artistas AS pa
    ON a.id_artista = pa.id_artista
GROUP BY
    a.id_artista,
    a.nombre,
    a.especialidad;