USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS pilotos_carreras(
    piloto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_piloto VARCHAR(100) NOT NULL,
    escuderia VARCHAR(50) NOT NULL,
    vehiculo VARCHAR(100) NOT NULL,
    puntuacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
