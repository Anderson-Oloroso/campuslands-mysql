


CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ============================================================
-- CREACION DE TABLA PRINCIPAL
-- ============================================================

CREATE TABLE intermedio_ejercicio_014 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- CREACION DE TABLA DE HISTORIAL
-- ============================================================

CREATE TABLE historial_eventos_014 (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    cantidad_registros INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    ejecutado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);