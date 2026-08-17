-- DDL: Estructura de base de datos y Vistas Avanzadas para Liga de Fútbol
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_tabla_posiciones_resumen;
DROP VIEW IF EXISTS vw_top_goleadores_liga;
DROP TABLE IF EXISTS partidos_liga_avanzado;
DROP TABLE IF EXISTS jugadores_liga_avanzado;
DROP TABLE IF EXISTS equipos_liga_avanzado;

-- Tabla 1: Equipos de la Liga
CREATE TABLE equipos_liga_avanzado (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    fundacion_anio INT NOT NULL CHECK (fundacion_anio >= 1800)
) ENGINE=InnoDB;

-- Tabla 2: Jugadores
CREATE TABLE jugadores_liga_avanzado (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nombre_jugador VARCHAR(80) NOT NULL,
    posicion ENUM('portero', 'defensa', 'centrocampista', 'delantero') NOT NULL,
    goles_anotados INT NOT NULL DEFAULT 0 CHECK (goles_anotados >= 0),
    FOREIGN KEY (equipo_id) REFERENCES equipos_liga_avanzado(equipo_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabla 3: Partidos
CREATE TABLE partidos_liga_avanzado (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT NOT NULL,
    equipo_visitante_id INT NOT NULL,
    goles_local INT NOT NULL DEFAULT 0 CHECK (goles_local >= 0),
    goles_visitante INT NOT NULL DEFAULT 0 CHECK (goles_visitante >= 0),
    fecha_partido DATE NOT NULL,
    estado ENUM('programado', 'finalizado', 'suspendido') NOT NULL DEFAULT 'programado',
    FOREIGN KEY (equipo_local_id) REFERENCES equipos_liga_avanzado(equipo_id),
    FOREIGN KEY (equipo_visitante_id) REFERENCES equipos_liga_avanzado(equipo_id)
) ENGINE=InnoDB;

-- Vista Avanzada 1: Tabla de rendimiento y goles acumulados por equipo
CREATE VIEW vw_tabla_posiciones_resumen AS
SELECT 
    e.equipo_id,
    e.nombre_equipo,
    COUNT(p.partido_id) AS partidos_jugados,
    SUM(CASE 
        WHEN p.equipo_local_id = e.equipo_id THEN p.goles_local 
        WHEN p.equipo_visitante_id = e.equipo_id THEN p.goles_visitante 
        ELSE 0 
    END) AS goles_a_favor,
    SUM(CASE 
        WHEN p.equipo_local_id = e.equipo_id THEN p.goles_visitante 
        WHEN p.equipo_visitante_id = e.equipo_id THEN p.goles_local 
        ELSE 0 
    END) AS goles_en_contra
FROM equipos_liga_avanzado e
LEFT JOIN partidos_liga_avanzado p 
    ON (e.equipo_id = p.equipo_local_id OR e.equipo_id = p.equipo_visitante_id) 
    AND p.estado = 'finalizado'
GROUP BY e.equipo_id, e.nombre_equipo;

-- Vista Avanzada 2: Top Goleadores con información de equipo incorporada
CREATE VIEW vw_top_goleadores_liga AS
SELECT 
    j.jugador_id,
    j.nombre_jugador,
    j.posicion,
    j.goles_anotados,
    e.nombre_equipo
FROM jugadores_liga_avanzado j
INNER JOIN equipos_liga_avanzado e ON j.equipo_id = e.equipo_id
WHERE j.goles_anotados > 0;
