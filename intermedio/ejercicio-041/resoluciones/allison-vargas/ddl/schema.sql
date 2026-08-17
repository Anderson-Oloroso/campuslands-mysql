DROP DATABASE IF EXISTS pingpong_check_db;
CREATE DATABASE pingpong_check_db;
USE pingpong_check_db;

CREATE TABLE partidos_pingpong (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    jugador_uno VARCHAR(60) NOT NULL,
    jugador_dos VARCHAR(60) NOT NULL,
    fase_torneo VARCHAR(30) NOT NULL,
    sets_jugador_uno INT NOT NULL DEFAULT 0,
    sets_jugador_dos INT NOT NULL DEFAULT 0,
    estado_partido VARCHAR(20) NOT NULL,
    CONSTRAINT chk_sets_uno_valido CHECK (sets_jugador_uno >= 0 AND sets_jugador_uno <= 4),
    CONSTRAINT chk_sets_dos_valido CHECK (sets_jugador_dos >= 0 AND sets_jugador_dos <= 4),
    CONSTRAINT chk_fase_valida CHECK (fase_torneo IN ('Octavos', 'Cuartos', 'Semifinal', 'Final', 'Grupos')),
    CONSTRAINT chk_estado_valido CHECK (estado_partido IN ('Programado', 'En Juego', 'Finalizado', 'Suspendido'))
);
