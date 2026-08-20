CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS personajes_rpg (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    clase ENUM('guerrero', 'mago', 'arquero', 'asesino', 'paladin') NOT NULL,
    nivel INT UNSIGNED NOT NULL,
    experiencia INT UNSIGNED NOT NULL DEFAULT 0,
    vida_maxima INT UNSIGNED NOT NULL,
    mana_maximo INT UNSIGNED NOT NULL,
    ataque INT UNSIGNED NOT NULL,
    defensa INT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_personaje_nombre UNIQUE (nombre),
    CONSTRAINT chk_nivel_valido CHECK (nivel BETWEEN 1 AND 100),
    CONSTRAINT chk_vida_positiva CHECK (vida_maxima > 0),
    CONSTRAINT chk_ataque_positivo CHECK (ataque > 0),
    CONSTRAINT chk_defensa_positiva CHECK (defensa > 0)
);