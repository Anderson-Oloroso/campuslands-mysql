CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS destinos;

CREATE TABLE destinos (
    id_destino INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    tipo_destino ENUM('playa', 'montaña', 'ciudad', 'naturaleza', 'cultural') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion_dias TINYINT UNSIGNED NOT NULL,
    fecha_disponible DATE NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_destinos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_destinos_duracion
        CHECK (duracion_dias > 0)
);