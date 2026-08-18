-- Campuslands MySQL - intermedio ejercicio-030
-- Tema: equipo de streaming (carga de datos)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS dispositivos_setup;
DROP TABLE IF EXISTS canales_streamers;

CREATE TABLE canales_streamers (
    id_streamer INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    plataforma_principal ENUM('Twitch','YouTube Gaming','Kick','Facebook Gaming') NOT NULL,
    seguidores INT NOT NULL DEFAULT 0
);

CREATE TABLE dispositivos_setup (
    id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_hardware VARCHAR(80) NOT NULL,
    id_streamer INT NOT NULL,
    tipo_dispositivo ENUM('Camara / Lente','Microfono XLR','Interfaz de Audio','Capturadora de Video','Controlador / Stream Deck','Iluminacion KeyLight') NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio_usd DECIMAL(7,2) NOT NULL,
    puerto_conexion ENUM('USB-C','XLR','HDMI 2.1','PCIe','Wi-Fi') NOT NULL,
    estado ENUM('En Uso','Repuesto','Danado') DEFAULT 'En Uso',
    FOREIGN KEY (id_streamer) REFERENCES canales_streamers(id_streamer) ON DELETE CASCADE
);
