USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS streamers_equipo(
    streamer_id INT AUTO_INCREMENT PRIMARY KEY,
    nickname_streamer VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    seguidores VARCHAR(100) NOT NULL,
    ingresos_mes DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS transmisiones_stream(
    transmision_id INT AUTO_INCREMENT PRIMARY KEY,
    streamer_id INT NOT NULL,
    titulo_stream VARCHAR(100) NOT NULL,
    espectadores_pico VARCHAR(50) NOT NULL,
    horas_duracion DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transmisiones_stream_streamers_equipo FOREIGN KEY (streamer_id) REFERENCES streamers_equipo(streamer_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_streamers_equipo(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    streamer_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
