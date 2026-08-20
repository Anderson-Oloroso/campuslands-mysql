CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_rpg;

CREATE TABLE personajes_rpg (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(30) NOT NULL,
    nivel INT NOT NULL,
    experiencia INT NOT NULL,
    oro DECIMAL(10, 2) NOT NULL,
    salud INT NOT NULL,
    ataque INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_nivel_positivo CHECK (nivel > 0),
    CONSTRAINT chk_experiencia_no_negativa CHECK (experiencia >= 0),
    CONSTRAINT chk_oro_no_negativo CHECK (oro >= 0),
    CONSTRAINT chk_salud_positiva CHECK (salud > 0),
    CONSTRAINT chk_ataque_positivo CHECK (ataque > 0)
);