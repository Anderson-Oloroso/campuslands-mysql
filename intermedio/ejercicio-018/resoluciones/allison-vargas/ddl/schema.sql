-- DDL: Estructura relacional optimizada para análisis agrupado con GROUP BY
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas_groupby;

CREATE TABLE reservas_groupby (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_reserva VARCHAR(15) NOT NULL UNIQUE,
    cliente_nombre VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    categoria ENUM('cultural', 'ecoturismo', 'aventura', 'playa', 'montaña') NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL CHECK (monto_total > 0.00),
    estado ENUM('confirmada', 'completada', 'cancelada') NOT NULL DEFAULT 'confirmada',
    fecha_reserva DATE NOT NULL
) ENGINE=InnoDB;
