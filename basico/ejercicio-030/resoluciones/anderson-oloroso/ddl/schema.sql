USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS streamers_equipo(
    streamer_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname_streamer VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    seguidores VARCHAR(100) NOT NULL,
    ingresos_mes DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
