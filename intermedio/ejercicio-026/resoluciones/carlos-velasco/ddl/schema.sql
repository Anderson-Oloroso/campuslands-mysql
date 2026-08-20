CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(80) NOT NULL,
    clase VARCHAR(40) NOT NULL,
    nivel INT UNSIGNED NOT NULL,
    puntos_vida INT UNSIGNED NOT NULL,
    puntos_mana INT UNSIGNED NOT NULL,
    fuerza INT UNSIGNED NOT NULL,
    defensa INT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_personaje_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_personaje_vida
        CHECK (puntos_vida > 0),

    CONSTRAINT chk_personaje_mana
        CHECK (puntos_mana >= 0),

    CONSTRAINT chk_personaje_fuerza
        CHECK (fuerza BETWEEN 1 AND 100),

    CONSTRAINT chk_personaje_defensa
        CHECK (defensa BETWEEN 1 AND 100)
);