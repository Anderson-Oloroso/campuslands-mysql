CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(20) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    puntos_vida SMALLINT UNSIGNED NOT NULL,
    mana SMALLINT UNSIGNED NOT NULL,
    oro INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_puntos_vida
        CHECK (puntos_vida BETWEEN 100 AND 5000),

    CONSTRAINT chk_mana
        CHECK (mana BETWEEN 0 AND 3000),

    CONSTRAINT chk_oro
        CHECK (oro >= 0)
);