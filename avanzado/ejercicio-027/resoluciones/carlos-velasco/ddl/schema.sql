-- ============================================================
-- Ejercicio 027 - Window Functions
-- Videojuego de acción y aventura
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Tabla de personajes
-- ------------------------------------------------------------
CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    clase VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_personajes_nivel
        CHECK (nivel BETWEEN 1 AND 100)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla de jugadores
-- ------------------------------------------------------------
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    fecha_registro DATE NOT NULL,
    estado ENUM(
        'activo',
        'inactivo'
    ) NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_jugadores_usuario
        UNIQUE (nombre_usuario)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Tabla de partidas
-- ------------------------------------------------------------
CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_personaje INT NOT NULL,
    fecha_partida DATETIME NOT NULL,
    duracion_minutos INT NOT NULL,
    enemigos_derrotados INT NOT NULL,
    experiencia_ganada INT NOT NULL,
    oro_ganado DECIMAL(10, 2) NOT NULL,
    resultado ENUM(
        'victoria',
        'derrota'
    ) NOT NULL,

    CONSTRAINT fk_partidas_jugador
        FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT fk_partidas_personaje
        FOREIGN KEY (id_personaje)
        REFERENCES personajes(id_personaje),

    CONSTRAINT chk_partidas_duracion
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_partidas_enemigos
        CHECK (enemigos_derrotados >= 0),

    CONSTRAINT chk_partidas_experiencia
        CHECK (experiencia_ganada >= 0),

    CONSTRAINT chk_partidas_oro
        CHECK (oro_ganado >= 0)
) ENGINE = InnoDB;


-- ------------------------------------------------------------
-- Índices para relaciones y consultas.
-- ------------------------------------------------------------
CREATE INDEX idx_partidas_jugador
    ON partidas(id_jugador);

CREATE INDEX idx_partidas_personaje
    ON partidas(id_personaje);

CREATE INDEX idx_partidas_fecha
    ON partidas(fecha_partida);

CREATE INDEX idx_partidas_resultado
    ON partidas(resultado);