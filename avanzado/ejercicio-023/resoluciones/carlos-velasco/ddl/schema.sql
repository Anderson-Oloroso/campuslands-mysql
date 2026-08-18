-- ============================================================
-- Ejercicio 023 - Roles y permisos para arquitectura 3D
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Tabla: arquitectos
-- ------------------------------------------------------------
CREATE TABLE arquitectos (
    id_arquitecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    experiencia_anios INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_arquitectos_experiencia
        CHECK (experiencia_anios >= 0)
);


-- ------------------------------------------------------------
-- Tabla: proyectos_arquitectura
-- ------------------------------------------------------------
CREATE TABLE proyectos_arquitectura (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_arquitecto INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    fecha_inicio DATE NOT NULL,
    presupuesto DECIMAL(12, 2) NOT NULL,
    estado ENUM(
        'planificado',
        'en_progreso',
        'finalizado',
        'cancelado'
    ) NOT NULL DEFAULT 'planificado',

    CONSTRAINT fk_proyectos_arquitecto
        FOREIGN KEY (id_arquitecto)
        REFERENCES arquitectos(id_arquitecto),

    CONSTRAINT chk_proyectos_presupuesto
        CHECK (presupuesto > 0)
);


-- ------------------------------------------------------------
-- Tabla: modelos_3d
-- ------------------------------------------------------------
CREATE TABLE modelos_3d (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    horas_modelado DECIMAL(8, 2) NOT NULL,
    nivel_detalle ENUM(
        'bajo',
        'medio',
        'alto'
    ) NOT NULL,
    estado ENUM(
        'borrador',
        'revision',
        'aprobado'
    ) NOT NULL DEFAULT 'borrador',

    CONSTRAINT fk_modelos_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyectos_arquitectura(id_proyecto),

    CONSTRAINT chk_modelos_horas
        CHECK (horas_modelado >= 0)
);


-- ------------------------------------------------------------
-- Índices para las relaciones y consultas.
-- ------------------------------------------------------------
CREATE INDEX idx_proyectos_arquitecto
    ON proyectos_arquitectura(id_arquitecto);

CREATE INDEX idx_proyectos_estado
    ON proyectos_arquitectura(estado);

CREATE INDEX idx_modelos_proyecto
    ON modelos_3d(id_proyecto);

CREATE INDEX idx_modelos_estado
    ON modelos_3d(estado);


-- ============================================================
-- ROLES
-- ============================================================

-- Rol para usuarios que trabajan con la información
-- operativa de arquitectura 3D.
CREATE ROLE IF NOT EXISTS 'rol_arquitecto';


-- Rol de solo lectura para usuarios que necesitan
-- consultar información sin modificarla.
CREATE ROLE IF NOT EXISTS 'rol_consulta_3d';


-- ============================================================
-- PERMISOS DEL ROL DE ARQUITECTO
-- ============================================================

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.arquitectos
TO 'rol_arquitecto';

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.proyectos_arquitectura
TO 'rol_arquitecto';

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.modelos_3d
TO 'rol_arquitecto';


-- ============================================================
-- PERMISOS DEL ROL DE CONSULTA
-- ============================================================

GRANT SELECT
ON campuslands_mysql.arquitectos
TO 'rol_consulta_3d';

GRANT SELECT
ON campuslands_mysql.proyectos_arquitectura
TO 'rol_consulta_3d';

GRANT SELECT
ON campuslands_mysql.modelos_3d
TO 'rol_consulta_3d';