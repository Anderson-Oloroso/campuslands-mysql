-- Campuslands MySQL - basico ejercicio 020
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE citas_tatuajes (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    tatuador VARCHAR(100) NOT NULL,
    estilo ENUM('Realismo', 'Tradicional', 'Neotradicional', 'Minimalista', 'Blackwork') NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0),
    estado ENUM('Agendada', 'Completada', 'Cancelada') DEFAULT 'Agendada',
    fecha_cita DATETIME NOT NULL
);
