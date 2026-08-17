DROP DATABASE IF EXISTS liga_futbol_orderby_db;
CREATE DATABASE liga_futbol_orderby_db;
USE liga_futbol_orderby_db;

CREATE TABLE equipos_liga (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    ciudad VARCHAR(40) NOT NULL,
    puntos INT NOT NULL,
    goles_favor INT NOT NULL,
    goles_contra INT NOT NULL,
    estado_equipo VARCHAR(20) NOT NULL,
    CONSTRAINT chk_puntos_validos CHECK (puntos >= 0),
    CONSTRAINT chk_goles_favor CHECK (goles_favor >= 0),
    CONSTRAINT chk_goles_contra CHECK (goles_contra >= 0),
    CONSTRAINT chk_estado_valido CHECK (estado_equipo IN ('Activo', 'Suspendido', 'Descendido'))
);
