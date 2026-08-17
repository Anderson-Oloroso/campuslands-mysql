DROP DATABASE IF EXISTS futbol_sala_update_db;
CREATE DATABASE futbol_sala_update_db;
USE futbol_sala_update_db;

CREATE TABLE partidos_futbol_sala (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local VARCHAR(50) NOT NULL,
    equipo_visitante VARCHAR(50) NOT NULL,
    goles_local INT NOT NULL DEFAULT 0,
    goles_visitante INT NOT NULL DEFAULT 0,
    fecha_partido DATE NOT NULL,
    estado_partido VARCHAR(20) NOT NULL,
    CONSTRAINT chk_goles_local CHECK (goles_local >= 0),
    CONSTRAINT chk_goles_visitante CHECK (goles_visitante >= 0),
    CONSTRAINT chk_estado_partido CHECK (estado_partido IN ('Programado', 'En Juego', 'Finalizado', aplazado))
);
