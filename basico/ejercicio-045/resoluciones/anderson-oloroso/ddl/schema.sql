USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS videojuegos_biblioteca(
    juego_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_juego VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    precio_alquiler DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
