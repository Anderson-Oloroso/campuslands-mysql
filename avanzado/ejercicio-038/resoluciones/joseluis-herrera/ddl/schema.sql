CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion ENUM('portero', 'cierre', 'ala', 'pivot') NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    numero_camiseta TINYINT UNSIGNED NOT NULL,
    goles INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'lesionado', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT chk_jugadores_edad CHECK (edad BETWEEN 15 AND 50),
    CONSTRAINT chk_jugadores_camiseta CHECK (numero_camiseta BETWEEN 1 AND 99),
    CONSTRAINT chk_jugadores_goles CHECK (goles >= 0),
    CONSTRAINT uq_jugadores_camiseta UNIQUE (numero_camiseta)
);

CREATE ROLE IF NOT EXISTS 'rol_futbol_lectura';
CREATE ROLE IF NOT EXISTS 'rol_futbol_operador';

GRANT SELECT
ON campuslands_mysql.jugadores
TO 'rol_futbol_lectura';

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.jugadores
TO 'rol_futbol_operador';