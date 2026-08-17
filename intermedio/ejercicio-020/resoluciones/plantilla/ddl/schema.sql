-- Campuslands MySQL - intermedio ejercicio 020
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS estudio_tatuajes;
USE estudio_tatuajes;

DROP TABLE IF EXISTS citas;
DROP TABLE IF EXISTS tatuadores;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);


CREATE TABLE tatuadores (
    tatuador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estilo_especialidad VARCHAR(50) NOT NULL -- 'Realismo', 'Tradicional', 'Neotradicional', 'Blackwork'
);