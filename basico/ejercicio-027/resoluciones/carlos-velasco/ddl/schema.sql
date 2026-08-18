CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_aventura;

CREATE TABLE personajes_aventura (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    clase VARCHAR(40) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    vida INT UNSIGNED NOT NULL,
    ataque INT UNSIGNED NOT NULL,
    defensa INT UNSIGNED NOT NULL,
    oro DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_vida
        CHECK (vida > 0),

    CONSTRAINT chk_ataque
        CHECK (ataque > 0),

    CONSTRAINT chk_defensa
        CHECK (defensa >= 0),

    CONSTRAINT chk_oro
        CHECK (oro >= 0)
);