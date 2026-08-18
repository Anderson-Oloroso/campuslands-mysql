CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS skins;

CREATE TABLE skins (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible', 'vendida', 'retirada') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_precio
        CHECK (precio >= 0)
);