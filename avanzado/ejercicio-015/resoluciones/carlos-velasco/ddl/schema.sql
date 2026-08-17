CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;


CREATE TABLE videojuegos (
    id_videojuego INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) UNSIGNED NOT NULL,
    puntuacion DECIMAL(3, 1) UNSIGNED NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    estado ENUM('disponible', 'agotado', 'retirado')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT uq_videojuegos_titulo_plataforma
        UNIQUE (titulo, plataforma),

    CONSTRAINT chk_videojuegos_titulo
        CHECK (CHAR_LENGTH(TRIM(titulo)) >= 2),

    CONSTRAINT chk_videojuegos_puntuacion
        CHECK (puntuacion BETWEEN 0 AND 10),

    CONSTRAINT chk_videojuegos_precio
        CHECK (precio >= 0)
);


-- ============================================================
-- INDICES DE OPTIMIZACION
-- ============================================================

CREATE INDEX idx_videojuegos_estado
    ON videojuegos (estado);

CREATE INDEX idx_videojuegos_genero_estado
    ON videojuegos (genero, estado);

CREATE INDEX idx_videojuegos_plataforma_estado
    ON videojuegos (plataforma, estado);

CREATE INDEX idx_videojuegos_estado_puntuacion
    ON videojuegos (estado, puntuacion DESC);