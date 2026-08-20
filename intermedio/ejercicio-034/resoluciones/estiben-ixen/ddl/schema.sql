-- Campuslands MySQL - intermedio ejercicio-034
-- Tema: garaje de motos (HAVING)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estacionamiento_motos;
DROP TABLE IF EXISTS propietarios_motos;

CREATE TABLE propietarios_motos (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    estado ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE estacionamiento_motos (
    id_estacionamiento INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    espacio_parqueo VARCHAR(15) NOT NULL UNIQUE,
    id_propietario INT NOT NULL,
    costo_hora DECIMAL(6,2) NOT NULL DEFAULT 5.00,
    fecha_ingreso DATETIME NOT NULL,
    estado ENUM('Activo','Completado','Cancelado') DEFAULT 'Activo',
    FOREIGN KEY (id_propietario) REFERENCES propietarios_motos(id_propietario) ON DELETE CASCADE
);
