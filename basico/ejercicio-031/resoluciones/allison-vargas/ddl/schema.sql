DROP DATABASE IF EXISTS mof_torneo_db;
CREATE DATABASE mof_torneo_db;
USE mof_torneo_db;

CREATE TABLE equipos_moba (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    puntos_ranking INT NOT NULL,
    partidas_ganadas INT NOT NULL,
    partidas_perdidas INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_puntos_positivos CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_partidas_no_negativas CHECK (partidas_ganadas >= 0 AND partidas_perdidas >= 0),
    CONSTRAINT chk_estado_equipo CHECK (estado IN ('Clasificado', 'Eliminado', 'En Espera'))
);
