USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_futbol(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    puntos_liga DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS jugadores_futbol(
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nombre_jugador VARCHAR(100) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    goles DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_jugadores_futbol_equipos_futbol FOREIGN KEY (equipo_id) REFERENCES equipos_futbol(equipo_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_equipos_futbol(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
