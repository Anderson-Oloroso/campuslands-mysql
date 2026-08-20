-- Campuslands MySQL - intermedio ejercicio-033
-- Tema: inventario de skins shooter (GROUP BY)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS skins_inventario;
DROP TABLE IF EXISTS armas_shooter;

CREATE TABLE armas_shooter (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(40) NOT NULL,
    categoria ENUM('Principal','Secundaria','Cuerpo a Cuerpo') NOT NULL,
    estado ENUM('Disponible','Bloqueado') DEFAULT 'Disponible'
);

CREATE TABLE skins_inventario (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    id_arma INT NOT NULL,
    rareza ENUM('Consumer','Restricted','Classified','Covert','Contraband') NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    desgaste ENUM('Recien Fabricado','Casi Nuevo','Algo Desgastado','Bastante Desgastado') NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    FOREIGN KEY (id_arma) REFERENCES armas_shooter(id_arma) ON DELETE CASCADE
);
