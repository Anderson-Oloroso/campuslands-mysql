CREATE DATABASE IF NOT EXISTS pingpong_torneo_db;
USE pingpong_torneo_db;

CREATE TABLE categorias_torneo (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    nivel_competencia VARCHAR(50) NOT NULL
);

CREATE TABLE partidos_pingpong (
    id_partido INT PRIMARY KEY AUTO_INCREMENT,
    codigo_partido VARCHAR(20) NOT NULL UNIQUE,
    jugador_uno VARCHAR(80) NOT NULL,
    jugador_dos VARCHAR(80) NOT NULL,
    id_categoria INT,
    sets_jugador_uno INT NOT NULL,
    sets_jugador_dos INT NOT NULL,
    duracion_minutos INT NOT NULL,
    estado_partido ENUM('programado', 'en_curso', 'finalizado', 'suspendido') DEFAULT 'programado',
    FOREIGN KEY (id_categoria) REFERENCES categorias_torneo(id_categoria),
    CONSTRAINT chk_sets_u1 CHECK (sets_jugador_uno >= 0 AND sets_jugador_uno <= 4),
    CONSTRAINT chk_sets_u2 CHECK (sets_jugador_dos >= 0 AND sets_jugador_dos <= 4),
    CONSTRAINT chk_duracion_partido CHECK (duracion_minutos > 0)
);