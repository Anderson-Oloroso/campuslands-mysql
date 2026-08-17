DROP DATABASE IF EXISTS futbol_sala_3fn_db;
CREATE DATABASE futbol_sala_3fn_db;
USE futbol_sala_3fn_db;

-- Tabla Maestra 1: Ciudades (Elimina dependencia transitiva de ciudad respecto al equipo)
CREATE TABLE ciudades (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(40) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL DEFAULT 'España'
);

-- Tabla Maestra 2: Equipos de Fútbol Sala (Depende únicamente de su clave primaria, cumpliendo 3FN)
CREATE TABLE equipos_sala (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    id_ciudad INT NOT NULL,
    pabellon VARCHAR(60) NOT NULL,
    CONSTRAINT fk_equipo_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad) ON DELETE RESTRICT
);

-- Tabla Transaccional: Partidos de Fútbol Sala (Atributos plenamente dependientes de la clave del partido)
CREATE TABLE partidos_sala (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_local INT NOT NULL,
    id_equipo_visitante INT NOT NULL,
    goles_local INT NOT NULL DEFAULT 0,
    goles_visitante INT NOT NULL DEFAULT 0,
    fecha_partido DATE NOT NULL,
    estado_partido VARCHAR(20) NOT NULL,
    CONSTRAINT fk_partido_local FOREIGN KEY (id_equipo_local) REFERENCES equipos_sala(id_equipo),
    CONSTRAINT fk_partido_visitante FOREIGN KEY (id_equipo_visitante) REFERENCES equipos_sala(id_equipo),
    CONSTRAINT chk_goles_l CHECK (goles_local >= 0),
    CONSTRAINT chk_goles_v CHECK (goles_visitante >= 0),
    CONSTRAINT chk_estado_3fn CHECK (estado_partido IN ('Programado', 'En Juego', 'Finalizado'))
);
