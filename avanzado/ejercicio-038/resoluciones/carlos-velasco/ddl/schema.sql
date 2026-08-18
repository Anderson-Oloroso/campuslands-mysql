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

CREATE ROLE IF NOT EXISTS 'rol_entrenador';
CREATE ROLE IF NOT EXISTS 'rol_analista';

GRANT SELECT, INSERT, UPDATE
ON campuslands_mysql.jugadores
TO 'rol_entrenador';

GRANT SELECT
ON campuslands_mysql.jugadores
TO 'rol_analista';

CREATE USER IF NOT EXISTS 'usuario_entrenador'@'localhost'
IDENTIFIED BY 'Entrenador_038';

CREATE USER IF NOT EXISTS 'usuario_analista'@'localhost'
IDENTIFIED BY 'Analista_038';

GRANT 'rol_entrenador'
TO 'usuario_entrenador'@'localhost';

GRANT 'rol_analista'
TO 'usuario_analista'@'localhost';

SET DEFAULT ROLE 'rol_entrenador'
TO 'usuario_entrenador'@'localhost';

SET DEFAULT ROLE 'rol_analista'
TO 'usuario_analista'@'localhost';