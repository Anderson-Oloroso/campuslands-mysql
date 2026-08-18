-- ============================================================
-- Ejercicio 022 - Vistas avanzadas para animacion 3D
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: artistas_3d
-- ------------------------------------------------------------
CREATE TABLE artistas_3d (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    experiencia_anios INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_artistas_3d_experiencia
        CHECK (experiencia_anios >= 0)
);

-- ------------------------------------------------------------
-- Tabla: proyectos_3d
-- ------------------------------------------------------------
CREATE TABLE proyectos_3d (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado ENUM(
        'planificado',
        'en_progreso',
        'finalizado',
        'cancelado'
    ) NOT NULL DEFAULT 'planificado',

    CONSTRAINT chk_proyectos_3d_presupuesto
        CHECK (presupuesto > 0),

    CONSTRAINT chk_proyectos_3d_fechas
        CHECK (
            fecha_fin IS NULL
            OR fecha_fin >= fecha_inicio
        )
);

-- ------------------------------------------------------------
-- Tabla: escenas
-- ------------------------------------------------------------
CREATE TABLE escenas (
    id_escena INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    id_artista INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    horas_trabajadas DECIMAL(8, 2) NOT NULL,
    complejidad ENUM(
        'baja',
        'media',
        'alta'
    ) NOT NULL,
    estado ENUM(
        'pendiente',
        'en_progreso',
        'finalizada'
    ) NOT NULL DEFAULT 'pendiente',

    CONSTRAINT fk_escenas_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_3d(id_proyecto),

    CONSTRAINT fk_escenas_artista
        FOREIGN KEY (id_artista)
        REFERENCES artistas_3d(id_artista),

    CONSTRAINT chk_escenas_horas
        CHECK (horas_trabajadas >= 0)
);

-- ------------------------------------------------------------
-- Índices para relaciones y consultas frecuentes.
-- ------------------------------------------------------------
CREATE INDEX idx_artistas_3d_estado
    ON artistas_3d(estado);

CREATE INDEX idx_proyectos_3d_estado
    ON proyectos_3d(estado);

CREATE INDEX idx_proyectos_3d_tipo
    ON proyectos_3d(tipo);

CREATE INDEX idx_escenas_proyecto
    ON escenas(id_proyecto);

CREATE INDEX idx_escenas_artista
    ON escenas(id_artista);

CREATE INDEX idx_escenas_estado
    ON escenas(estado);


-- ============================================================
-- VISTAS
-- ============================================================

-- ------------------------------------------------------------
-- Vista 1
-- Resumen general de proyectos.
--
-- Agrupa las escenas de cada proyecto y calcula:
-- - cantidad de escenas
-- - horas trabajadas
-- - promedio de horas por escena
-- - cantidad de artistas participantes
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_resumen_proyectos_3d AS
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    p.tipo,
    p.estado,
    p.presupuesto,
    COUNT(s.id_escena) AS total_escenas,
    COALESCE(SUM(s.horas_trabajadas), 0) AS horas_totales,
    COALESCE(AVG(s.horas_trabajadas), 0) AS horas_promedio_escena,
    COUNT(DISTINCT s.id_artista) AS artistas_participantes
FROM proyectos_3d AS p
LEFT JOIN escenas AS s
    ON s.id_proyecto = p.id_proyecto
GROUP BY
    p.id_proyecto,
    p.nombre,
    p.tipo,
    p.estado,
    p.presupuesto;


-- ------------------------------------------------------------
-- Vista 2
-- Rendimiento de artistas según escenas y horas trabajadas.
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_rendimiento_artistas_3d AS
SELECT
    a.id_artista,
    a.nombre AS artista,
    a.especialidad,
    a.experiencia_anios,
    COUNT(s.id_escena) AS escenas_asignadas,
    COALESCE(SUM(s.horas_trabajadas), 0) AS horas_trabajadas,
    COALESCE(AVG(s.horas_trabajadas), 0) AS horas_promedio_escena,
    SUM(
        CASE
            WHEN s.estado = 'finalizada' THEN 1
            ELSE 0
        END
    ) AS escenas_finalizadas
FROM artistas_3d AS a
LEFT JOIN escenas AS s
    ON s.id_artista = a.id_artista
GROUP BY
    a.id_artista,
    a.nombre,
    a.especialidad,
    a.experiencia_anios;


-- ------------------------------------------------------------
-- Vista 3
-- Escenas de alta complejidad pendientes o en progreso.
--
-- Se utiliza para identificar carga de trabajo crítica.
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_escenas_criticas_3d AS
SELECT
    s.id_escena,
    s.nombre AS escena,
    p.nombre AS proyecto,
    a.nombre AS artista,
    a.especialidad,
    s.horas_trabajadas,
    s.complejidad,
    s.estado
FROM escenas AS s
INNER JOIN proyectos_3d AS p
    ON p.id_proyecto = s.id_proyecto
INNER JOIN artistas_3d AS a
    ON a.id_artista = s.id_artista
WHERE s.complejidad = 'alta'
  AND s.estado IN ('pendiente', 'en_progreso');