CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS saltos;

CREATE TABLE saltos (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    participante VARCHAR(100) NOT NULL,
    nivel ENUM('Principiante', 'Intermedio', 'Avanzado') NOT NULL,
    altura_metros INT NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    fecha_salto DATE NOT NULL,
    estado ENUM('reservado', 'completado', 'cancelado') NOT NULL DEFAULT 'reservado',
    CONSTRAINT chk_altura CHECK (altura_metros >= 1000),
    CONSTRAINT chk_costo CHECK (costo >= 0)
);