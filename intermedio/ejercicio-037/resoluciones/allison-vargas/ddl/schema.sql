DROP DATABASE IF EXISTS liga_futbol_2fn_db;
CREATE DATABASE liga_futbol_2fn_db;
USE liga_futbol_2fn_db;

-- Tabla 1: Equipos (Entidad independiente)
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    ciudad VARCHAR(40) NOT NULL,
    estadio VARCHAR(60) NOT NULL,
    CONSTRAINT chk_nombre_equipo CHECK (CHAR_LENGTH(nombre_equipo) > 2)
);

-- Tabla 2: Jugadores (Depende completamente de su propia llave primaria sin dependencias parciales)
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    nombre_jugador VARCHAR(60) NOT NULL,
    posicion VARCHAR(30) NOT NULL,
    dorsal INT NOT NULL,
    CONSTRAINT fk_jugador_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE,
    CONSTRAINT chk_dorsal CHECK (dorsal BETWEEN 1 AND 99),
    CONSTRAINT chk_posicion CHECK (posicion IN ('Portero', 'Defensa', 'Centrocampista', 'Delantero'))
);

-- Tabla 3: Estadísticas de Rendimiento por Partido (Cumple 2FN al relacionar atributos que dependen de la entidad compuesta o clave única)
CREATE TABLE rendimiento_partidos (
    id_rendimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    goles_anotados INT NOT NULL,
    asistencias INT NOT NULL,
    tarjetas_amarillas INT NOT NULL,
    minutos_jugados INT NOT NULL,
    CONSTRAINT fk_rendimiento_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador) ON DELETE CASCADE,
    CONSTRAINT chk_goles CHECK (goles_anotados >= 0),
    CONSTRAINT chk_asistencias CHECK (asistencias >= 0),
    CONSTRAINT chk_amarillas CHECK (tarjetas_amarillas >= 0),
    CONSTRAINT chk_minutos CHECK (minutos_jugados BETWEEN 0 AND 90)
);
