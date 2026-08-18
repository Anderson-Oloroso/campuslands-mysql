USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_moba(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    puntos DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS jugadores_moba(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nombre_jugador VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    kda DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_jugadores_moba_equipos_moba FOREIGN KEY (equipo_id) REFERENCES equipos_moba(equipo_id) ON DELETE CASCADE
);
