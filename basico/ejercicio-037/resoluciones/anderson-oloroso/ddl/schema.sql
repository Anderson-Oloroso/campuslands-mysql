USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS equipos_futbol(
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    puntos_liga DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
