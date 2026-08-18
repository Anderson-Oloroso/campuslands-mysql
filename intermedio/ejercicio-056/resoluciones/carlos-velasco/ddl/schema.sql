CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(30) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    puntos_vida INT UNSIGNED NOT NULL,
    puntos_mana INT UNSIGNED NOT NULL,
    experiencia INT UNSIGNED NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_puntos_vida
        CHECK (puntos_vida > 0),

    CONSTRAINT chk_puntos_mana
        CHECK (puntos_mana >= 0),

    CONSTRAINT chk_experiencia
        CHECK (experiencia >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activo', 'inactivo'))
);