USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_futsal(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    patrocinador VARCHAR(100) NOT NULL,
    victorias DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS jugadores_futsal(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nombre_jugador VARCHAR(100) NOT NULL,
    dorsal VARCHAR(50) NOT NULL,
    asistencias DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_jugadores_futsal_equipos_futsal FOREIGN KEY (equipo_id) REFERENCES equipos_futsal(equipo_id) ON DELETE CASCADE
);
