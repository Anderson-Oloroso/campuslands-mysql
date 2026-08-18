CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(30) NOT NULL,
    numero_camiseta INT NOT NULL,
    edad INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    asistencias INT NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_numero_camiseta
        CHECK (numero_camiseta BETWEEN 1 AND 99),

    CONSTRAINT chk_edad
        CHECK (edad BETWEEN 16 AND 45),

    CONSTRAINT chk_goles
        CHECK (goles >= 0),

    CONSTRAINT chk_asistencias
        CHECK (asistencias >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activo', 'lesionado', 'inactivo'))
);