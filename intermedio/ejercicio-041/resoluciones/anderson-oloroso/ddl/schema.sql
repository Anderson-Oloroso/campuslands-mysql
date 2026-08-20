USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_pingpong(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    club VARCHAR(50) NOT NULL,
    ranking_nacional VARCHAR(100) NOT NULL,
    puntos_ranking DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS partidos_pingpong(
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    torneo VARCHAR(100) NOT NULL,
    sets_ganados VARCHAR(50) NOT NULL,
    duracion_min DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_partidos_pingpong_jugadores_pingpong FOREIGN KEY (jugador_id) REFERENCES jugadores_pingpong(jugador_id) ON DELETE CASCADE
);
