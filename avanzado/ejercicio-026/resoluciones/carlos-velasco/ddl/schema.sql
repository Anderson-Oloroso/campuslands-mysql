-- ============================================================
-- Ejercicio 026 - CTE para videojuego RPG
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Tabla de clases RPG
-- ------------------------------------------------------------
CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    nivel_dificultad ENUM(
        'bajo',
        'medio',
        'alto'
    ) NOT NULL,

    CONSTRAINT uq_clases_nombre
        UNIQUE (nombre)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla de personajes
-- ------------------------------------------------------------
CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    id_clase INT NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    nivel INT NOT NULL,
    experiencia INT NOT NULL DEFAULT 0,
    oro DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo',

    CONSTRAINT fk_personajes_clase
        FOREIGN KEY (id_clase)
        REFERENCES clases(id_clase),

    CONSTRAINT chk_personajes_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_personajes_experiencia
        CHECK (experiencia >= 0),

    CONSTRAINT chk_personajes_oro
        CHECK (oro >= 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla de misiones
-- ------------------------------------------------------------
CREATE TABLE misiones (
    id_mision INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    dificultad ENUM(
        'facil',
        'media',
        'dificil',
        'epica'
    ) NOT NULL,
    experiencia_recompensa INT NOT NULL,
    oro_recompensa DECIMAL(10, 2) NOT NULL,
    estado ENUM(
        'disponible',
        'completada',
        'bloqueada'
    ) NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_misiones_experiencia
        CHECK (experiencia_recompensa > 0),

    CONSTRAINT chk_misiones_oro
        CHECK (oro_recompensa >= 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Relación entre personajes y misiones
-- ------------------------------------------------------------
CREATE TABLE personajes_misiones (
    id_personaje INT NOT NULL,
    id_mision INT NOT NULL,
    fecha_completada DATE NULL,
    resultado ENUM(
        'completada',
        'fallida',
        'abandonada'
    ) NOT NULL,

    PRIMARY KEY (id_personaje, id_mision),

    CONSTRAINT fk_pm_personaje
        FOREIGN KEY (id_personaje)
        REFERENCES personajes(id_personaje),

    CONSTRAINT fk_pm_mision
        FOREIGN KEY (id_mision)
        REFERENCES misiones(id_mision)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Índices para relaciones y consultas.
-- ------------------------------------------------------------
CREATE INDEX idx_personajes_clase
    ON personajes(id_clase);

CREATE INDEX idx_personajes_nivel
    ON personajes(nivel);

CREATE INDEX idx_personajes_estado
    ON personajes(estado);

CREATE INDEX idx_misiones_dificultad
    ON misiones(dificultad);

CREATE INDEX idx_pm_mision
    ON personajes_misiones(id_mision);