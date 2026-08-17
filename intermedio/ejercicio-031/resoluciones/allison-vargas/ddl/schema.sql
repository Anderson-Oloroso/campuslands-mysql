DROP DATABASE IF EXISTS mof_joins_db;
CREATE DATABASE mof_joins_db;
USE mof_joins_db;

CREATE TABLE patrocinadores (
    id_patrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL,
    sector_industrial VARCHAR(40) NOT NULL,
    presupuesto_anual DECIMAL(12, 2) NOT NULL,
    CONSTRAINT chk_presupuesto_positivo CHECK (presupuesto_anual >= 0.00)
);

CREATE TABLE equipos_moba (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_patrocinador INT NOT NULL,
    nombre_equipo VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    puntos_ranking INT NOT NULL,
    partidas_ganadas INT NOT NULL,
    partidas_perdidas INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_equipo_patrocinador FOREIGN KEY (id_patrocinador) REFERENCES patrocinadores(id_patrocinador),
    CONSTRAINT chk_puntos_positivos CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_partidas_no_negativas CHECK (partidas_ganadas >= 0 AND partidas_perdidas >= 0),
    CONSTRAINT chk_estado_equipo CHECK (estado IN ('Clasificado', 'Eliminado', 'En Espera'))
);
