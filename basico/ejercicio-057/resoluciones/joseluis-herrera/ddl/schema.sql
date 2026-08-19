CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_accion_aventura;

CREATE TABLE personajes_accion_aventura (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(30) NOT NULL,
    nivel INT NOT NULL,
    experiencia INT NOT NULL,
    monedas DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    salud INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_nivel_positivo CHECK (nivel > 0),
    CONSTRAINT chk_experiencia_no_negativa CHECK (experiencia >= 0),
    CONSTRAINT chk_monedas_no_negativas CHECK (monedas >= 0),
    CONSTRAINT chk_salud_positiva CHECK (salud > 0)
);