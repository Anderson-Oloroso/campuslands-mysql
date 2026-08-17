CREATE DATABASE IF NOT EXISTS torneo_pingpong;
USE torneo_pingpong;

CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    jugador_1 VARCHAR(50) NOT NULL,
    jugador_2 VARCHAR(50) NOT NULL,
    sets_j1 INT DEFAULT 0,
    sets_j2 INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'finalizado',
    
    -- Restricción CHECK: Los sets no pueden ser negativos ni mayores a 3
    CONSTRAINT chk_sets CHECK (sets_j1 >= 0 AND sets_j1 <= 3 AND sets_j2 >= 0 AND sets_j2 <= 3)
);