USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_moba(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    puntos DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
