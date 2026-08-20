USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_futsal(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    patrocinador VARCHAR(100) NOT NULL,
    victorias DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
