CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    clase ENUM('Guerrero', 'Mago', 'Arquero', 'Asesino') NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    puntos_vida INT UNSIGNED NOT NULL,
    experiencia INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel_rpg
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_puntos_vida_rpg
        CHECK (puntos_vida > 0)
);