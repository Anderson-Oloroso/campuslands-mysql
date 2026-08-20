-- Ejercicio 021: WHERE en dibujo digital

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_dibujo_021;

CREATE TABLE proyectos_dibujo_021 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    estado ENUM('borrador', 'revision', 'aprobado', 'archivado') NOT NULL DEFAULT 'borrador',
    precio DECIMAL(10, 2) NOT NULL,
    horas_estimadas INT NOT NULL,
    fecha_entrega DATE NOT NULL,
    CONSTRAINT chk_selvin_021_precio CHECK (precio >= 0),
    CONSTRAINT chk_selvin_021_horas CHECK (horas_estimadas BETWEEN 1 AND 200)
);
