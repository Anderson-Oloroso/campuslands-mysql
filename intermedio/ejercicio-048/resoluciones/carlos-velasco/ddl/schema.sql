CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS viajes;

CREATE TABLE viajes (
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    tipo_viaje VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    duracion_dias INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_duracion_viaje
        CHECK (duracion_dias > 0),

    CONSTRAINT chk_costo_viaje
        CHECK (costo >= 0),

    CONSTRAINT chk_estado_viaje
        CHECK (estado IN ('planificado', 'reservado', 'finalizado', 'cancelado'))
);