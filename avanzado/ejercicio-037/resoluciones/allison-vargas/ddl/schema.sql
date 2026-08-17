DROP DATABASE IF EXISTS liga_futbol_vistas_db;
CREATE DATABASE liga_futbol_vistas_db;
USE liga_futbol_vistas_db;

-- Tabla principal de equipos de la liga
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    ciudad VARCHAR(40) NOT NULL,
    estadio VARCHAR(60) NOT NULL,
    fundacion_año INT NOT NULL,
    CONSTRAINT chk_fundacion CHECK (fundacion_año > 1800)
);

-- Tabla de partidos disputados
CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_local INT NOT NULL,
    id_equipo_visitante INT NOT NULL,
    goles_local INT NOT NULL,
    goles_visitante INT NOT NULL,
    fecha_partido DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_equipo_local FOREIGN KEY (id_equipo_local) REFERENCES equipos(id_equipo),
    CONSTRAINT fk_equipo_visitante FOREIGN KEY (id_equipo_visitante) REFERENCES equipos(id_equipo),
    CONSTRAINT chk_goles_local CHECK (goles_local >= 0),
    CONSTRAINT chk_goles_visitante CHECK (goles_visitante >= 0),
    CONSTRAINT chk_estado_partido CHECK (estado IN ('Programado', 'En Juego', 'Finalizado'))
);

-- Creación de Vista Avanzada 1: Resumen general de partidos con nombres de equipos y diferencia de goles
CREATE VIEW vw_detalle_partidos AS
SELECT 
    p.id_partido AS 'ID Partido',
    el.nombre_equipo AS 'Equipo Local',
    p.goles_local AS 'Goles Local',
    ev.nombre_equipo AS 'Equipo Visitante',
    p.goles_visitante AS 'Goles Visitante',
    p.fecha_partido AS 'Fecha',
    p.estado AS 'Estado',
    ABS(p.goles_local - p.goles_visitante) AS 'Diferencia de Goles'
FROM partidos p
JOIN equipos el ON p.id_equipo_local = el.id_equipo
JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo;

-- Creación de Vista Avanzada 2: Estadísticas consolidadas de rendimiento por equipo (Goles anotados y recibidos)
CREATE VIEW vw_estadisticas_equipos AS
SELECT 
    e.id_equipo AS 'ID',
    e.nombre_equipo AS 'Equipo',
    e.ciudad AS 'Ciudad',
    COUNT(p.id_partido) AS 'Partidos Jugados',
    SUM(CASE WHEN e.id_equipo = p.id_equipo_local THEN p.goles_local ELSE p.goles_visitante END) AS 'Goles Favor',
    SUM(CASE WHEN e.id_equipo = p.id_equipo_local THEN p.goles_visitante ELSE p.goles_local END) AS 'Goles Contra'
FROM equipos e
LEFT JOIN partidos p ON e.id_equipo = p.id_equipo_local OR e.id_equipo = p.id_equipo_visitante
WHERE p.estado = 'Finalizado'
GROUP BY e.id_equipo, e.nombre_equipo, e.ciudad;
