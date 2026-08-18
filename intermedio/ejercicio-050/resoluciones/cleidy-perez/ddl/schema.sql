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

CREATE TABLE citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tatuador_id INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    estado VARCHAR(30) NOT NULL, -- 'Completada', 'Pendiente', 'Cancelada'
    costo DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (tatuador_id) REFERENCES tatuadores(tatuador_id)
);