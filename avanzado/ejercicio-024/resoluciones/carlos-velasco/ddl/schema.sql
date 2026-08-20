-- ============================================================
-- Ejercicio 024 - Bloqueos para soldadura
-- Base de datos: campuslands_mysql
-- Motor: MySQL / InnoDB
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Tabla: soldadores
-- ------------------------------------------------------------
CREATE TABLE soldadores (
    id_soldador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    nivel_experiencia ENUM(
        'junior',
        'intermedio',
        'senior'
    ) NOT NULL,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo'
);


-- ------------------------------------------------------------
-- Tabla: trabajos_soldadura
-- ------------------------------------------------------------
CREATE TABLE trabajos_soldadura (
    id_trabajo INT AUTO_INCREMENT PRIMARY KEY,
    id_soldador INT NOT NULL,
    cliente VARCHAR(120) NOT NULL,
    tipo_soldadura VARCHAR(80) NOT NULL,
    material VARCHAR(80) NOT NULL,
    fecha_trabajo DATE NOT NULL,
    horas_estimadas DECIMAL(6, 2) NOT NULL,
    costo_estimado DECIMAL(10, 2) NOT NULL,
    estado ENUM(
        'pendiente',
        'en_proceso',
        'finalizado',
        'cancelado'
    ) NOT NULL DEFAULT 'pendiente',

    CONSTRAINT fk_trabajos_soldador
        FOREIGN KEY (id_soldador)
        REFERENCES soldadores(id_soldador),

    CONSTRAINT chk_horas_estimadas
        CHECK (horas_estimadas > 0),

    CONSTRAINT chk_costo_estimado
        CHECK (costo_estimado > 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Índices para facilitar las consultas y búsquedas.
-- ------------------------------------------------------------
CREATE INDEX idx_trabajos_soldador
    ON trabajos_soldadura(id_soldador);

CREATE INDEX idx_trabajos_estado
    ON trabajos_soldadura(estado);

CREATE INDEX idx_trabajos_fecha
    ON trabajos_soldadura(fecha_trabajo);

CREATE INDEX idx_trabajos_material
    ON trabajos_soldadura(material);