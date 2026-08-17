DROP DATABASE IF EXISTS pingpong_cte_db;
CREATE DATABASE pingpong_cte_db;
USE pingpong_cte_db;

-- Tabla transaccional para el control de encuentros y rendimiento en pingpong
CREATE TABLE partidos_pingpong (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    jugador_uno VARCHAR(60) NOT NULL,
    jugador_dos VARCHAR(60) NOT NULL,
    fase_torneo VARCHAR(30) NOT NULL,
    sets_jugador_uno INT NOT NULL DEFAULT 0,
    sets_jugador_dos INT NOT NULL DEFAULT 0,
    estado_partido VARCHAR(20) NOT NULL,
    CONSTRAINT chk_sets_uno CHECK (sets_jugador_uno >= 0),
    CONSTRAINT chk_sets_dos CHECK (sets_jugador_dos >= 0),
    CONSTRAINT chk_fase_torneo CHECK (fase_torneo IN ('Octavos', 'Cuartos', 'Semifinal', 'Final', 'Grupos')),
    CONSTRAINT chk_estado_pingpong CHECK (estado_partido IN ('Programado', 'En Juego', 'Finalizado', 'Suspendido'))
);
