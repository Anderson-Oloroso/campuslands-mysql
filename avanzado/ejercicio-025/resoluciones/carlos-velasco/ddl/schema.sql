-- ============================================================
-- Ejercicio 025 - Backup lógico para laboratorio de fórmulas
-- químicas
-- Base de datos: campuslands_mysql
-- Motor: MySQL / InnoDB
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Tabla: responsables
-- ------------------------------------------------------------
CREATE TABLE responsables (
    id_responsable INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo'
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla: sustancias
-- ------------------------------------------------------------
CREATE TABLE sustancias (
    id_sustancia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    formula_quimica VARCHAR(50) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    estado ENUM(
        'disponible',
        'agotada',
        'restringida'
    ) NOT NULL DEFAULT 'disponible',

    CONSTRAINT uq_sustancias_formula
        UNIQUE (formula_quimica)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla: formulas_laboratorio
-- ------------------------------------------------------------
CREATE TABLE formulas_laboratorio (
    id_formula INT AUTO_INCREMENT PRIMARY KEY,
    id_responsable INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    objetivo VARCHAR(200) NOT NULL,
    fecha_creacion DATE NOT NULL,
    nivel_riesgo ENUM(
        'bajo',
        'medio',
        'alto'
    ) NOT NULL,
    cantidad_componentes INT NOT NULL,
    estado ENUM(
        'borrador',
        'validada',
        'archivada'
    ) NOT NULL DEFAULT 'borrador',

    CONSTRAINT fk_formulas_responsable
        FOREIGN KEY (id_responsable)
        REFERENCES responsables(id_responsable),

    CONSTRAINT chk_formula_componentes
        CHECK (cantidad_componentes > 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Relación entre fórmulas y sustancias.
-- ------------------------------------------------------------
CREATE TABLE formula_sustancias (
    id_formula INT NOT NULL,
    id_sustancia INT NOT NULL,
    cantidad DECIMAL(10, 2) NOT NULL,
    unidad VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_formula, id_sustancia),

    CONSTRAINT fk_formula_sustancia_formula
        FOREIGN KEY (id_formula)
        REFERENCES formulas_laboratorio(id_formula),

    CONSTRAINT fk_formula_sustancia_sustancia
        FOREIGN KEY (id_sustancia)
        REFERENCES sustancias(id_sustancia),

    CONSTRAINT chk_formula_sustancia_cantidad
        CHECK (cantidad > 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Índices para consultas frecuentes.
-- ------------------------------------------------------------
CREATE INDEX idx_formula_responsable
    ON formulas_laboratorio(id_responsable);

CREATE INDEX idx_formula_estado
    ON formulas_laboratorio(estado);

CREATE INDEX idx_formula_riesgo
    ON formulas_laboratorio(nivel_riesgo);

CREATE INDEX idx_sustancia_categoria
    ON sustancias(categoria);