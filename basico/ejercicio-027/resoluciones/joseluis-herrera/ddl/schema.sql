CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes;

CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(30) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    salud INT UNSIGNED NOT NULL,
    ataque INT UNSIGNED NOT NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_salud
        CHECK (salud > 0),

    CONSTRAINT chk_ataque
        CHECK (ataque > 0)
);