CREATE TABLE clubes_pingpong (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_club VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    capacidad_mesas INT NOT NULL CONSTRAINT chk_capacidad_mesas CHECK (capacidad_mesas > 0)
);

CREATE TABLE jugadores_pingpong (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    club_id INT NOT NULL,
    codigo_federado VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    mano_dominante VARCHAR(10) NOT NULL CONSTRAINT chk_mano_dominante CHECK (mano_dominante IN ('Diestro', 'Zurdo')),
    puntos_ranking INT NOT NULL DEFAULT 1000 CONSTRAINT chk_puntos_ranking CHECK (puntos_ranking >= 0),
    CONSTRAINT fk_jugadores_clubes 
        FOREIGN KEY (club_id) REFERENCES clubes_pingpong(club_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE torneos_pingpong (
    torneo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_torneo VARCHAR(100) NOT NULL UNIQUE,
    categoria VARCHAR(20) NOT NULL CONSTRAINT chk_categoria_torneo CHECK (categoria IN ('Sub-18', 'Sub-21', 'Sénior', 'Veteranos')),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CONSTRAINT chk_fechas_torneo CHECK (fecha_fin >= fecha_inicio)
);

CREATE TABLE partidos_pingpong (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT NOT NULL,
    jugador1_id INT NOT NULL,
    jugador2_id INT NOT NULL,
    sets_jugador1 INT NOT NULL CONSTRAINT chk_sets_j1 CHECK (sets_jugador1 BETWEEN 0 AND 3),
    sets_jugador2 INT NOT NULL CONSTRAINT chk_sets_j2 CHECK (sets_jugador2 BETWEEN 0 AND 3),
    duracion_minutos INT NOT NULL CONSTRAINT chk_duracion_minutos CHECK (duracion_minutos > 0),
    fase_torneo VARCHAR(30) NOT NULL CONSTRAINT chk_fase_torneo CHECK (fase_torneo IN ('Fase de Grupos', 'Octavos', 'Cuartos', 'Semifinal', 'Final')),
    CONSTRAINT fk_partidos_torneos 
        FOREIGN KEY (torneo_id) REFERENCES torneos_pingpong(torneo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidos_jugador1 
        FOREIGN KEY (jugador1_id) REFERENCES jugadores_pingpong(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidos_jugador2 
        FOREIGN KEY (jugador2_id) REFERENCES jugadores_pingpong(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_jugadores_distintos CHECK (jugador1_id <> jugador2_id),
    CONSTRAINT chk_resultado_valido CHECK (
        (sets_jugador1 = 3 AND sets_jugador2 IN (0, 1, 2)) OR 
        (sets_jugador2 = 3 AND sets_jugador1 IN (0, 1, 2))
    )
);