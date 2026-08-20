-- ============================================================
-- EJERCICIO 052 - NORMALIZACION 2FN PARA ANIMACION 3D
-- DDL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Proyectos de animacion
-- ------------------------------------------------------------

CREATE TABLE proyectos_animacion (
    proyecto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    estudio VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado ENUM('planificado', 'en_produccion', 'finalizado')
        NOT NULL DEFAULT 'planificado',

    CONSTRAINT chk_proyecto_presupuesto
        CHECK (presupuesto >= 0)
);

-- ------------------------------------------------------------
-- Animadores
-- ------------------------------------------------------------

CREATE TABLE animadores (
    animador_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    nivel ENUM('junior', 'mid', 'senior') NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

-- ------------------------------------------------------------
-- Participacion de animadores en proyectos
--
-- La clave primaria compuesta representa:
--   proyecto + animador
--
-- Los atributos horas_asignadas y rol dependen de la
-- participacion concreta, no de una sola parte de la clave.
-- ------------------------------------------------------------

CREATE TABLE proyecto_animador (
    proyecto_id INT UNSIGNED NOT NULL,
    animador_id INT UNSIGNED NOT NULL,
    rol VARCHAR(80) NOT NULL,
    horas_asignadas INT UNSIGNED NOT NULL,

    PRIMARY KEY (proyecto_id, animador_id),

    CONSTRAINT fk_proyecto_animador_proyecto
        FOREIGN KEY (proyecto_id)
        REFERENCES proyectos_animacion(proyecto_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_proyecto_animador_animador
        FOREIGN KEY (animador_id)
        REFERENCES animadores(animador_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_horas_asignadas
        CHECK (horas_asignadas > 0)
);