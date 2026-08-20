CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS skins;

CREATE TABLE skins (
    id_skin INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL UNIQUE,
    arma VARCHAR(50) NOT NULL,
    rareza ENUM('Comun', 'Rara', 'Epica', 'Legendaria') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'vendida') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_precio_skin
        CHECK (precio >= 0)
);