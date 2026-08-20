DROP TABLE IF EXISTS partidos_pingpong;
DROP TABLE IF EXISTS torneos_pingpong;
DROP TABLE IF EXISTS jugadores_pingpong;
DROP TABLE IF EXISTS clubes_pingpong;

CREATE TABLE clubes_pingpong (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_club VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    fecha_fundacion DATE NOT NULL
);

CREATE TABLE jugadores_pingpong (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    club_id INT NOT NULL,
    nombre_jugador VARCHAR(100) NOT NULL,
    ranking_nacional INT NOT NULL CONSTRAINT chk_ranking CHECK (ranking_nacional > 0),
    mano_dominante VARCHAR(10) NOT NULL CONSTRAINT chk_mano CHECK (mano_dominante IN ('Derecha', 'Izquierda')),
    CONSTRAINT fk_jugadores_clubes 
        FOREIGN KEY (club_id) REFERENCES clubes_pingpong(club_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE torneos_pingpong (
    torneo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_torneo VARCHAR(100) NOT NULL UNIQUE,
    categoria VARCHAR(30) NOT NULL CONSTRAINT chk_categoria CHECK (categoria IN ('Primera Division', 'Segunda Division', 'Juvenil', 'Master')),
    fecha_inicio DATE NOT NULL
);

CREATE TABLE partidos_pingpong (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT NOT NULL,
    jugador1_id INT NOT NULL,
    jugador2_id INT NOT NULL,
    sets_jugador1 INT NOT NULL DEFAULT 0 CONSTRAINT chk_sets1 CHECK (sets_jugador1 >= 0),
    sets_jugador2 INT NOT NULL DEFAULT 0 CONSTRAINT chk_sets2 CHECK (sets_jugador2 >= 0),
    duracion_minutos INT NOT NULL CONSTRAINT chk_duracion CHECK (duracion_minutos > 0),
    CONSTRAINT fk_partidos_torneos 
        FOREIGN KEY (torneo_id) REFERENCES torneos_pingpong(torneo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidos_jugador1 
        FOREIGN KEY (jugador1_id) REFERENCES jugadores_pingpong(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidos_jugador2 
        FOREIGN KEY (jugador2_id) REFERENCES jugadores_pingpong(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_jugadores_distintos CHECK (jugador1_id <> jugador2_id)
);