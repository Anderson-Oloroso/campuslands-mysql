USE campuslands_mysql;

CREATE TABLE ranking_battle_royale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    nivel INT NOT NULL,
    partidas_jugadas INT NOT NULL,
    victorias INT NOT NULL,
    puntaje DECIMAL(8,2) NOT NULL,
    fecha_registro DATE NOT NULL,
    premium BOOLEAN NOT NULL DEFAULT FALSE,
    estado ENUM('Activo', 'Suspendido', 'Retirado') NOT NULL
);