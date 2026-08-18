USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_br(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(100) NOT NULL,
    rango VARCHAR(50) NOT NULL,
    bajas_totales VARCHAR(100) NOT NULL,
    victorias DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS partidas_br(
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    mapa VARCHAR(100) NOT NULL,
    posicion_final VARCHAR(50) NOT NULL,
    bajas_partida DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_partidas_br_jugadores_br FOREIGN KEY (jugador_id) REFERENCES jugadores_br(jugador_id) ON DELETE CASCADE
);
