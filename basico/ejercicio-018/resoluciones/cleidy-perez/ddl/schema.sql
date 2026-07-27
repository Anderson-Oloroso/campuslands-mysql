-- Campuslands MySQL - basico ejercicio 018
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE reservas_viajes (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    tipo_viaje ENUM('Playa', 'Montaña', 'Ciudad', 'Crucero') NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Confirmado', 'Pendiente', 'Cancelado') DEFAULT 'Pendiente'
);
