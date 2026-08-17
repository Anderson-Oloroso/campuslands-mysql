CREATE DATABASE IF NOT EXISTS db_saga_scifi;
USE db_saga_scifi;

DROP TABLE IF EXISTS entregas_saga;

CREATE TABLE entregas_saga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_pelicula VARCHAR(120) NOT NULL,
    director VARCHAR(100) NOT NULL,
    fase_saga VARCHAR(50) NOT NULL,
    fecha_estreno DATE NOT NULL,
    recaudacion_millones DECIMAL(8,2) NOT NULL CHECK (recaudacion_millones >= 0),
    estado ENUM('Estrenado', 'En Produccion', 'Planificado') DEFAULT 'Estrenado'
);