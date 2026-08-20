CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS viajes;

CREATE TABLE viajes (
    id_viaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    categoria ENUM('playa', 'montaña', 'cultural', 'aventura', 'naturaleza') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion_dias TINYINT UNSIGNED NOT NULL,
    fecha_salida DATE NOT NULL,
    temporada ENUM('baja', 'media', 'alta') NOT NULL,
    estado ENUM('disponible', 'agotado', 'cancelado') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_viajes_precio
        CHECK (precio > 0),

    CONSTRAINT chk_viajes_duracion
        CHECK (duracion_dias > 0)
);