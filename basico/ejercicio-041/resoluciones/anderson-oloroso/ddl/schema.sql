USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_pingpong(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    club VARCHAR(50) NOT NULL,
    ranking_nacional VARCHAR(100) NOT NULL,
    puntos_ranking DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
