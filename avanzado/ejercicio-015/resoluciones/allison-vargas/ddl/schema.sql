-- DDL: Sistema de biblioteca gamer con estrategias de optimización e índices
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS biblioteca_juegos;

CREATE TABLE biblioteca_juegos (
    juego_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    plataforma ENUM('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch') NOT NULL,
    genero VARCHAR(50) NOT NULL,
    horas_jugadas INT NOT NULL DEFAULT 0 CHECK (horas_jugadas >= 0),
    puntaje_critica DECIMAL(3,1) NOT NULL CHECK (puntaje_critica BETWEEN 0.0 AND 10.0),
    estado_jugado ENUM('completado', 'jugando', 'pendiente', 'abandonado') DEFAULT 'pendiente',
    fecha_adquisicion DATE NOT NULL,
    
    -- Índices estratégicos para optimizar búsquedas frecuentes por plataforma, género y estado
    INDEX idx_plataforma_estado (plataforma, estado_jugado),
    INDEX idx_genero_puntaje (genero, puntaje_critica DESC),
    INDEX idx_horas_jugadas (horas_jugadas DESC)
) ENGINE=InnoDB;
