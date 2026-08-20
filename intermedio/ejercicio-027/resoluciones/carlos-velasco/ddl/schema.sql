CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_aventura;

CREATE TABLE personajes_aventura (
    id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(80) NOT NULL,
    clase VARCHAR(50) NOT NULL,
    nivel INT UNSIGNED NOT NULL,
    puntos_vida INT UNSIGNED NOT NULL,
    ataque INT UNSIGNED NOT NULL,
    defensa INT UNSIGNED NOT NULL,
    misiones_completadas INT UNSIGNED NOT NULL DEFAULT 0,
    monedas DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_personaje_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_personaje_vida
        CHECK (puntos_vida > 0),

    CONSTRAINT chk_personaje_ataque
        CHECK (ataque > 0),

    CONSTRAINT chk_personaje_defensa
        CHECK (defensa > 0),

    CONSTRAINT chk_personaje_misiones
        CHECK (misiones_completadas >= 0),

    CONSTRAINT chk_personaje_monedas
        CHECK (monedas >= 0)
);