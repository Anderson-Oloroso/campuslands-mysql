CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    equipo VARCHAR(100) NOT NULL,
    posicion VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    numero_camiseta INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_jugador_edad
        CHECK (edad >= 16 AND edad <= 50),

    CONSTRAINT chk_numero_camiseta
        CHECK (numero_camiseta BETWEEN 1 AND 99),

    CONSTRAINT chk_goles
        CHECK (goles >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activo', 'lesionado', 'suspendido'))
);