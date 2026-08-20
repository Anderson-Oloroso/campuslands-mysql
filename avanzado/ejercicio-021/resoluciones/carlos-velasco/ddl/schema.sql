-- ============================================================
-- Ejercicio 021 - EXPLAIN para dibujo digital
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: artistas
-- ------------------------------------------------------------
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(80) NOT NULL,
    experiencia_anios INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_artistas_experiencia
        CHECK (experiencia_anios >= 0)
);

-- ------------------------------------------------------------
-- Tabla: obras
-- ------------------------------------------------------------
CREATE TABLE obras (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    tecnica VARCHAR(80) NOT NULL,
    fecha_creacion DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM(
        'borrador',
        'publicada',
        'vendida',
        'archivada'
    ) NOT NULL DEFAULT 'borrador',

    CONSTRAINT fk_obras_artista
        FOREIGN KEY (id_artista)
        REFERENCES artistas(id_artista),

    CONSTRAINT chk_obras_precio
        CHECK (precio > 0)
);

-- ------------------------------------------------------------
-- Tabla: proyectos
-- ------------------------------------------------------------
CREATE TABLE proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    estado ENUM(
        'planificado',
        'en_progreso',
        'finalizado',
        'cancelado'
    ) NOT NULL DEFAULT 'planificado',

    CONSTRAINT fk_proyectos_artista
        FOREIGN KEY (id_artista)
        REFERENCES artistas(id_artista),

    CONSTRAINT chk_proyectos_presupuesto
        CHECK (presupuesto > 0),

    CONSTRAINT chk_proyectos_fechas
        CHECK (
            fecha_fin IS NULL
            OR fecha_fin >= fecha_inicio
        )
);

-- ------------------------------------------------------------
-- Índices para las consultas que serán analizadas.
-- ------------------------------------------------------------

CREATE INDEX idx_artistas_estado
    ON artistas(estado);

CREATE INDEX idx_artistas_especialidad
    ON artistas(especialidad);

CREATE INDEX idx_obras_estado
    ON obras(estado);

CREATE INDEX idx_obras_tecnica
    ON obras(tecnica);

CREATE INDEX idx_obras_artista_fecha
    ON obras(id_artista, fecha_creacion);

CREATE INDEX idx_obras_precio
    ON obras(precio);

CREATE INDEX idx_proyectos_estado
    ON proyectos(estado);

CREATE INDEX idx_proyectos_artista_estado
    ON proyectos(id_artista, estado);