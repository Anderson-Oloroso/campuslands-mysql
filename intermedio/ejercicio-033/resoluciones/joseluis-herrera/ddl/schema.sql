CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_skins;

CREATE TABLE inventario_skins (
    id_skin INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(100) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_precio_skin
        CHECK (precio >= 0),

    CONSTRAINT chk_estado_skin
        CHECK (estado IN ('disponible', 'vendida', 'reservada')),

    CONSTRAINT chk_rareza_skin
        CHECK (rareza IN ('comun', 'rara', 'epica', 'legendaria'))
);