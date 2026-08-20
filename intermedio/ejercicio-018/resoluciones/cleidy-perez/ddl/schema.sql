-- Campuslands MySQL - intermedio ejercicio 018
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS agencia_viajes;
USE agencia_viajes;

DROP TABLE IF EXISTS reservas;

CREATE TABLE turistas (
    turista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);
CREATE TABLE paquetes_turisticos (
    paquete_id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    precio_por_noche DECIMAL(10, 2) NOT NULL,
    descuento_porcentaje DECIMAL(5, 2) DEFAULT 0.00
);

CREATE TABLE reservas (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    turista_id INT NOT NULL,
    paquete_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    noches INT NOT NULL,
    personas INT NOT NULL,
    FOREIGN KEY (turista_id) REFERENCES turistas(turista_id),
    FOREIGN KEY (paquete_id) REFERENCES paquetes_turisticos(paquete_id)
);