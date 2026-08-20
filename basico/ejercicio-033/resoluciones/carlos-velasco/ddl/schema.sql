CREATE DATABASE IF NOT EXISTS inventario_skins_shooter;

USE inventario_skins_shooter;

DROP TABLE IF EXISTS skins;

CREATE TABLE skins (
    id_skin INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(80) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    equipada BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT chk_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_rareza
        CHECK (
            rareza IN (
                'Comun',
                'Rara',
                'Epica',
                'Legendaria'
            )
        )
);