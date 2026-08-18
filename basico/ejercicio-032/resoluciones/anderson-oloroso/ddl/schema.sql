USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadores_br(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(100) NOT NULL,
    rango VARCHAR(50) NOT NULL,
    bajas_totales VARCHAR(100) NOT NULL,
    victorias DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
