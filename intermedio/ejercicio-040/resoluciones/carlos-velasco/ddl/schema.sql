CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS participantes_carreras;

CREATE TABLE participantes_carreras (
    id_participante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    tiempo_mejor_marca DECIMAL(6,2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',
    CONSTRAINT chk_edad_participante
        CHECK (edad >= 16),
    CONSTRAINT chk_tiempo_mejor_marca
        CHECK (tiempo_mejor_marca > 0),
    CONSTRAINT chk_estado_participante
        CHECK (estado IN ('activo', 'inactivo'))
);